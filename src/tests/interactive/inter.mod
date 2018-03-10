module inter.

accumulate interact.
accumulate lkf-kernel.
accum_sig inter.

interaction "A -> A"
%  ((n (g a)) !-! (p (g a)))
  ((all x\ (n (g x))) !-! (some x\ (p (g x))))
  (interact L_ [auto, auto] _ e []).
%  (interact L_ [] C_ e []).
%  (interact L_ [u (u e), u e] CH_ e []).
