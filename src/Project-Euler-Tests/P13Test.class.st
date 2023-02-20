Class {
	#name : #P13Test,
	#superclass : #ProblemsTest,
	#category : #'Project-Euler-Tests'
}

{ #category : #accessing }
P13Test >> problem [
	^ problem ifNil: [ problem := P13 new ]
]

{ #category : #test }
P13Test >> testCompute [
	self assert: self problem compute equals: '5537376230'
]

{ #category : #test }
P13Test >> testData [
	^ self problem data inspect
]
