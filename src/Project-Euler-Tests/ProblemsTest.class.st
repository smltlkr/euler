"
A Problem1Test is a test class for testing the behavior of Problem1
"
Class {
	#name : #ProblemsTest,
	#superclass : #TestCase,
	#instVars : [
		'problems',
		'problem'
	],
	#category : #'Project-Euler-Tests'
}

{ #category : #test }
ProblemsTest >> dontTestP5SmallestMultple [
	self timeLimit: 20 seconds.
	self assert: (Problems new p5OldSmallestMultple: 10) equals: 2520.
	self assert: (Problems new p5OldSmallestMultple: 20) equals: 232792560.
	self assert: (Problems new p5OldSmallestMultple: 2) equals: 2.
	self assert: (Problems new p5OldSmallestMultple: 6) equals: 60.

]

{ #category : #'as yet unclassified' }
ProblemsTest >> problems [
	^problems ifNil: [ problems := Problems new ]
]

{ #category : #test }
ProblemsTest >> testIsPalindrome [
	#(101 true 1 true 10 false 9009 true)
		pairsDo: [ :value :outcome | self assert: (Problems new isPalindrome: value) equals: outcome ]
]

{ #category : #test }
ProblemsTest >> testP10SumOfPrimesBelow [
	self assert: (self problems p10SumOfPrimesBelow: 10) equals: 17.
	self assert: (self problems p10SumOfPrimesBelow: 2000000) equals: 142913828922
	
]

{ #category : #test }
ProblemsTest >> testP1SumOfMultiplesOf3and5 [

	self assert: (Problems new p1SumOfMultiplesOf3and5: 10) equals: 23.
	self assert: (Problems new p1SumOfMultiplesOf3and5: 1000) equals: 233168
	
]

{ #category : #test }
ProblemsTest >> testP2EvenFibbonSumLessThan [
	self assert: (Problems new p2EvenFibbonSumLessThan: 4) equals: 2.
	self assert: (Problems new p2EvenFibbonSumLessThan: 10) equals: 10.
	self assert: (Problems new p2EvenFibbonSumLessThan: 100) equals: 44.
	self assert: (Problems new p2EvenFibbonSumLessThan: 4000000) equals: 4613732
]

{ #category : #test }
ProblemsTest >> testP3LargestPrimeFactor [

	self assert: (Problems new largestPrimeFactorOf: 13195) equals: 29.
	self assert: (Problems new largestPrimeFactorOf: 600851475143) equals: 6857 
]

{ #category : #test }
ProblemsTest >> testP4LargestPalindromeProduct [

	self assert: Problems new p4LargestPalindromeProduct  equals: 906609
]

{ #category : #test }
ProblemsTest >> testP5smallestMultple [

	self assert: (Problems new p5smallestMultple: 2) equals: 2.
	self assert: (Problems new p5smallestMultple: 6) equals: 60.
	self assert: (Problems new p5smallestMultple: 10) equals: 2520.
	self assert: (Problems new p5smallestMultple: 20) equals: 232792560.

]

{ #category : #test }
ProblemsTest >> testP6SumSquareDifference [

self assert: (Problems new p6SumSquareDifference: 100) equals: 25164150
]

{ #category : #test }
ProblemsTest >> testP7TenThousandAndFirstPrime [

self assert: (self problems  p7TenThousandAndFirstPrime: 6) equals: 13.
self assert: (self problems p7TenThousandAndFirstPrime: 10001) equals: 104743
]

{ #category : #test }
ProblemsTest >> testP8LargestProductInSeriesForDigitCount [
	| fullSeries |
	self
		assert: (self problems p8LargestProductInSeries: '7316' forDigitCount: 4)
		equals: 126.
	self
		assert: (self problems p8LargestProductInSeries: '7316' forDigitCount: 3)
		equals: 21.
	self
		assert: (self problems p8LargestProductInSeries: '7316' forDigitCount: 2)
		equals: 21.
	self
		assert:
			(self problems p8LargestProductInSeries: '73167176' forDigitCount: 2)
		equals: 42.
	fullSeries := '7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450'.
	self
		assert:
			(self problems p8LargestProductInSeries: fullSeries  forDigitCount: 4)
		equals: 5832.
			self
		assert:
			(self problems p8LargestProductInSeries: fullSeries  forDigitCount: 13)
		equals: 23514624000
]

{ #category : #test }
ProblemsTest >> testP9PythagoreanTriplesSumsTo [
	self
		assert: (self problems p9PythagoreanTriplesSumsTo: 12)
		equals: 60.
	self
		assert: (self problems p9PythagoreanTriplesSumsTo: 1000)
		equals: 31875000
]
