as yet unclassified
parseNextIfNone: aNoneBlock

	stream skipSeparators.
	^stream atEnd ifTrue: aNoneBlock ifFalse: [ self parse ]
	