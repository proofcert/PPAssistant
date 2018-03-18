module interact.

accumulate lists.
accum_sig interact.

decide_ke (interact (unary (decideI no_index) leaf) [] [choose_decide] _ _) _ _ :- !,
  output std_out "You have to choose an index of a formula to decide on from the context",
  output std_out "\n", fail.

decide_ke (interact (unary (decideI I) L) [auto|Com] Choice FI E) I (interact L Com Choice (u FI) E).
decide_ke (interact (unary (decideI I) L) [I|Com] Choice FI E) I (interact L Com Choice (u FI) E).

store_kc (interact (unary (storeI I) L) Com Choice I E) F I (interact L Com Choice (u I) E) :-
  output std_out "Adding to context formula ",
  term_to_string F S1,
  output std_out S1,
  output std_out " with index ",
  term_to_string I S2,
  output std_out S2,
  output std_out "\n".

release_ke (interact (unary releaseI L) Com Choice FI E) (interact L Com Choice (u FI) E).

initial_ke (interact (axiom (initialI I)) [] [] _ _) I.

orNeg_kc (interact (unary (orNegI FI) L) Com Choice FI E) F (interact L Com Choice (u FI) E).

andNeg_kc (interact (binary (andNegI FI) L1 L2) Com Choice FI E) F (interact L1 Com Choice (l FI) E) (interact L2 Com Choice (r FI) E).

box_kc (interact (unary (boxI FI) L) Com Choice FI E) F (Eigen\ (interact L) Com Choice (u FI) [eigen FI Eigen| E]) :-
  output std_out "Using world variable ",
  term_to_string FI S1,
  output std_out S1,
  output std_out "\n".

dia_ke (interact (unary (diaI no_index) leaf) [] [choose_some] _ _) F _ _ :- !,
  output std_out "You have to choose the world to use for instatiation for the formula: ",
  term_to_string F S1,
  output std_out S1,
  output std_out "\n", fail.

dia_ke (interact (unary (diaI FI) L) [auto|Com] Choice FI E) _ T (interact L Com Choice (u FI) E) :-
  member (eigen _ T) E.
dia_ke (interact (unary (diaI FI) L) [EI|Com] Choice FI E) _ T (interact L Com Choice (u FI) E) :-
  member (eigen EI T) E.
