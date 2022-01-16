#lang racket  ; Program module - #lang <langname> <definition>|<expr>

; Booleans
#t  ; true
#f  ; false

; Strings written b/t doublequotes
"Hello, world!"
"Hello, \"world\""  ; escape doublequotes
"\\"                ; escape backslashes

; Definitions - ( define (<id> <id>*) <expr>+ )
; The first <id> is the name of the function/procedure.
; The following <id>s are arguments.
; <expr>s are the body of the function/procedure.
; The result of the last <expr> is returned.
(define f 3)                ; function that takes a single argument
(define (add a b) (+ a b))  ; function that takes two arguments

; Styling
; Identifiers go immediately after an open parentheses (no space)
; Closing parentheses never go on their own line
(define (greet name)
  (printf "Hello, ~s\n" name))

; Special characters
; These cannot be used to create identifiers
; ()[]{}",';#|\

; Function calls - two forms
; Simple - ( <id> <expr>* )
(+ 1 2)

; Complex - ( <expr> <expr>* )
; See below "Conditionals"


; Conditionals - if, and, or, cond
; ( if <expr> <expr> <expr> )
; The first <expr> is always evaluated. If it returns a non-#f value,
; we evaluate the second <expr>. Else, evaluate the third <expr>
(if (> 2 3)
    "2 is bigger than 3"
    "2 is smaller than or equal to 3")

; (and <expr>*)
; (or <expr>*)

; For example, use "and" to check multiple conditions
(define (reply-only-enthusiastic s)
  (if (and (string? s)
           (string-prefix? s "hello ")
           (string-suffix? s "!"))
      "hi!"
      "huh?"))

; ( cond {[ <expr> <expr>* ]}* )
; Like a switch-statement, but the "break" statements are automatically put in for you.
; the last clause is usually an catch-all. The "else" keyword evaluates to #t.
(define (reply-more s)
  (cond
    [(string-prefix? s "hello ")
     "hi!"]
    [(string-prefix? s "goodbye ")
     "bye!"]
    [else "huh?"]))

; Complex - ( <expr> <expr>* )
; The first <expr> can be anything that evaluates to a function.
; For example, if v is string, concatenate another copy of the string.
; Else, add v to itself as a number.
(define (duplicate v)
  ((if (string? v) string-append +) v v))

(duplicate "string")
(duplicate 1)

; Anonymous Functions
; (lambda ( <id>* ) <expr>+ )


; Local Binding - define, let, let*
;( define ( ‹id› ‹id›* ) ‹definition›* ‹expr›+ )
;( lambda ( ‹id›* ) ‹definition›* ‹expr›+ )
;( let ( {[ ‹id› ‹expr› ]}* ) ‹expr›+ )




    





