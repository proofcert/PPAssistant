module interact.

decide_ke (interact (unary (decideI none) terminate) [] (choose_decide) _) _ _.
decide_ke (interact (unary (decideI F) L) [auto|Com] Choice FI) F (interact L Com Choice (u FI)).
decide_ke (interact (unary (decideI F) L) [F|Com] Choice FI) F (interact L Com Choice (u FI)).

store_kc (interact (unary (storeI F I) L) Com [store FI F I|Choice] FI) F I (interact L Com Choice (u FI)).

release_ke (interact (unary releaseI L) Com Choice FI) (interact L Com Choice (u FI)).

initial_ke (interact (initialI I) [] none _) I.

orNeg_kc (interact (unary (orNegI F) L) Com Choice FI) F (interact L Com Choice (u FI)).

andNeg_kc (interact (binary (andNegI F) L1 L2) (com LC RC) Choice FI) F (interact L1 LC Choice (l FI)) (interact L2 RC Choice (r FI)).

all_kc (interact (unary allI L) Com [all FI|Choice] FI) (Eigen\ (interact L) Com Choice (u FI)).

some_ke (interact (unary (someI T) L) Com Choice FI) T  (interact L Com Choice (u FI)).
some_ke (interact (unary (someI none) terminate) [] (choose_some) _) _ _.
