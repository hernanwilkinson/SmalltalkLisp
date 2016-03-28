as yet unclassified
add_definition: identifier with: value on: anEnvironment
	
	| definitionCons newEnvironmentTail |
	
	definitionCons := self cons: identifier with: value.
	newEnvironmentTail := self cons: (self car: anEnvironment) with: (self cdr: anEnvironment).

	anEnvironment at: 1 put: definitionCons.
	anEnvironment at: 2 put: newEnvironmentTail
			 