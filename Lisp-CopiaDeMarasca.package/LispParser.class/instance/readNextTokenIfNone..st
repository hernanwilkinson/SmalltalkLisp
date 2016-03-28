as yet unclassified
readNextTokenIfNone: aNoneBlock

	| nextChar |
	
	nextChar := stream skipSeparatorsAndPeekNext. 
	
	nextChar == stream ifTrue: [ ^aNoneBlock value ].
	
	(nextChar = $( or: [ nextChar = $)]) ifTrue: [ ^stream next ].
	(self canBeNumberStartingWith: nextChar) ifTrue: [ ^self parseNumber ].
	
	^self parseIdentifier