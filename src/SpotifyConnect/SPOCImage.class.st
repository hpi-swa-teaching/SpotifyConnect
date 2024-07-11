"
An image morph.
"
Class {
	#name : #SPOCImage,
	#superclass : #ImageMorph,
	#classInstVars : [
		'form'
	],
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:29'
}

{
	#category : #constructor,
	#'squeak_changestamp' : 'TL 7/11/2024 20:04'
}
SPOCImage class >> newWithPath: aString [
	
	^ SPOCImage new image: ((GitAssetLoader for: SPOCApp gitRepoName) loadForm: aString)
]

{
	#category : #constructor,
	#'squeak_changestamp' : 'TL 7/11/2024 19:01'
}
SPOCImage class >> newWithUrl: aString [
	
	^ SPOCImage new image: (Form fromBinaryStream: (HTTPSocket httpGet: aString));
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/11/2024 20:04'
}
SPOCImage >> assetPath: anAssetPath [

	self image: ((GitAssetLoader for: SPOCApp gitRepoName) loadAsset: anAssetPath).
	self changed
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 19:01'
}
SPOCImage >> equals: anImage [

	^ (self image bits = anImage image bits)
]

{
	#category : #formatting,
	#'squeak_changestamp' : 'VE 7/8/2024 17:08'
}
SPOCImage >> magnifyBy: aMagnification [

	self image: (self form magnifyBy: aMagnification)
]

{
	#category : #formatting,
	#'squeak_changestamp' : 'TL 7/8/2024 20:11'
}
SPOCImage >> scaledTo: aNumber [
	
	^ self class new image: (self image scaledToSize: aNumber)
]
