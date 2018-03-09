module debug.


bracket Pre St G Post :- print Pre, print St, term_to_string G S, print S, print Post.
announce G :- bracket ">>" "" G "\n", fail.

spy St G :- ((bracket ">>> " St G "\n", G, bracket "+++ " St G "\n");
          (bracket "<<< " St G "\n", fail)).
