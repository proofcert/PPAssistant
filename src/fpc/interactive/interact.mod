module interact.

accumulate lists.
accum_sig interact.

decide_ke (interact (unary (decideI no_index) leaf) [] _ _) _ _ :- !,
  output std_out "You have to choose an index of a formula to decide on from the context",
  output std_out "\n", fail.

decide_ke (interact (unary (decideI I) L) [I|Com] FI E) I (interact L Com (u FI) E).

store_kc (interact (unary (storeI I) L) Com I E) F I (interact L Com (u I) E) :-
  output std_out "Adding to context formula ",
  term_to_string F S1,
  output std_out S1,
  output std_out " with index ",
  term_to_string I S2,
  output std_out S2,
  output std_out "\n".

release_ke (interact (unary releaseI L) Com FI E) (interact L Com (u FI) E).

initial_ke (interact (axiom (initialI I)) [] _ _) I.

orNeg_kc (interact (unary (orNegI FI) L) Com FI E) F (interact L Com (u FI) E).

andNeg_kc (interact (binary (andNegI FI) L1 L2) [branch LC RC] FI E) F (interact L1 LC (l FI) E) (interact L2 RC (r FI) E).

all_kc (interact (unary (allI FI) L) Com FI E) F (Eigen\ (interact L) Com (u FI) [eigen FI Eigen| E]) :-
  output std_out "Using eigen variable ",
  term_to_string FI S1,
  output std_out S1,
  output std_out "\n".

some_ke (interact (unary (someI no_index) leaf) [] _ _) _ _ :- !,
  output std_out "You have to choose the term to use for instantiation",
  output std_out "\n", fail.

some_ke (interact (unary (someI FI) L) [T|Com] FI E) T' (interact L Com (u FI) E) :-
  apply_vars T E T'.

apply_vars T [] T.
apply_vars T [eigen _ X|L] T' :-
  apply_vars (T X) L T'.
