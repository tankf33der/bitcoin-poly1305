(seed (in "/dev/urandom" (rd 8)))
(de randL (N)
   (make (do N (link (rand 0 255)))) )
(de bitcoin_poly1305 (M K)
   (let (ML (length M)  R)
      (native
         "libbitcoinp.so.0"
         "poly1305_auth"
         NIL
         '(R (16 B . 16))
         (ifn M 0 (cons NIL (cons ML) M))
         ML
         (cons NIL (32) K) )
      R ) )
(de mono_poly (M K)
   (let (ML (length M)  R NIL)
      (native
         "libmonocypher.so"
         "crypto_poly1305"
         NIL
         '(R (16 B . 16))
         (ifn M 0 (cons NIL (cons ML) M))
         ML
         (cons NIL (32) K) )
      R ) )
(for N (range 0 8192)
   (let (M (need N 255)  K (randL 32))
      (test (bitcoin_poly1305 M K) (mono_poly M K)) ) )
(msg 'ok)
(bye)
