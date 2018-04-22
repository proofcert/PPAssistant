module tactics.

decide_ke (interact (unary (decideI I) L) [auto|Com] FI E1 E2) I (interact L Com (u FI) E1 E2).
dia_ke (interact (unary (diaI FI) L) [world|Com] FI E1 E2) _ T (interact L Com (u FI) E1 E2) :-
  apply_vars T E1 T'.
some_ke (interact (unary (someI FI) L) [var|Com] FI E1 E2) _ _ (interact L Com (u FI) E1 E2) :- !.
