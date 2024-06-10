Class {
	#name : #SPOCImage,
	#superclass : #ImageMorph,
	#instVars : [
		'url'
	],
	#category : #'SpotifyConnect-UI'
}

{
	#category : #constructor,
	#'squeak_changestamp' : 'TL 6/10/2024 05:14'
}
SPOCImage class >> newWithPath: aString [
	
	| form |
	form := (GitAssetLoader for: SPOCStyle gitRepoName) loadForm: aString.
	form := form scaledToSize: (SPOCStyle resultListItemHeight - (2 * SPOCStyle defaultMargin)).
	^ SPOCImage new
		image: form;
		yourself
]

{
	#category : #constructor,
	#'squeak_changestamp' : 'TL 6/10/2024 05:14'
}
SPOCImage class >> newWithUrl: aString [
	
	^ SPOCImage new
		url: aString;
		image: (Form fromBinaryStream: (HTTPSocket httpGet: aString));
		yourself
]

{
	#category : #formatting,
	#'squeak_changestamp' : 'RK 6/9/2024 00:08'
}
SPOCImage >> scaledTo: aNumber [
	
	url ifNil: [^ self].
	^ SPOCImage new image: ((Form fromBinaryStream: (HTTPSocket httpGet: url)) scaledToSize: aNumber)
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
