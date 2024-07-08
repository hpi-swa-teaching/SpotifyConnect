"
A text in a bounding box morph with rounded sides and icon from an asset.
"
Class {
	#name : #SPOCBoxedTextWithIcon,
	#superclass : #SPOCBoxedText,
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:29'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 7/8/2024 17:09'
}
SPOCBoxedTextWithIcon class >> iconPadding [

	^ 8
]

{
	#category : #constructor,
	#'squeak_changestamp' : 'VE 7/8/2024 17:24'
}
SPOCBoxedTextWithIcon class >> newWithText: aString withIcon: anAssetPath [

	^ SPOCBoxedTextWithIcon new contents: (' ', aString);
		position: self iconPadding @ 0;
		withAssetPath: anAssetPath;
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/8/2024 16:40'
}
SPOCBoxedTextWithIcon >> initialize [

	super initialize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/19/2024 16:27'
}
SPOCBoxedTextWithIcon >> withAssetPath: anAssetPath [

	self addMorph: (SPOCIcon new iconAsset: anAssetPath)
]
