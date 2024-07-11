"
Tests clickable decorator for UI components.
"
Class {
	#name : #SPOCTestClickable,
	#superclass : #TestCase,
	#category : #'SpotifyConnect-Tests',
	#'squeak_changestamp' : 'TL 7/11/2024 19:33'
}

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:37'
}
SPOCTestClickable >> testClickableAction [

	| clickable value |
	value := 0.
	clickable := SPOCClickable newUsing: Morph new onClick: [:anEvent | value := 1].
	clickable mouseDown: nil.
	self assert: value = 1
]

{
	#category : #testing,
	#'squeak_changestamp' : 'VE 7/9/2024 09:11'
}
SPOCTestClickable >> testClickableActionNotSet [

	| clickable |
	clickable := SPOCClickable newUsing: Morph new onClick: nil.
	self should: [clickable mouseDown: nil] raise: Error
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:36'
}
SPOCTestClickable >> testWrappeeSubmorph [

	| clickable morph |
	morph := Morph new.
	clickable := SPOCClickable newUsing: morph onClick: nil.
	self assert: (clickable submorphs includes: morph)
]
