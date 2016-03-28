as yet unclassified
import: aMessageName on: a 
	
	| sourceCode parser expression | 
	self halt.
	sourceCode := self perform: aMessageName.
	parser := LispParser on: sourceCode.
	[expression := parser parseNextIfNone: [ ^self ].
	self eval: expression on: a.
	true ] whileTrue.