Class {
	#name : #SPOCIcon,
	#superclass : #CircleMorph,
	#instVars : [
		'icon'
	],
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/27/2024 19:41'
}
SPOCIcon class >> iconScaling [
	^ 1/8
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/27/2024 19:41'
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
	#'squeak_changestamp' : 'VE 5/27/2024 19:41'
}
SPOCIcon >> iconAsset: anAssetPath [
	self icon assetPath: anAssetPath.
	self icon magnifyBy: SPOCContainedIcon iconScaling.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/27/2024 19:46'
}
SPOCIcon >> initialize [
	super initialize.
	
	self attachIcon; initializeStyle.
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
