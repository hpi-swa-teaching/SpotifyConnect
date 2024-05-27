Class {
	#name : #SPOCClickable,
	#superclass : #Morph,
	#instVars : [
		'wrappee',
		'action'
	],
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/27/2024 17:12'
}
SPOCClickable class >> newUsing: aWrappeeMorph onClick: aBlock [
	| inst |
	inst := self basicNew.
	inst wrappee: aWrappeeMorph.
	inst action: aBlock.
	inst initialize.
	^ inst
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/27/2024 16:54'
}
SPOCClickable >> action [
	^ action
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/27/2024 16:54'
}
SPOCClickable >> action: anObject [
	action := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/27/2024 16:54'
}
SPOCClickable >> handlesMouseDown: anEvent [
	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/27/2024 19:50'
}
SPOCClickable >> initialize [
	super initialize.
	
	self addMorph: self wrappee; extent: self wrappee extent; color: Color transparent.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/27/2024 16:55'
}
SPOCClickable >> mouseDown: anEvent [
	self action value: anEvent.
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
