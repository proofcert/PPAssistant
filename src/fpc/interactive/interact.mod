module interact.

accumulate lists.
accum_sig interact.

decide_ke (interact (unary (decideI no_index) leaf) [] _ FI _ _) _ _ :- !,
  output std_out "You have to choose an index of a formula to decide on from the context",
  output std_out "\nAt index: ",
  term_to_string FI S2,
  output std_out S2,
  output std_out "\n", fail.

decide_ke (interact (unary (decideI I) L) [I|Com] OCom FI E1 E2) I (interact L Com OCom (u FI) E1 E2).

store_kc (interact (unary (storeI I) L) Com OCom I E1 E2) F I (interact L Com OCom (u I) E1 E2) :-
  output std_out "Adding to context formula ",
  term_to_string F S1,
  output std_out S1,
  output std_out " with index ",
  term_to_string I S2,
  output std_out S2,
  output std_out "\n".

release_ke (interact (unary releaseI L) Com OCom FI E1 E2) (interact L Com OCom (u FI) E1 E2).

initial_ke (interact (axiom (initialI I)) Com Com  _ _ _) I :-
  output std_out "Closed branch ",
  term_to_string I S1,
  output std_out S1,
  output std_out "\n".

serial1_kc (interact (unary (diaI FI) L) [] OCom FI E1 E2) F _ :-
  output std_out "Should I apply seriality on ",
  term_to_string F S1,
  output std_out S1,
  output std_out "\n", fail.

serial1_kc (interact (unary (diaI FI) L) [serial|Com] OCom FI E1 E2) F (Eigen\ (interact L) Com OCom (u FI) [eigen FI Eigen| E1] E2) :-
  output std_out "Using world variable ",
  term_to_string FI S1,
  output std_out S1,
  output std_out "\n".

orNeg_kc (interact (unary (orNegI FI) L) Com OCom FI E1 E2) F (interact L Com OCom (u FI) E1 E2).

andNeg_kc (interact (binary (andNegI FI) L1 L2) Com OCom FI E1 E2) F (interact L1 Com OCom1 (l FI) E1 E2) (interact L2 OCom1 OCom (r FI) E1 E2) :- !.

box1_kc (interact (unary (box1I FI) L) Com OCom FI E1 E2) F (Eigen\ (interact L) Com OCom (u FI) [eigen FI Eigen| E1] E2) :-
  output std_out "Using world variable ",
  term_to_string FI S1,
  output std_out S1,
  output std_out "\n".

dia1_ke (interact (unary (dia1I no_index) leaf) [] _ FI _ _) F _ _ :- !,
  output std_out "You have to choose the world to use for instatiation for the formula: ",
  term_to_string F S1,
  output std_out S1,
  output std_out "\nAt index: ",
  term_to_string FI S2,
  output std_out S2,
  output std_out "\n", fail.

dia1_ke (interact (unary (dia1I FI) L) [W|Com] OCom FI E1 E2) _ W' (interact L Com OCom (u FI) E1 E2) :-
  apply_vars W E1 W'.


box2_kc (interact (unary (box2I FI) L) Com OCom FI E1 E2) F (Eigen\ (interact L) Com OCom (u FI) E1 [eigen FI Eigen| E2]) :-
  output std_out "Using world variable ",
  term_to_string FI S1,
  output std_out S1,
  output std_out "\n".

dia2_ke (interact (unary (dia2I no_index) leaf) [] _ FI _ _) F _ _ :- !,
  output std_out "You have to choose the world to use for instatiation for the formula: ",
  term_to_string F S1,
  output std_out S1,
  output std_out "\nAt index: ",
  term_to_string FI S2,
  output std_out S2,
  output std_out "\n", fail.

dia2_ke (interact (unary (dia2I FI) L) [W|Com] OCom FI E1 E2) _ W' (interact L Com OCom (u FI) E1 E2) :-
  apply_vars W E2 W'.

apply_vars T [] T.
apply_vars T [eigen _ X|L] T' :-
  apply_vars (T X) L T'.

