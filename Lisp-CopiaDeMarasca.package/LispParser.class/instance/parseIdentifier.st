as yet unclassified
parseIdentifier

	| identifier |
	
	identifier := stream upToAny: self identifierSeparators.
	stream skip: -1.
	
	^identifier