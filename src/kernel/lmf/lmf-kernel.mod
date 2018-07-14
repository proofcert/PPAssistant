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
% box1
check Cert (unfK [lform L (box1 B) | Theta]) :-
  box1_kc Cert (lform L (box1 B)) Cert',
  pi w\ rel1 L w => check (Cert' w) (unfK [lform w B | Theta] ).
% box2
check Cert (unfK [lform L (box2 B) | Theta]) :-
  box2_kc Cert (lform L (box2 B)) Cert',
  pi w\ rel2 L w => check (Cert' w) (unfK [lform w B | Theta] ).

%%%%%%%%%%%%%%%%%%%
% Synchronous Rules
%%%%%%%%%%%%%%%%%%%

% disjunction
check Cert (lform L (foc (A !+! B))) :-
  orPos_ke Cert (lform L (A !+! B)) Choice Cert',
  ((Choice = left,  check Cert' (foc (lform L A)));
   (Choice = right, check Cert' (foc (lform L B)))).
% modality 1
check Cert (foc (lform L (dia1 B))) :-
  dia1_ke Cert (lform L (dia1 B)) T Cert',
  rel1 L T,
  check Cert' (foc (lform T B)).
% seriality 1
check Cert (foc (lform L (dia1 B))) :-
  serial1_kc Cert (lform L (dia1 B)) Cert',
  pi w\ rel1 L w => check (Cert' w) (foc (lform w B) ).
% modality 2
check Cert (foc (lform L (dia2 B))) :-
  dia2_ke Cert (lform L (dia2 B)) T Cert',
  rel2 L T,
  check Cert' (foc (lform T B)).

%%%%%%%%%%%
% Utilities
%%%%%%%%%%%

isNegForm (_ &-& _).
isNegForm (_ !-! _).
isNegForm (box1 _).
isNegForm (box2 _).
isPosForm (_ &+& _).
isPosForm (_ !+!  _).
isPosForm (dia1 _).
isPosForm (dia2 _).


isNegAtm (lform _ (n _)).
isPosAtm (lform _ (p _)).
isAtm A :- isNegAtm A ; isPosAtm A.

isNeg (lform _ A) :- isNegForm A ; isNegAtm (lform _ A).
isPos (lform _ A) :- isPosForm A ; isPosAtm (lform _ A).
