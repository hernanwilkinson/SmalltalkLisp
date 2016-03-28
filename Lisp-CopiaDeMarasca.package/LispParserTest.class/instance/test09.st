as yet unclassified
test09

	| parser |
	
	parser := LispParser on: '(define *evlis (lambda (m a)
                 (cond ((null? m) (quote ()))
                       (#t (cons (*eval (car m) a) (*evlis (cdr m) a))))))'.
	parser parse.
	self assert: parser atEnd.
	
