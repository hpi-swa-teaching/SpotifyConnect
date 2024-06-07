Class {
	#name : #SPOCClickable,
	#superclass : #Morph,
	#instVars : [
		'wrappee',
		'onClick'
	],
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/7/2024 11:07'
}
SPOCClickable class >> newUsing: aWrappeeMorph onClick: aBlock [

	| inst |
	inst := self basicNew.
	inst wrappee: aWrappeeMorph.
	inst onClick: aBlock.
	inst initialize.
	^ inst
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/7/2024 11:06'
}
SPOCClickable >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/7/2024 11:06'
}
SPOCClickable >> handlesMouseOver: anEvent [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/7/2024 11:07'
}
SPOCClickable >> initialize [

	super initialize.
	self addMorph: self wrappee; 
		extent: self wrappee extent; 
		color: Color transparent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/7/2024 11:07'
}
SPOCClickable >> mouseDown: anEvent [

	self onClick value: anEvent.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/7/2024 11:07'
}
SPOCClickable >> mouseEnter: anEvent [

	Cursor webLink show
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/7/2024 11:07'
}
SPOCClickable >> mouseLeave: anEvent [

	Cursor normal show
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:07'
}
SPOCClickable >> onClick [

	^ onClick
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:07'
}
SPOCClickable >> onClick: aBlock [

	onClick := aBlock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:07'
}
SPOCClickable >> wrappee [

	^ wrappee
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:07'
}
SPOCClickable >> wrappee: anObject [

	wrappee := anObject
]
