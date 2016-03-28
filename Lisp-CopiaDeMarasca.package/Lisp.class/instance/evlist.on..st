as yet unclassified
evlist: m on: a

	| head tail |
	
	(self is_null: m) ifTrue: [ ^#() ].
	head := self eval: (self car:m) on: a.
	tail := self evlist: (self cdr: m) on: a.

	^self cons: head with: tail
	