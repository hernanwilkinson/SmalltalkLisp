as yet unclassified
eval: e on: a

	(self is_atom: e) ifTrue: [ (self is_symbol: e) ifTrue: [ ^self cdr:(self assoc: e with: a )] ifFalse: [ ^e ] ].

	(self is_atom: (self car: e)) ifTrue: [ 
		(self car: e) = 'quote' ifTrue: [ ^self cadr: e ].
		(self car: e) = 'cond' ifTrue: [ ^self evcon: (self cdr:e) on: a ].
		(self car: e) = 'lambda' ifTrue: [ ^e ].
		(self car: e) = 'define' ifTrue: [ | with_new_definition |
			with_new_definition := self cons: (self cons: (self cadr:e) with: (self cadr: e)) with: a.
			^self apply: (self car: e) with: (self evlist: (self cdr: e) on: with_new_definition) on: a  ].
	].

	^self apply: (self car:e) with: (self evlist: (self cdr:e) on: a) on: a
	