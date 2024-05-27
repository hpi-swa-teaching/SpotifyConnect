Class {
	#name : #SPOCButton,
	#superclass : #SPOCStyle,
	#instVars : [
		'action',
		'iconPath'
	],
	#classInstVars : [
		'color'
	],
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/27/2024 02:57'
}
SPOCButton >> action [
	^ action
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/27/2024 02:57'
}
SPOCButton >> action: anObject [
	action := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/27/2024 02:05'
}
SPOCButton >> iconPath [
	^ iconPath
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/27/2024 02:05'
}
SPOCButton >> iconPath: anObject [
	iconPath := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 5/27/2024 02:28'
}
SPOCButton >> initialize [

	super initialize.
	
	self initializeLayout;
		initializeIcon;
		initializeButton
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 5/27/2024 01:58'
}
SPOCButton >> initializeButton [

	button := SimpleButtonMorph new.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 5/27/2024 02:27'
}
SPOCButton >> initializeIcon [

	| icon |
	
	icon := SPOCAssetImageMorph new 
		assetPath: iconPath;
		position: self position + (10 @ 10).
	"iconPath position: self position + (10 @ 10)."
	self addMorphFront: icon
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 5/27/2024 01:19'
}
SPOCButton >> initializeLayout [

	self extent: 100 @ 100;
		color: SPOCStyle spotifyGreen
]
