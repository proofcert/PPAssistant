module interact.

accumulate lists.
accum_sig interact.

decide_ke (interact (unary (decideI no_index) leaf) [] [choose_decide] _ _) _ _.
decide_ke (interact (unary (decideI I) L) [auto|Com] Choice FI E) I (interact L Com Choice (u FI) E).
decide_ke (interact (unary (decideI I) L) [I|Com] Choice FI E) I (interact L Com Choice (u FI) E).

store_kc (interact (unary (storeI I F) L) Com Choice FI E) F FI (interact L Com Choice (u FI) E).

release_ke (interact (unary releaseI L) Com Choice FI E) (interact L Com Choice (u FI) E).

initial_ke (interact (axiom (initialI I)) [] [] _ _) I.

orNeg_kc (interact (unary (orNegI F) L) Com Choice FI E) F (interact L Com Choice (u FI) E).

andNeg_kc (interact (binary (andNegI F) L1 L2) [branch LC RC] Choice FI E) F (interact L1 LC Choice (l FI) E) (interact L2 RC Choice (r FI) E).

all_kc (interact (unary allI L) Com Choice FI E) F (Eigen\ (interact L) Com Choice (u FI) [eigen FI Eigen| E]).

some_ke (interact (unary (someI no_term) leaf) [] [choose_some] _ _) _ _.
some_ke (interact (unary (someI T) L) [EI|Com] Choice FI E) T (interact L Com Choice (u FI) E) :-
  member (eigen EI T) E.
