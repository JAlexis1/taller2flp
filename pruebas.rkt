#lang racket/base

;; Integrantes: Nicolas Rodriguez Romero # 2266071
;;              Jhon Alexis Ruiz Quiceno # 2266014
;;              Michael Rodriguez Arana  # 2266193

(require rackunit "5.InterpretadorAsignacion.rkt")

;; pruebas de listas

(define lista_elementos_multiples
  (scan&parse
    "cons(1cons(2cons(6 empty)))"
  )
)
(define expected_lista_elementos_multiples
  '(1 2 6)
)

(check-equal?  (evaluar-programa lista_elementos_multiples) expected_lista_elementos_multiples)

(define lista_vacia
  (scan&parse
    "empty"
  )
)
(define expected_lista_vacia
  '()
)
(check-equal? (evaluar-programa lista_vacia) expected_lista_vacia)

(define lista_anidada
  (scan&parse
    "cons(cons(1 cons(2 empty)) cons(8 empty))"
  )
)
(define expected_lista_anidada
  '((1 2) 8)
)
(check-equal? (evaluar-programa lista_anidada) expected_lista_anidada)

; Lista con sublista y elementos
(define lista_mixta
  (scan&parse
    "cons(1 cons(cons(2 cons(3 empty)) cons(4 empty)))"
  )
)
(define expected_lista_mixta
  '(1 (2 3) 4)
)
(check-equal? (evaluar-programa lista_mixta) expected_lista_mixta)


;; pruebas de cond

(define cond_true
  (scan&parse
    "cond -(1,1) ==> 5 else ==> 9 end"
  )
)
(define expected_cond_true
  9
)
(check-equal? (evaluar-programa cond_true) expected_cond_true)

(define cond_multiples
  (scan&parse
    "cond -(2,1) ==> 5 -(3,1) ==> 6 else ==> 7 end"
  )
)
(define expected_cond_multiples
  5
)
(check-equal? (evaluar-programa cond_multiples) expected_cond_multiples)

(define cond_else
  (scan&parse
    "cond -(10,10) ==> 5 -(6,6) ==> 6 else ==> 8 end"
  )
)
(define expected_cond_else
  8
)
(check-equal? (evaluar-programa cond_else) expected_cond_else)