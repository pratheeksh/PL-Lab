;;;; Base case:  n = m, in which case return a list just containg N
;;;; Recursive Hypothesis: Assume (everyother (+ n 2) m) returns the
;;;;  list of numbers from n+2 to m
;;;; Recursive step: Put N at the front of the list resulting from
;;;; (everyother (+ n 2) m)

(define (everyother n m)
(cond ((= n m) (list n))
(else (cons n (everyother (+ n 2) m)))))

;;;;Base case: empty list, return an empty list
;;;;Recurvsive hypothesis: we check whether the first element of the array is a list,
;;;;if yes then recursively call flatten on the first elt and rest of the array
;;;; else, recursively call flatten on the rest of the array and
;;;;insert the first element in front of it


(define xor
  (lambda (a b)
    (cond
      (a (not b))
      (else b))))

(define (flatten L)
(cond ((null? L) '())
  ((list? (car L)) (append (flatten (car L)) (flatten (cdr L))) )
                      (else (cons (car L) ( flatten (cdr L))))
  ))


;;;; base case: check if one of the lists is empty and the other is not - then return false
;;;; else if both lists are empty return true
;;;; else check whether the params are lists, if yes call myequal recursively
;;;; on every element of the array

(define (myequals L R)
  (cond
    ((xor (null? L) (null? R)) #f)
    ((and (null? L) (null? R)) #t)
    (else (cond
            ((or (not (list? L)) (not (list? R))) (and (eq? L R) ))
            (else (and (myequals (car L) (car R)) (myequals (cdr L) (cdr R))))))))


;;;; base case: if the input list is empty return the answer
;;;; else, check if the first elt is a list, in which case recursively call rev
;;;; on the first elt and rest of the list, and append them
;;;;if first elt is not a list, recursively call rev on result,
;;;;and insert the element at the beginning of the result to obtain reverse order

(define (rev L result)
  (cond ((null? L) result)
        ((list? (car L)) (rev (cdr L) (append (list (rev(car L) '())) result)))  
        (else (rev (cdr L) (cons (car L) result )))))

(define (all-reverse L)  
     (rev L '()))
;;(all-reverse '(1 2 3 (5 6 (7 8) 9) (4 5)) )

;;;;base case: if the input domain is empty return true
;;;;else compare if the first element of the domain, when evaluated
;;;; by both functions result in the same value. if yes, recursively
;;;; compare rest of the elts, else return false


(define (compare-fns fn1 fn2 domain)
  (cond ((null? domain) #t)
         ((not (eq? (fn1 (car domain)) (fn2 (car domain)))) #f)
         (else (compare-fns fn1 fn2 (cdr domain)))))
;;(compare-fns (lambda (x) ( * x 3)) (lambda (y) (+ y y)) '(1 2 3 4 5))

;;;; if the domain is empty return the result
;;;;else, evaluate the functions using the car domain as param. if they result in the same value
;;;; append to result, and recursively continue to evaluate the rest of the domain

(define (same-values-helper fn1 fn2 domain res)
  (cond ((null? domain)  res)
         ( (eq? (fn1 (car domain)) (fn2 (car domain)))  (same-values-helper fn1 fn2 (cdr domain) (append res (list (car domain)))))
         (else (same-values-helper fn1 fn2 (cdr domain) res))))
(define (same-values fn1 fn2 domain)
  (same-values-helper fn1 fn2 domain '()))

;;; if the input list is null return left and right partitions
;;; else check if the element x if <= car of the list
;;; depending on the outcome, append car(L) to left or right.
;;;; call partition helper on the cdr(L) recursively


(define (partition-helper x L left right)
  (cond ((null? L) (list  left right))
        ((<=  (car L) x) (partition-helper x (cdr L) (append left (list (car L)) ) right) )
        (else (partition-helper x (cdr L) left (append right (list (car L))) ))))
(define (partition x L)
  (partition-helper x L '()'()))
(partition '7 '( ))

;;; if the input list is empty, return an empty list
;;; else perform partition with first elt of list as pivot
;;; recursively call quick sort on left and right side of the partition
;;; append the pivot in between

(define (sort L)
  (cond ((null? L) '())
  (else (let* ((res (partition (car L) (cdr L))))
    (append (sort (car res)) (list (car L)) (sort (cadr res)))))))

;;;(sort '(4 5 2 3))

;;;just use map to return a function
(define (applytolist f)
  (lambda (L) (map f L)))


;;; define a function that returns a function such that, each time the function is called,
;;; it evaluates the function for the first element of the list and
;;; generates a new function for performing the map function on the rest of the list
(define ((newapplytolist f) L)
  (cond ((null? L) '())
       (( cons (f (car L))  ((newapplytolist f) (cdr L))))))

;;;((applytolist (lambda (y) (abs y))) '(-6 -7 -8 1 2 3 4 5))
;;;((newapplytolist (lambda (y) (abs y))) '(-6 -7 -8 1 2 3 4 5))

                   