module tactic.

decide_ke (interact (unary (decideI I) L) [auto|Com] FI E) I (interact L Com (u FI) E).
some_ke (interact (unary (someI FI) L) [var|Com] Choice FI E1 E2) _ _ (interact L Com Choice (u FI) E1 E2) :- !.
