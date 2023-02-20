"
A P12Test is a test class for testing the behavior of P12
"
Class {
	#name : #P12Test,
	#superclass : #ProblemsTest,
	#category : #'Project-Euler-Tests'
}

{ #category : #test }
P12Test >> problem [
	^problem ifNil: [ problem := P12 new ]
]

{ #category : #test }
P12Test >> testCompute [
	^ self assert: self problem compute equals: 76576500
]

{ #category : #test }
P12Test >> testComputeOn [
	self
		assert: (self problem computeOn: 28)
		equals: #(1 2 4 7 14 28). self
		assert: (self problem computeOn: 6)
		equals: #(1 2 3 6).
	self assert: (self problem computeOn: 15) equals: #(1 3 5 15)
]

{ #category : #test }
P12Test >> testTriangleFactorsOfOn [
	| target |
	target := self problem triangleNumber: 7.
	self
		assert:
			(Array
				streamContents: [ :s | self problem triangleFactorsOf: target On: s ]) asSet asSortedCollection asArray 
		equals: #(1 2 4 7 14 28)
]

{ #category : #test }
P12Test >> testTriangleNumber [

self assert: (self problem triangleNumber: 7) equals: 28
]
