"
An image morph.
"
Class {
	#name : #SPOCImage,
	#superclass : #ImageMorph,
	#instVars : [
		'url'
	],
	#classInstVars : [
		'form'
	],
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:29'
}

{
	#category : #constructor,
	#'squeak_changestamp' : 'VE 7/8/2024 17:01'
}
SPOCImage class >> newWithPath: aString [
	
	^ SPOCImage new
		image: ((GitAssetLoader for: SPOCStyle gitRepoName) loadForm: aString);
		yourself
]

{
	#category : #constructor,
	#'squeak_changestamp' : 'TL 7/8/2024 17:16'
}
SPOCImage class >> newWithUrl: aString [
	
	^ SPOCImage new url: aString;
		image: (Form fromBinaryStream: (HTTPSocket httpGet: aString));
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 7/8/2024 17:08'
}
SPOCImage >> assetPath: anAssetPath [

	self image: ((GitAssetLoader for: SPOCStyle gitRepoName) loadAsset: anAssetPath).
	self changed
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/23/2024 16:28'
}
SPOCImage >> equals: anImage [

	^ (self url = anImage url)
]

{
	#category : #accessing,
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

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:59'
}
SPOCImage >> url [

	^ url
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:59'
}
SPOCImage >> url: aString [

	url := aString
]
