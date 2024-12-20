;;JUAN DAVID PÉREZ VALENCIA - 2266289
;;ANDERSON GOMEZ GARCIA - 2266242
;;KEVIN ALEXIS LORZA RAMÍREZ - 2266098
;;JESUS EDIBER ARENAS -  2266066
;Pruebas
#lang racket

(require rackunit "InterpretadorObliq.rkt")

(define exp1 
  (scan&parse
    "var x = 10, y = 20, z = +(x y) in *(z 2) end"
  )
)

(define expected-exp1
  60
)

(define exp2
  (scan&parse
  "let x = 2 in *(x 4) end"
  )
)

(define expected-exp2
  8
)

(define exp3 
  (scan&parse
    "if false then 2 elseif false then 3 else 4 end"
  )
)

(define expected-exp3
  4
)

(define exp4
  (scan&parse
  "proc (miFuncion) +(2 3) end"
  )
)

(define expected-exp4
  "#(struct:closure (miFuncion) #(struct:prim-exp #(struct:sum-prim) (#(struct:lit-exp 2) #(struct:lit-exp 3))) #(struct:ambiente-extendido-ref (x y z) #(4 2 5) #(struct:ambiente-extendido-ref (a b c) #(4 5 6) #(struct:ambiente-vacio))))"
)

(define exp5 
  (scan&parse
    "begin x y end"
  )
)

(define expected-exp5
  5
)

(define exp6 
  (scan&parse
    "set x := +(x 1)"
  )
)

(define expected-exp6
  5
)

(define exp7 
  (scan&parse
    "letrec i (i) = 2 in 2 end"
  )
)

(define expected-exp7
  2
)

(define test-list-functions
  (test-suite "lista de pruebas"
        (test-case "Test exp1"
      (check-equal? (evaluar-programa exp1) expected-exp1))
    (test-case "Test exp2"
      (check-equal? (evaluar-programa exp2) expected-exp2))
    (test-case "Test exp3"
      (check-equal? (evaluar-programa exp3) expected-exp3))
    (test-case "Test exp4"
      (check-equal? (evaluar-programa exp4) expected-exp4))
    (test-case "Test exp5"
      (check-equal? (evaluar-programa exp5) expected-exp5))
    (test-case "Test exp6"
      (check-equal? (evaluar-programa exp6) expected-exp6))
    (test-case "Test exp7"
      (check-equal? (evaluar-programa exp7) expected-exp7))
))

(run-test test-list-functions)
