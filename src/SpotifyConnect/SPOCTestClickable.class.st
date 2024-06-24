Class {
	#name : #SPOCTestClickable,
	#superclass : #TestCase,
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'VE 5/27/2024 17:13'
}
SPOCTestClickable >> setUp [
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 05:03'
}
SPOCTestClickable >> testClickableAction [

	| clickable tmp |
	tmp := 0.
	clickable := SPOCClickable newUsing: Morph new onClick: [:anEvent | tmp := 1].
	clickable mouseDown: nil.
	self assert: tmp = 1
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 05:03'
}
SPOCTestClickable >> testClickableActionNotSet [

	| clickable |
	self should: [clickable mouseDown: nil] raise: Error
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 05:04'
}
SPOCTestClickable >> testWrappeeSubmorph [

	| clickable tmpMorph |
	tmpMorph := Morph new.
	clickable := SPOCClickable newUsing: tmpMorph onClick: nil.
	self assert: (clickable submorphs includes: tmpMorph)
]
