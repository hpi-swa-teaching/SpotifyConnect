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
	#'squeak_changestamp' : 'MH 5/26/2024 12:47'
}
SPOCButton class >> initialExtent [

	^ 66 @ 44
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 12:45'
}
SPOCButton >> initialize [

	super initialize.
	
	self initializePosition;
		initializeExtent;
		openInWorld;
		initializeLook
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
	#'squeak_changestamp' : 'MH 5/26/2024 12:50'
}
SPOCButton >> initializeLook [

	|image loader|
	
	loader:= GitAssetLoader for: 'SpotifyConnect'.
	loader loadAsset: '/asset/button/PlayPause.png'.
	image:= ImageMorph new image: (loader loadAsset: '/asset/button/PlayPause.png').
	image position: 5 @ 25.
	image extent: 46 @ 24.
	image openInWorld

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 12:27'
}
SPOCButton >> initializePosition [

	self position: 0 @ 0
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/25/2024 14:30'
}
SPOCButton >> setColor: aColor [

	self color: aColor.
	
]
