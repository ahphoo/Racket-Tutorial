#lang slideshow

(require pict/flash)
(require slideshow/code)
(require racket/class
         racket/gui/base)

(provide c)

(define c (circle 10))
(define r (rectangle 10 20))
(define (square n)
  ; A semi-colon starts a line comment.
  ; The expression below is the function body.
  (filled-rectangle n n))

; Local Binding
(define (four p)
    (define two-p (hc-append p p))
    (vc-append two-p two-p))

; Bind identifiers using let
(define (checker p1 p2)
  (let ([p12 (hc-append p1 p2)]
        [p21 (hc-append p2 p1)])
    (vc-append p12 p21)))

; Bind identifiers using let* - able to reuse previously declared binds
(define (checkerboard p)
  (let* ([rp (colorize p "red")]
         [bp (colorize p "black")]
         [c (checker rp bp)]
         [c4 (four c)])
    (four c4)))

; Function that takes in a function
(define (series mk)
  (hc-append 4 (mk 4) (mk 10) (mk 20)))

; Passing functions into other functions
(define (rgb-series mk)
  (vc-append
   (series (lambda (sz) (colorize (mk sz) "red")))
   (series (lambda (sz) (colorize (mk sz) "green")))
   (series (lambda (sz) (colorize (mk sz) "blue")))
  )
)

; Function that returns a function
(define (rgb-maker mk)
  (lambda (sz)
    (vc-append (colorize (mk sz) "red")
               (colorize (mk sz) "green")
               (colorize (mk sz) "blue")
               )
    )
  )

; Example of using "map"
(define (rainbow p lst)
  (map (lambda (color)
         (colorize p color))
       lst))

; Adding new rules/extending Racket
(define-syntax pict+code
  (syntax-rules ()
    [(pict+code expr)
     (hc-append 10
                expr
                (code expr))]))

; Object
(define f (new frame% [label "My Art"]
                      [width 300]
                      [height 300]
                      [alignment '(center center)]))

; Object method
(define (add-drawing p)
  (let ([drawer (make-pict-drawer p)])
    (new canvas% [parent f]
                 [style '(border)]
                 [paint-callback (lambda (self dc)
                                   (drawer dc 0 0))])))