Class {
	#name : #P12,
	#superclass : #Problems,
	#category : #'Project-Euler'
}

{ #category : #accessing }
P12 >> compute [
	| index |
	index := 1.
	[ (self computeOn: (self triangleNumber: index)) size < 500 ]
		whileTrue: [ index := index + 1 ].
	^ self triangleNumber: index
]

{ #category : #accessing }
P12 >> computeOn: value [
	^ (Array
		streamContents: [ :s | 
			s nextPut: 1.
			self triangleFactorsOf: value On: s.
			s nextPut: value ]) asSet asSortedCollection asArray
]

{ #category : #'as yet unclassified' }
P12 >> myPrimeFactors [

	28 primeFactors
]

{ #category : #'as yet unclassified' }
P12 >> triangleFactorsOf: value On: aStream [


	1 to: value sqrtFloor do: [ :each | 
		value \\ each = 0
			ifTrue: [ aStream
					nextPut: each;
					nextPut: value / each ] ].
	aStream nextPut: value
]

{ #category : #'as yet unclassified' }
P12 >> triangleNumber: count [

	^(1 to: count) inject: 0 into: [ :sum :eachNumber | sum + eachNumber ]
]
