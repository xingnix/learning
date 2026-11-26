#lang racket

;============================= broad first search programming =============================

; using these operators and variables to construct a program
(define operators '(+  * ))
(define variables '(x y z))

; generate the combinations of operators and variables
(define (combine-rec op-vars l)
  (if (null? op-vars)
      (list l)
      (append
       (combine-rec (cdr op-vars) (append l (list (caar op-vars))))
       (if (null? (cdar op-vars)) '() (combine-rec (cons (cdar op-vars) (cdr op-vars)) l)))))


;(set! operators '(+  * ))
;(set! variables '(x y z))
;(combine-rec (list operators variables variables) '())
; output
; '((+ x x) (+ x y) (+ x z) (+ y x) (+ y y) (+ y z) (+ z x) (+ z y) (+ z z) (* x x) (* x y) (* x z) (* y x) (* y y) (* y z) (* z x) (* z y) (* z z))

; combine variables from same set
(define (combine operators variables)
  (combine-rec (list operators variables variables) '()))

; construct n ierations of expressions
(define (construct op-vars n)
  (if (= n 0)
      (caddr op-vars)
      (let* ((op (car op-vars))
             (v1 (cadr op-vars))
             (v2 (caddr op-vars))
             (vn (append (combine-rec (list op (append v1 v2) v2) '())
                         (if (null? v1) '() (combine-rec (list op v2 v1) '())))))
        (construct (list op v2 vn) (- n 1)))))

;(set! operators '(+  * ))
;(set! variables '(x y z))
;(length (construct (list operators '() variables) 1))
; output
;18

;simple toy data from ((+ (* x y) z) x y z)
(define data '((5  1 2 3) (7  2 3 1) (5 1 3 2)))

;evaluate an  expression on data , return the expression (fit data) or '() (error)
(define ns (make-base-namespace))
(define (evaluate-1 rule data)
  (if (null? data)
      (list (list rule) #t)
      (let ((d (car data))
            (dd (cdr data)))
        (if (= (eval (cons (list 'lambda '(x y z) rule) (cdr d)) ns) (car d))
            (evaluate-1 rule dd)
            (list '() #f)))))

;(evaluate-1 '(+ (* x y) z) data)
;output
;'(((+ (* x y) z)) #t)

; evaluate expressions
(define (evaluate rule data l)
  (if (null? rule)
      l
      (let ((r (car rule))
            (rr (cdr rule)))
        (evaluate rr data (append (car (evaluate-1 r data)) l)))))

;(evaluate '((+ 1) (+ (* x y) (* z 1)) (+ 1)) data '())
; output
; '((+ (* x y) (* z 1)))

; generate expressions and print the result fitting data
(define rule (construct (list operators '() variables) 2))

(println data)
(evaluate rule data '())
; output
;'((+ (* y x) z) (+ (* x y) z) (+ z (* y x)) (+ z (* x y)))

