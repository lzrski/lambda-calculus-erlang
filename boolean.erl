-module(boolean).

-export([ test/0, main/0, main/1 ]).

main() ->
  main([]).
main(_Args) ->
  io:format("~w~n", [ test() ]),
  erlang:halt(0).

test() ->
  True = fun (A, _) ->
    A
  end,

  False = fun(_, B) ->
    B
  end,

  Not = fun(A) ->
    A(False, True)
  end,
  False = Not(True),
  True = Not(False),

  And = fun(A, B) ->
    A(B, False)
  end,
  True = And(True, True),
  False = And(False, True),
  False = And(True, False),
  False = And(False, False),

  Or = fun(A, B) ->
    A(True, B)
  end,
  True = Or(True, True),
  True = Or(False, True),
  True = Or(True, False),
  False = Or(False, False),

  Xor = fun(A, B) ->
    A(Not(B), B)
  end,
  False = Xor(True, True),
  True = Xor(False, True),
  True = Xor(True, False),
  False = Xor(False, False),

  Implies = fun(A, B) ->
    A(B, True)
  end,
  True = Implies(True, True),
  True = Implies(False, True),
  False = Implies(True, False),
  True = Implies(False, False),

  Equivalent = fun(A, B) ->
    A(B, Not(B))
  end,
  True = Equivalent(True, True),
  False = Equivalent(False, True),
  False = Equivalent(True, False),
  True = Equivalent(False, False),

  ok.
