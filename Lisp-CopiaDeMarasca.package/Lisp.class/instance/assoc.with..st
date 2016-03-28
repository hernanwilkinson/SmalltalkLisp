as yet unclassified
assoc: x with: a

	(self is_null: a) ifTrue: [ self error: 'Undefined identifier: ', x asString ].

	(self caar:a) = x ifTrue: [ ^self car: a ].

	^self assoc: x with: (self cdr: a)
