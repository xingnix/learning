#lang racket

;============================= broad first search programming =============================

; using these operators and variables to construct a program
(define operators '(+  * ))
(define variables '(x y z))

; generate the cominations of operators and variables
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
(evaluate rule data '())
; output
;'((+ (* y x) z) (+ (* x y) z) (+ z (* y x)) (+ z (* x y)))


; ================================ genetic algorithm programming ==============================================

; there is already some functions for manipulating  expression represeted by list of lists. The selection, crossing and mutation can be constructed accordingly.

;------------ traverse through list of list and obtain the number of all "elements" (elements and pairs)
(define (trav_n l n)
  (if (not (list? l))
       n 
      (if (not (null? l))
          (let* ((n1  (trav_n (car l) (+ n 1))))
            (trav_n (cdr l) n1))
          n)))

(define (node-num l) (trav_n l 0))

;(define l1 '(1 (2 (3 4)) 5))
;(trav_n l1 0)
; output
; 7

;------------ traverse through list of list and obtain the designated "element" (element or pair)
(define (trav_n_get l n)
  (if (or (not (list? l)) (= n 0))
      (list l n)
      (if (not (null? l))
          (let* ((l1  (trav_n_get (car l) (- n 1))))
            (if (= 0 (cadr l1))
                l1
                (trav_n_get (cdr l) (cadr l1))))
          (list l n))))

(define (node-get l n)  (car (trav_n_get l n)))
;(set! l1 '(1 (2 (3 4)) 5))
;(trav_n_get l1 2)
; output
; '((2 (3 4)) 0)


;------------ traverse through list of list and set the designated "elements" (elements and pairs)
(define (trav_n_set l n label)
  (if (= n 0)
      (list label (- n 1))
      (if (not (list? l))
          (list l n)
          (if (not (null? l))
              (let* ((l1  (trav_n_set (car l) (- n 1) label))
                     (l2  (trav_n_set (cdr l) (cadr l1)  label)))
                    (list (cons (car l1) (car l2)) (cadr l2)))
              (list l n)))))

(define (node-set l n label) (car (trav_n_set l n label)))

;(set! l1 '(1 (2 (3 4)) 5))
;(trav_n_set l1 7 'label)
; output
; '((1 (2 (3 4)) label) -1)
