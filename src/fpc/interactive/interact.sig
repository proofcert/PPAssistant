sig interact.

accum_sig certificatesLKF.

kind proof, inference, eigen  type.

type interaction string -> form -> cert -> o.

type interact proof -> list index -> index -> list eigen -> cert.

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
type allI index -> inference.
type someI index -> inference.

type no_index index.
type no_term term.

type eigen index -> term -> eigen.

type auto index.

type e index.
type u index -> index.
type l index -> index.
type r index -> index.

type branch list index -> list index -> index.
