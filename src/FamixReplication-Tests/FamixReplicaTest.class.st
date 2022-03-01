Class {
	#name : #FamixReplicaTest,
	#superclass : #TestCase,
	#category : #'FamixReplication-Tests-Entities'
}

{ #category : #tests }
FamixReplicaTest >> testContiguousApreviousB [
	| a b entity |
	entity := FamixRepTestMethod new.
	a := FamixReplica from: 2 to: 4 for: entity.
	b := FamixReplica from: 5 to: 8 for: entity.
	self assert: (a isContiguousWith: b)
]

{ #category : #'as yet unclassified' }
FamixReplicaTest >> testContiguousApreviousB_amp [

	"SmallAmp has derived this test from `FamixReplicaTest>>#testContiguousApreviousB` by regenerating its assertions.
	This test can cover these parts:
	*	In `FamixReplica>> #replicaFileName` from 110 to 133:
		Operation: RemoveCaretOperator
		Code snippet: `^ 'no replica file name'`
		Dynamic state: nil
		Mutant id: RemoveCaretOperator#FamixReplica#replicaFileName#110#133
	*	In `FamixReplica>> #length` from 11 to 39:
		Operation: ReplaceMinusWithPlusMutantOperator
		Code snippet: `(self endLine - self startLine)`
		Dynamic state: nil
		Mutant id: ReplaceMinusWithPlusMutantOperator#FamixReplica#length#11#39
	*	In `FamixReplica>> #replicatedFragment` from 22 to 41:
		Operation: RemoveCaretOperator
		Code snippet: `^ replicatedFragment`
		Dynamic state: {#replicatedFragment->nil}
		Mutant id: RemoveCaretOperator#FamixReplica#replicatedFragment#22#41
	*	In `FamixReplica>> #length` from 11 to 43:
		Operation: ReplacePlusWithMinusMutantOperator
		Code snippet: `self endLine - self startLine + 1`
		Dynamic state: nil
		Mutant id: ReplacePlusWithMinusMutantOperator#FamixReplica#length#11#43
	*	In `FamixReplica>> #length` from 9 to 43:
		Operation: RemoveCaretOperator
		Code snippet: `^ self endLine - self startLine + 1`
		Dynamic state: nil
		Mutant id: RemoveCaretOperator#FamixReplica#length#9#43
	*	In `FamixReplica>> #name` from 7 to 57:
		Operation: RemoveCaretOperator
		Code snippet: `^ self entity ifNil: [ #undefined ] ifNotNil: #name`
		Dynamic state: nil
		Mutant id: RemoveCaretOperator#FamixReplica#name#7#57
"

	<madeBySmallAmp>
	| a b entity |
	entity := FamixRepTestMethod new.
	a := FamixReplica from: 2 to: 4 for: entity.
	self
		assert: a name isNil;
		assert: a replicaFileName equals: 'no replica file name';
		assert: a replicatedFragment isNil;
		assert: a length equals: 3;
		deny: a hasReplicatedFragment.
	b := FamixReplica from: 5 to: 8 for: entity
]

{ #category : #tests }
FamixReplicaTest >> testContiguousApreviousBdifferentsEntities [
	| a b entity1 entity2 |
	entity1 := FamixRepTestMethod new.
	entity2 := FamixRepTestMethod new.
	a := FamixReplica from: 2 to: 4 for: entity1.
	b := FamixReplica from: 5 to: 8 for: entity2.
	self deny: (a isContiguousWith: b)
]

{ #category : #tests }
FamixReplicaTest >> testContiguousApreviousBwithUnion [
	| a b entity |
	entity := FamixRepTestMethod new.
	a := FamixReplica from: 2 to: 4 for: entity.
	b := FamixReplica from: 4 to: 8 for: entity.
	self assert: (a isContiguousWith: b)
]

{ #category : #tests }
FamixReplicaTest >> testContiguousBpreviousA [
	| a b entity |
	entity := FamixRepTestMethod new.
	b := FamixReplica from: 2 to: 4 for: entity.
	a := FamixReplica from: 5 to: 8 for: entity.
	self assert: (a isContiguousWith: b)
]

{ #category : #tests }
FamixReplicaTest >> testContiguousBpreviousAwithUnion [
	| a b entity |
	entity := FamixRepTestMethod new.
	b := FamixReplica from: 2 to: 4 for: entity.
	a := FamixReplica from: 4 to: 8 for: entity.
	self assert: (a isContiguousWith: b)
]

{ #category : #tests }
FamixReplicaTest >> testContiguousDifferentLength [
	| a b entity |
	"For the moment, we do not consider the cases where the lengths of the merging fragments is different. Added this test to understand the behavior in case of different lengths"
	entity := FamixRepTestMethod new.
	a := FamixReplica from: 2 to: 4 for: entity.
	b := FamixReplica from: 1 to: 10 for: entity.
	self assert: (a isContiguousWith: b)
]

{ #category : #tests }
FamixReplicaTest >> testNotContiguousApreviousB [
	| a b entity |
	entity := FamixRepTestMethod new.
	a := FamixReplica from: 2 to: 4 for: entity.
	b := FamixReplica from: 6 to: 8 for: entity.
	self deny: (a isContiguousWith: b)
]

{ #category : #tests }
FamixReplicaTest >> testNotContiguousBpreviousA [
	| a b entity |
	entity := FamixRepTestMethod new.
	b := FamixReplica from: 2 to: 4 for: entity.
	a := FamixReplica from: 6 to: 8 for: entity.
	self deny: (a isContiguousWith: b)
]
