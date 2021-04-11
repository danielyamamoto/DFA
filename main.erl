-module(main).
-export([lee/2, dfa/5, escape/1, csv/1, lexerAritmetico/1]).
-include("transitions_maps.erl").

lexerAritmetico(Str) ->
  DFAS = [comments(), specials(), id(), ws(), numbers(), asgn(), mult(), divi(), plus(), minus(), pow()],
  {ok,DF} = file:open(Str,write),
  io:format(DF, "~-30s~-30s\n",["Lexema","Token"]),
  Str3 = lee("expresiones.txt","$"),
  lex(Str3, DFAS, DF).

lex(_,[],_) -> error;
lex("$",_,_) -> "ok";
lex(Str3,[H|T], File) -> 
  {MAPA, ESTADOS} = H, 
    case dfa(0,Str3,MAPA,ESTADOS,"") of
      {accepted, String, Lexeme, Token} ->
        io:format(File, "~-30s~-30s\n", [Lexeme, Token]),
        DFAS = [comments(), specials(), id(), ws(), numbers(), asgn(), mult(), divi(), plus(), minus(), pow()],
        lex(String, DFAS, File);
      {rejected, String} ->
        lex(Str3,T,File)
    end.

dfa(State,String, Move, Accepted, Lexeme) ->
  case search(State, Accepted) of
    {value, {State, Star, Token}} ->
      case Star of
        $* ->
          X1 = lists:last(Lexeme),
          Lexeme1 = lists:droplast(Lexeme),
          {accepted, [X1 | String], Lexeme1, Token};
        _ -> {accepted, String, Lexeme, Token}
      end;
    _          ->
      case maps:get(State, Move,error) of
        error -> {rejected, String};
        Move1 ->
          [X| Xs] = String,
          case maps:get(X, Move1, error) of
            error -> {rejected, String};
            State1 -> dfa(State1, Xs, Move, Accepted, Lexeme ++ [X])
          end
      end
  end.

%search(State, States)
search(_, []) -> false;
search(State, [H | T]) ->
  case H of
    {State, Star, Token} -> {value, {State, Star, Token}};
    _ -> search(State, T)
  end.

lee(Archivo, Terminador) ->
  {ok, Contenido} = file:read_file(Archivo),
  binary_to_list(Contenido) ++ Terminador.

escape(Lst) ->
  case Lst of
     "\\n" -> $\n;
     "\\t" -> $\t;
     "\\r" -> $\r;
     "\\s" -> $ ;
     _ -> hd(Lst)
  end.

csv(Lst) ->
  [H | Data ] = [binary_to_list(X) || X <- re:split(Lst, "\r|\n|\r\n")],
  Hs = [escape(binary_to_list(D)) || D <- re:split(H, ",")],
  csv(Hs, Data, 0, maps:new()).

csv(_, [], _, Map) -> Map;
csv(_, [[]], _, Map) -> Map;
csv(H, [X | Xs], State, Map) when X =/= [] ->
  Data = [binary_to_integer(string:trim(D, both)) || D <- re:split(X, ",")],
  csv(H, Xs, State + 1, maps:put(State, maps:from_list(kvs(H,Data)), Map)).

kvs([], _) -> [];
kvs(_, []) -> [];
kvs([K | Ks], [V | Vs]) ->
    [{K, V} | kvs(Ks, Vs)].