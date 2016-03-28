as yet unclassified
evcon: c on: a

	(self is_null: c) ifTrue: [ self error: 'Exhausted every possible condition' ].
	(self eval: (self caar:c) on: a) ifTrue: [ ^self eval:(self cadar:c) on: a ].

	^self evcon: (self cdr:c) on: a.
