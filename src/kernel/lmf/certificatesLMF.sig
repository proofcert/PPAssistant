% Copyright Tomer Libal 2018

sig certificatesLMF.
accum_sig lmf-syntax.

type decide_ke			cert -> index -> cert -> o.
type release_ke 		cert -> cert -> o.

type store_kc				cert -> lform -> index -> cert -> o.
type initial_ke			cert -> index -> o.
type box_kc					cert -> lform -> (label -> cert) -> o.
type dia_ke					cert -> lform -> label -> cert -> o.
type andNeg_kc			cert -> lform -> cert -> cert -> o.
type orNeg_kc 			cert -> lform -> cert -> o.
type orPos_ke  			cert -> lform -> choice -> cert -> o.
