module tactics.

decide_ke (interact (unary (decideI I) L) [auto|Com] OCom FI E1 E2) I (interact L Com OCom (u FI) E1 E2).
dia1_ke (interact (unary (diaI FI) L) [world|Com] OCom FI E1 E2) _ T (interact L Com OCom (u FI) E1 E2) :-
  apply_vars T E1 T'.
