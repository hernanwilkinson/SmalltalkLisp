as yet unclassified
lispInLisp

^'(define cdar (lambda (x) (cdr (car x))))

(define cadr (lambda (x) (car (cdr x))))

(define caar (lambda (x) (car (car x))))

(define cadar (lambda (x) (car (cdr (car x)))))

(define caddr (lambda (x) (car (cdr (cdr x)))))

(define *pairlis (lambda (x y a)
                   (cond ((null? x) a)
                         (#t (cons (cons (car x) (car y))
                                   (*pairlis (cdr x) (cdr y) a))))))

(define *assoc (lambda (x a)
                 (cond ((null? a) (error (cons x (quote (: undefined identifier)))))
                       (#t (cond ((eq? (caar a) x) (car a))
                                 (#t (*assoc x (cdr a))))))))

(define *evcon (lambda (c a)
                 (cond ((null? c) (error (quote (Exhausted every possible condition))))
                       ((*eval (caar c) a) (*eval (cadar c) a))
                       (#t (*evcon (cdr c) a)))))

(define *evlis (lambda (m a)
                 (cond ((null? m) (quote ()))
                       (#t (cons (*eval (car m) a) (*evlis (cdr m) a))))))

(define *apply (lambda (fn x a)
                 (cond ((atom? fn)
                        (cond ((eq? fn (quote car)) (caar x))
                              ((eq? fn (quote cdr)) (cdar x))
                              ((eq? fn (quote cons)) (cons (car x) (cadr x)))
                              ((eq? fn (quote eq?)) (eq? (car x) (cadr x)))
                              ((eq? fn (quote atom?)) (atom? (car x)))
                              ((eq? fn (quote symbol?)) (symbol? (car x)))
                              ((eq? fn (quote null?)) (null? (car x)))
                              ((eq? fn (quote lisp?)) #t)
                              ((eq? fn (quote +)) (+ (car x) (cadr x)))
                              ((eq? fn (quote context)) (context))
                              ((eq? fn (quote exit)) (exit))
                              ((eq? fn (quote error)) (error x))
                              ((eq? fn (quote import)) (import (car x)))
                              ((eq? fn (quote reset)) (reset))
                              ((eq? fn (quote define)) (define (car x) (cadr x)))
                              ((symbol? fn) (*apply (*eval fn a) x a))
                              (#t fn)))
                       ((eq? (car fn) (quote lambda))
                        (*eval (caddr fn) (*pairlis (cadr fn) x a)))
                       ((eq? (car fn) (quote label))
                        (*apply (caddr fn) x (cons (cons (cadr fn) (caddr fn)) a)))
                       (#t (error (cons fn (quote (: unable to apply))))))))

(define *eval (lambda (e a)
                (cond ((atom? e)
                       (cond ((symbol? e) (cdr (*assoc e a)))
                             (#t e)))
                       ((atom? (car e))
                        (cond ((eq? (car e) (quote quote)) (cadr e))
                              ((eq? (car e) (quote cond)) (*evcon (cdr e) a))
                              ((eq? (car e) (quote lambda)) e)
                              ((eq? (car e) (quote define))
                                 (*apply (car e) (*evlis (cdr e) (cons (cons (cadr e) (cadr e)) a)) a))
                              (#t (*apply (car e) (*evlis (cdr e) a) a))))
                       (#t (*apply (car e) (*evlis (cdr e) a) a)))))
'