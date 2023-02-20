Class {
	#name : #Problems,
	#superclass : #Object,
	#instVars : [
		'fibQueue'
	],
	#category : #'Project-Euler'
}

{ #category : #'as yet unclassified' }
Problems >> fibQueue [
	^ fibQueue ifNil: [ fibQueue := OrderedCollection newFrom: #(2 1)]
]

{ #category : #accessing }
Problems >> fibQueue: anObject [
	fibQueue := anObject
]

{ #category : #testing }
Problems >> is: aNumber MultipleOf: aMultipleNumber [
^ aNumber  \\ aMultipleNumber = 0
]

{ #category : #'as yet unclassified' }
Problems >> isPalindrome: anInteger [
	| string lastIndex |
	string := anInteger asString.
	lastIndex := string size.
	1 to: string size do:  [ :firstIndex | 
		(string at: firstIndex) = (string at: lastIndex)
			ifTrue: [ lastIndex := lastIndex - 1 ] ifFalse: [^false]].
	^ true 
]

{ #category : #'as yet unclassified' }
Problems >> largestPrimeFactorOf: anInteger [ 
	^anInteger primeFactors max
]

{ #category : #'as yet unclassified' }
Problems >> p10SumOfPrimesBelow: maxValue [ 
	^ (Integer primesUpTo: maxValue )
		inject: 0
		into: [ :sum :each | sum + each ]
]

{ #category : #'as yet unclassified' }
Problems >> p1SumOfMultiplesOf3and5: belowValue [
	^ ((1 to: belowValue - 1)
		select: [ :each | each \\ 5 = 0 | (each \\ 3 = 0) ]) sumNumbers 
]

{ #category : #'as yet unclassified' }
Problems >> p2EvenFibbonSumLessThan: aNumber [
	| nextFib sum |
	sum := 2.
	[ (nextFib := self fibQueue first + self fibQueue second) < aNumber ]
		whileTrue: [ fibQueue addFirst: nextFib.
			fibQueue removeLast.
			nextFib even ifTrue: [sum := sum + nextFib ]].
	^ sum
]

{ #category : #'as yet unclassified' }
Problems >> p3LargestPrimeFactor [
	self largestPrimeFactorOf: 13195 .

]

{ #category : #'as yet unclassified' }
Problems >> p4LargestPalindromeProduct [
	| maxproduct product |
	maxproduct := 0.
	1 to: 999 do: [ :factor1 | 
		1 to: 999 do: [ :factor2 | 
			product := factor1 * factor2.
			product > maxproduct & (self isPalindrome: product)
				ifTrue: [ maxproduct := product ] ] ].
	^ maxproduct
]

{ #category : #'as yet unclassified' }
Problems >> p5OldSmallestMultple: maxNumber [
	| index number |
	index := 1.
	number := 1.
	[ true ]
		whileTrue: [ [ self is: number MultipleOf: index ]
				whileTrue: [ index = maxNumber
						ifTrue: [ ^ number ].
					index := index + 1 ].
			number := number + 1.
			index := 1 ]
]

{ #category : #'as yet unclassified' }
Problems >> p5smallestMultple: maxNumber [
	^(1 to: maxNumber ) inject: 1 into: [ :number :index | number lcm: index  ]
]

{ #category : #'as yet unclassified' }
Problems >> p6SumSquareDifference: endValue [

^(((1 to: endValue ) inject: 0 into: [ :sum :each | each + sum ]) ** 2) - (( 1 to: endValue ) inject: 0 into: [ :sum :each | each**2 + sum ]) 
]

{ #category : #'as yet unclassified' }
Problems >> p7TenThousandAndFirstPrime: position [

	^(Integer primesUpTo: 250000) at: position
]

{ #category : #'as yet unclassified' }
Problems >> p8LargestProductInSeries: series forDigitCount: adjacentDigitCount [
	| maxProduct candidateProduct |
	maxProduct := 1.
	1 to: series size - adjacentDigitCount  + 1 do: [ :startIndex | 
		candidateProduct := (startIndex to: startIndex + adjacentDigitCount - 1 )
			inject: 1
			into: [ :product :eachDigit | (series at: eachDigit) digitValue * product ].
		maxProduct := candidateProduct max: maxProduct ].
	^ maxProduct
]

{ #category : #'as yet unclassified' }
Problems >> p9PythagoreanTriplesSumsTo: maxSum [
	| eachC arrayCollection |
	"1 to: 12 do:[:eachA | 1 to: 12 do: [ :eachB | eachC := 12 - eachA -eachB ]]."
	arrayCollection := OrderedCollection new.
	1 to: maxSum do: [ :eachA | 
		1 to: maxSum do: [ :eachB | 
			eachC := maxSum - eachA - eachB.
			arrayCollection add: (Array with: eachA with: eachB with: eachC) ] ].
	^ (arrayCollection
		select: [ :each | 
	each first < each second & (each second < each third)
		& (each first ** 2 + (each second ** 2) = (each third ** 2)) ])
		first
		inject: 1 into: [ :product :eachTriplet | product * eachTriplet ]
]
