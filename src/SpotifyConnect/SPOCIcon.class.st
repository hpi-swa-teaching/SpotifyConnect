"
An icon morph.
"
Class {
	#name : #SPOCIcon,
	#superclass : #CircleMorph,
	#instVars : [
		'icon'
	],
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:29'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/10/2024 05:11'
}
SPOCIcon class >> defaultAsset [

	^ '/assets/play.png'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 7/8/2024 19:31'
}
SPOCIcon class >> defaultIconPadding [

	^ 8 asPoint
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/10/2024 05:11'
}
SPOCIcon class >> iconScaling [

	^ 1 / 8
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/10/2024 05:11'
}
SPOCIcon class >> size [

	^ 32
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'TL 7/8/2024 19:40'
}
SPOCIcon >> attachIcon [

	self icon: SPOCImage new.
	self addMorph: self icon.
	self icon position: (self icon position + self class defaultIconPadding)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 16:47'
}
SPOCIcon >> icon [

	^ icon
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 16:47'
}
SPOCIcon >> icon: anObject [

	icon := anObject
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'TL 7/8/2024 20:11'
}
SPOCIcon >> iconAsset: anAssetPath [

	self icon assetPath: anAssetPath;
		magnifyBy: self class iconScaling
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'TL 7/8/2024 20:11'
}
SPOCIcon >> initialize [

	super initialize.
	
	self attachIcon; 
		initializeStyle;
		iconAsset: self class defaultAsset
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'TL 7/8/2024 20:11'
}
SPOCIcon >> initializeStyle [

	self extent: self class size asPoint; 
		color: SPOCStyle spotifyWhite; 
		borderWidth: 0
]
