% 29 july 2014.
sig certificatesLKF.
accum_sig lkf-syntax.


type decide_ke					cert -> index -> cert -> prop.
type release_ke 				cert -> cert -> prop.

type store_kc					cert -> form -> index -> cert -> prop.
type initial_ke					cert -> index -> prop.
/* the first A is the client side eigenvariable while the argument to the second cert is the kernel eigenvariable */
type all_kc					cert -> form -> (A -> cert) -> prop.
type some_ke					cert -> A -> cert -> prop.
type andNeg_kc,	 andPos_ke			cert -> form -> cert -> cert -> prop.
type andPos_k	 				cert -> form -> direction -> cert -> cert -> prop.
type orNeg_kc 	 				cert -> form -> cert -> prop.
type orPos_ke    	    			cert -> form -> choice -> cert -> prop.
type true_ke 					cert -> prop.
type false_kc 					cert -> cert -> prop.

type cut_ke cert -> form -> cert -> cert -> prop.
