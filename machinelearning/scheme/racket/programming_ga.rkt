#lang racket
; ================================ genetic algorithm programming ==============================================

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

; generate expressions and print the result fitting data
(define rule (construct (list operators '() variables) 1))

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


;evaluate an  expression on data , return the fitness
(define ns (make-base-namespace))
(define (fitness-1 rule data)
      (let ((errors (map (lambda (d) (abs (- (eval (cons (list 'lambda '(x y z) rule) (cdr d)) ns) (car d))))
                         data)))
      (exp (- (foldr + 0 errors)))))

;(fitness-1 '(+ (* x y) z) data)
;output
;1

; evaluate expressions to obtain fitness
(define (fitness rule data)
  (map (lambda (r) (fitness-1 r data)) rule))

(define (normal-fitness fitness)
  (let ((s (foldr + 0 fitness)))
         (map (lambda (x) (/ x s)) fitness)))

; select an expression according to its fitness
(define (select-1 rule rule-fitness p)
  (let ((p1 (- p (car rule-fitness))))
    (if (< p1 0)
        (car rule)
        (select-1 (cdr rule) (cdr rule-fitness)   p1 ))))

; select population
(define (select rule fitness n)
  (map (lambda (x) (select-1 rule fitness (random))) rule))


; get cross-over point
(define (cross-over-1 l)
  (let* ((n (round (* (random) (node-num l))))
         (label (node-get l n)))
    (if (member label operators)
        (list (+ n 1) (node-get l (+ n 1)))
        (list n label))))
        
; cross-over
(define (cross-over-2 l1 l2)
  (let ((n-label1 (cross-over-1 l1))
        (n-label2 (cross-over-1 l2)))
      (list (node-set l1 (car n-label1) (cadr n-label2)) (node-set l2 (car n-label2) (cadr n-label1)))))

(define (cross-over-rule rule out)
  (if (< (length rule) 2)
      (append out rule)
      (let ((l1 (car rule))
            (l2 (cadr rule)))
        (cross-over-rule (cddr rule) (append out (cross-over-2 l1 l2))))))

(define (cross-over rule)   (cross-over-rule  rule '()))

; mutate

; return a element from s , different than e
(define (get-another e s n)
  (let ((c (car s)))
    (if (eq? e c)
        (get-another e (cdr s) n)
        (if (> n 0)
            (get-another e (cdr s) (- n 1))
            c))))

; change symbol at p
(define (change-at l p)
  (let ((m (node-get l p)))
    (if (member m operators)
        (node-set l p (get-another m operators (floor (* (random) (- (length operators) 1)))))
        (if (member m variables)
            (node-set l p (get-another m variables (floor (* (random) (- (length variables) 1)))))
            (if (null? m)
                (change-at l 1)
                (change-at l (+ p 1)))))))
  

(define (mutate-1 l)
  (if (< (random) 0.1)
      (let* ((n (node-num l))
             (p (ceiling (* (random) n))))
        (change-at l p))
      l))

(define (mutate rule)
  (map mutate-1 rule))

(define (mutate-2 rule)
  (if (null? rule)
      '()
      (append (list (mutate-1 (car rule))) (mutate-2 (cdr rule)))))

;(define f1 (fitness rule data))
;(define f (normal-fitness f1))
;(define l1 (select-1 rule f 0.1))
;(define l2 (select-1 rule f 0.9))
;(cross-over-2 l1 l2)
;l1
;l2
;(define f2 (fitness (cross-over (select rule f rule)) data))

; answer
(define (answer rule fitness)
  (if (null? rule)
      '()
  (let ((r (car rule))
        (f (car fitness)))
    (if (= f 1)
        r
        (answer (cdr rule) (cdr fitness))))))


(define (ga-iterate rule data n)
  (if (< n 0)
      '()
      (let ((f (fitness rule data)))
        (if (null? (answer rule f))
            (let* ((nf (normal-fitness f))
                   (rule-s (select rule nf rule))
                   (rule-c (cross-over rule-s))
                   (rule-m (mutate rule-c)))
              (ga-iterate rule-m data (- n 1)))
              (println (answer rule f))))))

(ga-iterate rule data 500)
;raco exe programming.rkt

