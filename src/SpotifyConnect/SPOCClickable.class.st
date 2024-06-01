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
	#'squeak_changestamp' : 'VE 5/28/2024 20:55'
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
	#'squeak_changestamp' : 'VE 5/27/2024 16:54'
}
SPOCClickable >> handlesMouseDown: anEvent [
	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/1/2024 22:58'
}
SPOCClickable >> handlesMouseOver: anEvent [
	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/28/2024 20:56'
}
SPOCClickable >> initialize [
	super initialize.
	
	self addMorph: self wrappee; 
		extent: self wrappee extent; 
		color: Color transparent.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VE 5/28/2024 20:55'
}
SPOCClickable >> mouseDown: anEvent [
	self onClick value: anEvent.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/1/2024 23:13'
}
SPOCClickable >> mouseEnter: anEvent [
	Cursor webLink show
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/1/2024 23:10'
}
SPOCClickable >> mouseLeave: anEvent [
	Cursor normal show
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 20:55'
}
SPOCClickable >> onClick [
	^ onClick
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 20:55'
}
SPOCClickable >> onClick: aBlock [
	onClick := aBlock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/27/2024 17:11'
}
SPOCClickable >> wrappee [
	^ wrappee
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/27/2024 17:11'
}
SPOCClickable >> wrappee: anObject [
	wrappee := anObject
]
