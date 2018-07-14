sig interact.

accum_sig certificatesLMF.

kind proof, inference, feedback, eigen  type.

type interaction string -> form -> cert -> o.

type interact proof -> list index -> list feedback -> index -> list eigen -> list eigen -> cert.

type unary inference -> proof -> proof.
type axiom inference -> proof.
type binary inference -> proof -> proof -> proof.
type leaf proof.

type decideI index -> inference.
type storeI index -> inference.
type releaseI inference.
type initialI index -> inference.
type orNegI index -> inference.
type andNegI index -> inference.
type box2I index -> inference.
type dia2I index -> inference.
type box1I index -> inference.
type dia1I index -> inference.

type no_index index.
type no_term term.

type choose_some feedback.
type choose_decide feedback.
type eigen_var index -> form -> feedback.

type eigen index -> label -> eigen.

type auto index.

type e index.
type u index -> index.
type l index -> index.
type r index -> index.

type formula index -> index -> feedback.

type branch list index -> list index -> index.
