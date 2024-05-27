Class {
	#name : #SPOCIcon,
	#superclass : #Morph,
	#instVars : [
		'icon'
	],
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/27/2024 19:23'
}
SPOCIcon >> iconAsset: anAssetPath [
	icon assetPath: anAssetPath
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/27/2024 19:22'
}
SPOCIcon >> initialize [
	super initialize.
	
	icon := SPOCAssetImageMorph new.
	
	self color: SPOCStyle spotifyBlack;
		extent: 50@50;
		addMorph: icon.
]
