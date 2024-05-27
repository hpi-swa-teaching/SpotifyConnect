Class {
	#name : #SPOCTestClickable,
	#superclass : #TestCase,
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/27/2024 17:13'
}
SPOCTestClickable >> setUp [
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/27/2024 17:14'
}
SPOCTestClickable >> testClickableAction [
	| tmp clickable |
	tmp := 0.
	clickable := SPOCClickable newUsing: Morph new onClick: [:anEvent | tmp := 1].
	clickable mouseDown: nil.
	self assert: tmp = 1.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/27/2024 16:49'
}
SPOCTestClickable >> testClickableActionNotSet [
	self should: [clickable mouseDown: nil] raise: Error
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/27/2024 17:16'
}
SPOCTestClickable >> testWrappeeSubmorph [
	| clickable tmpMorph |
	tmpMorph := Morph new.
	clickable := SPOCClickable newUsing: tmpMorph onClick: nil.
	self assert: (clickable submorphs includes: tmpMorph).
]
