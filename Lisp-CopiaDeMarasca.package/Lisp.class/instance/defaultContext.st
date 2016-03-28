as yet unclassified
defaultContext
	
	^self cons: (self cons: '#t' with: true) with: (self cons: (self cons: '#f' with: false) with: #()).
	"^#(('#t' true) (('#f' false) ()))."