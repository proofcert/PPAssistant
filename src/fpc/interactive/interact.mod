module interact.

decide_ke (interact (unary (decide none) terminate) [] (choose_decide) _) _ _.
decide_ke (interact (unary (decide F) L) [auto|Com] Choice FI) F (interact L Com Choice (u FI)).
decide_ke (interact (unary (decide F) L) [F|Com] Choice FI) F (interact L Com Choice (u FI)).

store_kc (interact (unary (store F I) L) Com [store FI F I|Choice] FI) F I (interact L Com Choice (u FI)).

release_ke (interact (unary release L) Com Choice FI) (interact L Com Choice (u FI)).

initial_ke (interact (initial I) [] none _) I.

orNeg_kc (interact (unary (orNeg F) L) Com Choice FI) F (interact L Com Choice (u FI)).

andNeg_kc (interact (binary (andNeg F) L1 L2) (com LC RC) Choice FI) F (interact L1 LC Choice (l FI)) (interact L2 RC Choice (r FI)).

all_kc (interact (unary all L) Com [all FI|Choice] FI) (Eigen\ (interact L) Com Choice (u FI)).

some_ke (interact (unary (some T) L) Com Choice FI) T  (interact L Com Choice (u FI)).
some_ke (interact (unary (some none) terminate) [] (choose_some) _) _ _.
