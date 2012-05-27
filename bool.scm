
(define true (lambda (x) (lambda (y) x)))
(define false (lambda (x) (lambda (y) y)))

(define cond (lambda (e1)
               (lambda (e2)
                 (lambda (c)
                   ((c e1) e2)))))

#|           NOT           |#
(define not (lambda (x)
              ((cond false) true) x))

(define not (lambda (x)
              ((x false) true)))

(not false)
(not true)

#|           AND           |#
(define and (lambda (x)
              (lambda (y)
                (((cond y) false) x))))

(define and (lambda (x)
              (lambda (y)
                ((x y) false))))

((and true) false)
((and true) true))
((and false) false)
((and false) true)

#|           OR           |#
(define or (lambda (x)
             (lambda (y)
               (((cond true) y) x))))

(define or (lambda (x)
             (lambda (y)
               ((x true) y))))

((or true) false)
((or true) true)
((or false) false)
((or false) true)
