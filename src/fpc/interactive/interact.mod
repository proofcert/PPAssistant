module interact.

accum_sig interact.


decide_ke (interact (unary (decideI no_index) leaf) [] [choose_decide] _) _ _.
decide_ke (interact (unary (decideI I) L) [auto|Com] Choice FI) I (interact L Com Choice (u FI)).
decide_ke (interact (unary (decideI I) L) [I|Com] Choice FI) I (interact L Com Choice (u FI)).

store_kc (interact (unary (storeI F I) L) Com [formula FI F I|Choice] FI) F I (interact L Com Choice (u FI)).

release_ke (interact (unary releaseI L) Com Choice FI) (interact L Com Choice (u FI)).

initial_ke (interact (axiom (initialI I)) [] [] _) I.

orNeg_kc (interact (unary (orNegI F) L) Com Choice FI) F (interact L Com Choice (u FI)).

andNeg_kc (interact (binary (andNegI F) L1 L2) [branch LC RC] Choice FI) F (interact L1 LC Choice (l FI)) (interact L2 RC Choice (r FI)).

all_kc (interact (unary allI L) Com [eigen_var FI|Choice] FI) (Eigen\ (interact L) Com Choice (u FI)).

some_ke (interact (unary (someI T) L) Com Choice FI) T  (interact L Com Choice (u FI)).
some_ke (interact (unary (someI no_term) leaf) [] [choose_some] _) _ _.
