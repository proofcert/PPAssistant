% Copyright Tomer Libal 2018

module lmf-kernel.
accumulate lists.

% Entry point
entry_point Cert Form :-
  check Cert (unfK [Form]).

%%%%%%%%%%%%%%%%%%
% Structural Rules
%%%%%%%%%%%%%%%%%%

% decide
check Cert (unfK []) :-
  decide_ke Cert Indx Cert',
  inCtxt Indx P,
  isPos P,
  check Cert' (foc P).
% release
check Cert (foc N) :-
  isNeg N,
  release_ke Cert Cert',
  check Cert' (unfK [N]).
% store
check Cert (unfK [C|Rest]) :-
  (isPos C ; isNegAtm C),
  store_kc Cert C Indx Cert',
  inCtxt Indx C => check Cert' (unfK Rest).
% initial
check Cert (foc (lform L (p A))) :-
  initial_ke Cert Indx,
  inCtxt Indx (lform L (n A)).

%%%%%%%%%%%%%%%%%%%%
% Asynchronous Rules
%%%%%%%%%%%%%%%%%%%%

% orNeg
check Cert (unfK [lform L (A !-! B) | Rest]) :-
  orNeg_kc Cert (lform L (A !-! B))  Cert',
  check Cert' (unfK [lform L A, lform L B| Rest]).
% conjunction
check Cert (unfK [lform L (A &-& B) | Rest]) :-
  andNeg_kc Cert (lform L (A &-& B)) CertA CertB,
  check CertA (unfK [lform L A | Rest]),
  check CertB (unfK [lform L B | Rest]).
% box
check Cert (unfK [lform L (box B) | Theta]) :-
  box_kc Cert (lform L (box B)) Cert',
  pi w\ rel L w => check (Cert' w) (unfK [lform w B | Theta] ).
% forall
check Cert (unfK [lform L (all B) | Theta]) :-
  all_kc Cert (all B) Cert',
  pi w\ (check (Cert' w) (unfK [lform L (B w) | Theta] )).

%%%%%%%%%%%%%%%%%%%
% Synchronous Rules
%%%%%%%%%%%%%%%%%%%

% disjunction
check Cert (lform L (foc (A !+! B))) :-
  orPos_ke Cert (lform L (A !+! B)) Choice Cert',
  ((Choice = left,  check Cert' (foc (lform L A)));
   (Choice = right, check Cert' (foc (lform L B)))).
% modality
check Cert (foc (lform L (dia B))) :-
  dia_ke Cert (lform L (dia B)) T Cert',
  rel L T,
  check Cert' (foc (lform T B)).
% quantifier
check Cert (foc (lform L (some B))) :-
  some_ke Cert (lform L (some B)) T Cert',
  check Cert' (foc (lform L (B T))).

%%%%%%%%%%%
% Utilities
%%%%%%%%%%%

isNegForm (_ &-& _).
isNegForm (_ !-! _).
isNegForm (box _).
isNegForm (all _).
isPosForm (_ &+& _).
isPosForm (_ !+!  _).
isPosForm (dia _).
isPosForm (some _).


isNegAtm (lform _ (n _)).
isPosAtm (lform _ (p _)).
isAtm A :- isNegAtm A ; isPosAtm A.

isNeg (lform _ A) :- isNegForm A ; isNegAtm (lform _ A).
isPos (lform _ A) :- isPosForm A ; isPosAtm (lform _ A).
