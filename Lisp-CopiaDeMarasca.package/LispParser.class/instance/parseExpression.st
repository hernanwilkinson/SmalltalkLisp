as yet unclassified
parseExpression
	
	| car |
	
	car := self parse.
	
	^car = $) 
		ifTrue: [ #() ]
		ifFalse: [ | cdr |
			cdr := self parseExpression.
			Array with: car with: cdr ]