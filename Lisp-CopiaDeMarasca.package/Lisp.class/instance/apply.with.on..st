as yet unclassified
apply: fn with: x on: a

	(self is_atom: fn) ifTrue: [ 
		fn = 'car' ifTrue: [ ^self caar: x ].
		fn = 'cdr' ifTrue: [ ^self cdar: x ].
		fn = 'cons' ifTrue: [ ^self cons: (self car:x) with: (self cadr:x) ].
		fn = 'eq?' ifTrue: [ ^(self car: x) = (self cadr: x) ].
		fn = 'atom?' ifTrue: [ ^self is_atom: (self car: x) ].
		fn = 'symbol?' ifTrue: [ ^self is_symbol: (self car: x) ].
		fn = 'null?' ifTrue: [ ^self is_null: (self car: x) ].
		fn = 'lisp?' ifTrue: [ ^false ].	
		fn = '+' ifTrue: [ ^(self car:x) + (self cadr:x) ].
		fn = 'exit' ifTrue: [ ^self error: 'exit' ].
		fn = 'error' ifTrue: [ ^self error: (self sexpr:x) ].
		fn = 'import' ifTrue: [ ^self import: (self car:x) on: a ].
		fn = 'context' ifTrue: [ ^self execution_context ].
		fn = 'reset' ifTrue: [ ^self clear_list ].
		fn = 'define' ifTrue: [ ^self add_definition: (self car:x) with: (self cadr:x) on: a ].
		(self is_symbol:fn) ifTrue: [ ^self apply: (self eval: fn on: a) with: x on: a ].
		^fn ].
	
	(self car: fn) = 'lambda' ifTrue: [ | extended |
		extended := self pairlist: (self cadr: fn) wiht: x with: a.
		^self eval: (self caddr: fn) on: extended ].
	
	(self car: fn) = 'label' ifTrue: [ | app |
		app := self cons: (self cons: (self cadr: fn) with: (self caddr: fn)) with: a.
		^self apply: (self caddr: fn) with: x on: app ].
	
	self error: 'Unable to apply: ', fn printString " sexpr(fn))"