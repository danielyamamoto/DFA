-export([id/0, specials/0, comments/0, ws/0, numbers/0, plus/0, minus/0, asgn/0, pow/0, mult/0, divi/0]).

id() ->
  M_0 = maps:new(),
  M_0a = maps:put($a,1,M_0),
  M_0b = maps:put($b,1,M_0a),
  M_0c = maps:put($c,1,M_0b),
  M_0d = maps:put($d,1,M_0c),
  M_0e = maps:put($e,1,M_0d),
  M_1a = maps:put($a,1,M_0),
  M_1b = maps:put($b,1,M_1a),
  M_1c = maps:put($c,1,M_1b),
  M_1d = maps:put($d,1,M_1c),
  M_1e = maps:put($e,1,M_1d),
  M_1_0 = maps:put($0,1,M_1e),
  M_1_1 = maps:put($1,1,M_1_0),
  M_1_2 = maps:put($2,1,M_1_1),
  M_1_3 = maps:put($3,1,M_1_2),
  M_1_4 = maps:put($4,1,M_1_3),
  M_1_5 = maps:put($5,1,M_1_4),
  M_1_6 = maps:put($6,1,M_1_5),
  M_1_7 = maps:put($7,1,M_1_6),
  M_1_8 = maps:put($8,1,M_1_7),
  M_1_9 = maps:put($9,1,M_1_8),
  M_1_EQ = maps:put($=,2,M_1_9),
  M_1_PLUS = maps:put($+,2,M_1_EQ),
  M_1_MINUS = maps:put($-,2,M_1_PLUS),
  M_1_STAR = maps:put($*,2,M_1_MINUS),
  M_1_SLASH = maps:put($/,2,M_1_STAR),
  M_1_DOT = maps:put($.,2,M_1_SLASH),
  M_1_LP = maps:put($(,2,M_1_DOT),
  M_1_RP = maps:put($),2,M_1_LP),
  M_1_SP = maps:put($  ,2,M_1_RP),
  M_1_DOL = maps:put($$,2,M_1_SP),
  M_1_LF = maps:put($\n,2,M_1_DOL),
  {maps:put(1,M_1_LF, maps:put(0, M_0e, M_0)), [{2,$*, "Variable"}]}.

specials() ->
  M_0 = maps:new(),
  M_0_LEFT = maps:put($(,1,M_0),
  M_0_RIGHT = maps:put($),2,M_0_LEFT),
  {maps:put(0, M_0_RIGHT, M_0), [{1, no, "Parentesis que abre" }, {2, no, "Parentesis que cierra"}]}.
  
comments() ->
{#{0 => #{47 => 1},
  1 =>
      #{9 => 3,10 => 3,13 => 3,32 => 3,36 => 3,40 => 3,41 => 3,
        43 => 3,46 => 3,47 => 2,48 => 3,49 => 3,50 => 3,51 => 3,
        52 => 3,53 => 3,54 => 3,55 => 3,56 => 3,57 => 3,61 => 3,
        94 => 3,97 => 3,98 => 3,99 => 3,100 => 3,101 => 3},
  2 =>
      #{9 => 2,10 => 4,13 => 2,32 => 2,36 => 2,40 => 2,41 => 2,
        43 => 2,46 => 2,47 => 2,48 => 2,49 => 2,50 => 2,51 => 2,
        52 => 2,53 => 2,54 => 2,55 => 2,56 => 2,57 => 2,61 => 2,
        94 => 2,97 => 2,98 => 2,99 => 2,100 => 2,101 => 2}},
  [{3,$*,"Division"}, {4,$*,"Comentario"}]}.

numbers() ->
{#{0 =>
      #{48 => 1,49 => 1,50 => 1,51 => 1,52 => 1,53 => 1,54 => 1,
        55 => 1,56 => 1,57 => 1},
  1 =>
      #{9 => 7,10 => 7,13 => 7,32 => 7,36 => 7,40 => 7,41 => 7,
        43 => 7,45 => 7,46 => 2,47 => 7,48 => 1,49 => 1,50 => 1,
        51 => 1,52 => 1,53 => 1,54 => 1,55 => 1,56 => 1,57 => 1,
        61 => 7,69 => 4,94 => 7,97 => 7,98 => 7,99 => 7,100 => 7,
        101 => 4,102 => 7,103 => 7,104 => 7,105 => 7,106 => 7,
        107 => 7},
  2 =>
      #{48 => 3,49 => 3,50 => 3,51 => 3,52 => 3,53 => 3,54 => 3,
        55 => 3,56 => 3,57 => 3},
  3 =>
      #{9 => 8,10 => 8,13 => 8,32 => 8,36 => 8,40 => 8,41 => 8,
        43 => 8,45 => 8,46 => 8,47 => 8,48 => 3,49 => 3,50 => 3,
        51 => 3,52 => 3,53 => 3,54 => 3,55 => 3,56 => 3,57 => 3,
        61 => 8,69 => 4,94 => 8,97 => 8,98 => 8,99 => 8,100 => 8,
        101 => 4,102 => 8,103 => 8,104 => 8,105 => 8,106 => 8,
        107 => 8},
  4 =>
      #{43 => 5,45 => 5,48 => 6,49 => 6,50 => 6,51 => 6,52 => 6,
        53 => 6,54 => 6,55 => 6,56 => 6,57 => 6},
  5 =>
      #{48 => 6,49 => 6,50 => 6,51 => 6,52 => 6,53 => 6,54 => 6,
        55 => 6,56 => 6,57 => 6},
  6 =>
      #{9 => 9,10 => 9,13 => 9,32 => 9, 36 => 9,40 => 9,41 => 9,
        43 => 9,45 => 9,46 => 9,47 => 9,48 => 6,49 => 6,50 => 6,
        51 => 6,52 => 6,53 => 6,54 => 6,55 => 6,56 => 6,57 => 6,
        61 => 9,69 => 9,94 => 9,97 => 9,98 => 9,99 => 9,100 => 9,
        101 => 9,102 => 9,103 => 9,104 => 9,105 => 9,106 => 9,
        107 => 9}},
  [{7,$*,"Entero"}, {8,$*,"Real"}, {9,$*,"Numero con notacion cientifica"}]}.

ws() ->
  M_0 = maps:new(),
  M_0_BLANK = maps:put(32,1,M_0),
  M_0_LF = maps:put($\n,1,M_0_BLANK),
  M_1_BLANK = maps:put(32,1,M_0),
  M_1_LF = maps:put($\n,1,M_1_BLANK),
  M_1a = maps:put($a,2,M_1_LF),
  M_1b = maps:put($b,2,M_1a),
  M_1c = maps:put($c,2,M_1b),
  M_1d = maps:put($d,2,M_1c),
  M_1e = maps:put($e,2,M_1d),
  M_1_0 = maps:put($0,2,M_1e),
  M_1_1 = maps:put($1,2,M_1_0),
  M_1_2 = maps:put($2,2,M_1_1),
  M_1_3 = maps:put($3,2,M_1_2),
  M_1_4 = maps:put($4,2,M_1_3),
  M_1_5 = maps:put($5,2,M_1_4),
  M_1_6 = maps:put($6,2,M_1_5),
  M_1_7 = maps:put($7,2,M_1_6),
  M_1_8 = maps:put($8,2,M_1_7),
  M_1_9 = maps:put($9,2,M_1_8),
  M_1_EQ = maps:put($=,2,M_1_9),
  M_1_POW = maps:put($^,2,M_1_EQ),
  M_1_PLUS = maps:put($+,2,M_1_POW),
  M_1_MINUS = maps:put($-,2,M_1_PLUS),
  M_1_STAR = maps:put($*,2,M_1_MINUS),
  M_1_SLASH = maps:put($/,2,M_1_STAR),
  M_1_DOT = maps:put($.,2,M_1_SLASH),
  M_1_LP = maps:put($(,2,M_1_DOT),
  M_1_RP = maps:put($),2,M_1_LP),
  M_1_DOL = maps:put($$,2,M_1_RP),
  {maps:put(1, M_1_DOL, maps:put(0,M_0_LF, M_0)), [{2, $*, "Blanco" }]}.

plus() ->
  M_0 = maps:new(),
  M_0_PLUS = maps:put($+,1,M_0),
  {maps:put(0, M_0_PLUS, M_0), [{1,no,"Suma"}]}.

asgn() ->
  M_0 = maps:new(),
  M_0_ASSIGN = maps:put($=,1,M_0),
  {maps:put(0, M_0_ASSIGN, M_0), [{1,no,"Asignacion"}]}.

minus() ->
  M_0 = maps:new(),
  M_0_MIN = maps:put($-,1,M_0),
  {maps:put(0, M_0_MIN, M_0), [{1,no,"Resta"}]}.

mult() ->
  M_0 = maps:new(),
  M_0_MULT = maps:put($*,1,M_0),
  {maps:put(0, M_0_MULT, M_0), [{1,no,"Multiplicacion"}]}.

pow() ->
  M_0 = maps:new(),
  M_0_EXP = maps:put($^,1,M_0),
  {maps:put(0, M_0_EXP, M_0), [{1,no,"Potencia"}]}.

divi() ->
  M_0 = maps:new(),
  M_0_DIV = maps:put($/,1,M_0),
  {maps:put(0, M_0_DIV, M_0), [{1,no,"Division"}]}. 