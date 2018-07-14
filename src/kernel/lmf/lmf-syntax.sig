% Copyright Tomer Libal 2018
sig lmf-syntax.

kind cert, index, form, lform, seq, atm, label, choice type.

type inCtxt index -> lform -> o.
type left, right choice.
type lform label -> form -> lform.

/* Negative conjunction */
type &-&    form -> form -> form.

/* Positive conjunction */
type &+&    form -> form -> form.

/* Disjunction */
type !-!     form -> form -> form.
type !+!     form -> form -> form.

/* Modalities */
type dia1   form -> form.
type box1   form -> form.
type dia2   form -> form.
type box2   form -> form.

infixr &-&, &+& 136.
infixr !-!,!+! 136.

type n, p atm -> form.

type unfK list lform -> seq.
type foc lform -> seq.
type isNegForm, isNegAtm,
     isPosForm, isPosAtm, isCompForm, isCompNeg, isCompPos, isAtm,
     isNeg, isPos, isPosUM	  form -> o.
type negateForm form -> form -> o.
