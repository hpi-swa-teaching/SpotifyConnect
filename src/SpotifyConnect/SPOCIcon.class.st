Class {
	#name : #SPOCIcon,
	#superclass : #CircleMorph,
	#instVars : [
		'icon'
	],
	#category : #'SpotifyConnect-UI'
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
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/27/2024 19:46'
}
SPOCIcon >> attachIcon [
	self icon: SPOCAssetImageMorph new.
	self addMorph: self icon.
	self icon position: (self icon position + 8 asPoint)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/27/2024 19:39'
}
SPOCIcon >> icon [
	^ icon
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/27/2024 19:39'
}
SPOCIcon >> icon: anObject [
	icon := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 13:36'
}
SPOCIcon >> iconAsset: anAssetPath [
	self icon assetPath: anAssetPath.
	self icon magnifyBy: SPOCIcon iconScaling.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/28/2024 13:36'
}
SPOCIcon >> initialize [
	super initialize.
	
	self attachIcon; 
		initializeStyle;
		iconAsset: SPOCIcon defaultAsset.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/27/2024 19:54'
}
SPOCIcon >> initializeStyle [	
	self extent: SPOCIcon size asPoint; 
		color: SPOCStyle spotifyWhite; 
		borderWidth: 0
]
