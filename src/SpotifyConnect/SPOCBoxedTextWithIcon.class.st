Class {
	#name : #SPOCBoxedTextWithIcon,
	#superclass : #SPOCBoxedText,
	#category : #'SpotifyConnect-UI'
}

{
	#category : #constructor,
	#'squeak_changestamp' : 'VK 6/19/2024 16:21'
}
SPOCBoxedTextWithIcon class >> newWithText: aString withIcon: anAssetPath [

	| text |
	text := SPOCBoxedTextWithIcon new contents: aString;
				position: SPOCStyle iconPadding @ 0;
				withAssetPath: anAssetPath;
				yourself.
	^ text
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/19/2024 16:23'
}
SPOCBoxedTextWithIcon >> initialize [

	super initialize.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/19/2024 16:27'
}
SPOCBoxedTextWithIcon >> withAssetPath: anAssetPath [

	self addMorph: (SPOCIcon new iconAsset: anAssetPath)
]
