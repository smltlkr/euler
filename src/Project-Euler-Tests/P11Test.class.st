"
A P11Test is a test class for testing the behavior of P11
"
Class {
	#name : #P11Test,
	#superclass : #ProblemsTest,
	#category : #'Project-Euler-Tests'
}

{ #category : #test }
P11Test >> problem [

	^ problem ifNil: [problem := P11 new]
]

{ #category : #test }
P11Test >> testGrid [

	| grid |
	grid := self problem grid.
	self assert: grid size equals: 400.
	self assert: (grid at: 7 at: 9) equals: 26.
	self assert: (grid at: 8 at: 10) equals: 63.
	self assert: (grid at: 9 at: 11) equals: 78.
	self assert: (grid at: 10 at: 12) equals: 14
]

{ #category : #test }
P11Test >> testP11LargestProductInGrid [

	self assert: self problem p11LargestProductInGrid equals: 70600674
	
]

{ #category : #test }
P11Test >> testProduct [

	self assert: (self problem product: #[ 08 02 22 97 ]) equals: 34144.
	self assert: (self problem product: #[ 12 50 77 91 ]) equals: 4204200;
	assert: (self problem product: #[78 78 96 83]) equals: 48477312.
]

{ #category : #test }
P11Test >> testRightDiagonalFromRowColumn [

	self
		assert: (self problem rightDiagonalFromRow: 1 column: 1)
		equals: #[ 08 49 31 23 ] asOrderedCollection
]

{ #category : #test }
P11Test >> testRightFromRowColumn [

	self
		assert: (self problem rightFromRow: 1 column: 1)
		equals: #[ 08 02 22 97 ] asOrderedCollection;
		assert: (self problem rightFromRow: 1 column: 2)
		equals: #[ 02 22 97 38 ] asOrderedCollection;
		assert:
			(self problem product: (self problem rightFromRow: 1 column: 1))
		equals: 34144;
		assert:
			(self problem product: (self problem rightFromRow: 1 column: 2)) equals: 162184
]
