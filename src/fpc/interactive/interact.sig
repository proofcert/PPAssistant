sig interact.

accum_sig certificatesLKF.

kind proof, inference, command, feedback, eigens type.

type interact proof -> list command -> list feedback -> findex -> list eigen -> cert.

type unary inference -> proof -> proof.
type axiom inference -> proof.
type binary inference -> proof -> proof -> proof.
type leaf proof.

type decideI index -> inference.
type storeI index -> inference.
type releaseI inference.
type initialI index -> inference.
type orNegI form -> inference.
type andNegI form -> inference.
type allI inference.
type someI A -> inference.

type no_index index.
type no_term term.

type choose_some feedback.
type choose_decide feedback.
type eigen_var findex -> form -> feedback.

type eigen findex -> term -> eigen.

type auto command.

type e findex.
type u findex -> findex.
type l findex -> findex.
type r findex -> findex.

type formula findex -> index -> feedback.

type branch list command -> list command -> command.

