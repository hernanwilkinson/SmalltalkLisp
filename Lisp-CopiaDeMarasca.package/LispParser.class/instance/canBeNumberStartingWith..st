as yet unclassified
canBeNumberStartingWith: aCharacter 
	
	aCharacter isDigit ifTrue: [ ^true ].
	aCharacter = $- ifTrue: [ 
		stream next.
		stream peek isDigit ifTrue: [ 
			stream skip: -1.
			^true ]
		 ].
	
	^false