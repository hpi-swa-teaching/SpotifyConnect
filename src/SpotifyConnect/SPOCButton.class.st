Class {
	#name : #SPOCButton,
	#superclass : #SPOCStyle,
	#classInstVars : [
		'color'
	],
	#category : #SpotifyConnect
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'MH 5/25/2024 14:17'
}
SPOCButton class >> color [
	^ color
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'MH 5/25/2024 14:17'
}
SPOCButton class >> color: anObject [
	color := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'MH 5/25/2024 14:34'
}
SPOCButton class >> initialExtent [

	^ 20 @ 20
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/25/2024 14:39'
}
SPOCButton >> initialize [

	super initialize.
	
	self initializeExtent; 
		initializePosition
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/25/2024 14:35'
}
SPOCButton >> initializeExtent [

	self extent: SPOCButton initialExtent.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/25/2024 14:41'
}
SPOCButton >> initializePosition [

	self position: (self width/2) @ 200
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/25/2024 14:30'
}
SPOCButton >> setColor: aColor [

	self color: aColor.
	
]
