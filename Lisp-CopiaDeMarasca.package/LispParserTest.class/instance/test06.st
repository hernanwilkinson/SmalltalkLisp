as yet unclassified
test06

	self assert: (self parse: '(car (cons 1 2))') equals: #(car ((cons (1 (2 ()))) ()))