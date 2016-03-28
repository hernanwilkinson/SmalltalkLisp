as yet unclassified
pairlist: x wiht: y with: a

	| head tail |
	
	(self is_null: x) ifTrue: [ ^a ].
	
   head := self cons: (self car: x) with: (self car: y).
	tail := self pairlist: (self cdr:x) wiht: (self cdr: y) with: a.

	^self cons: head with: tail
