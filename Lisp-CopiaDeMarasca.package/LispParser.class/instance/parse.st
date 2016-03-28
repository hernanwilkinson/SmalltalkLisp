as yet unclassified
parse
	
	| token |
	
	token := self readNextTokenIfNone: [ self error: 'Invalid expression' ].
	
	^token = $( 
		ifTrue: [ self parseExpression ]
		ifFalse: [ token ]