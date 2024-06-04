Class {
	#name : #SPOCImage,
	#superclass : #ImageMorph,
	#instVars : [
		'url'
	],
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/1/2024 15:10'
}
SPOCImage class >> newWithUrl: aString [
	
	| img |
	img := SPOCImage new url: aString;
		image: (Form fromBinaryStream: (HTTPSocket httpGet: aString));
		yourself.
	^ img
]

{
	#category : #formatting,
	#'squeak_changestamp' : 'RK 6/1/2024 15:21'
}
SPOCImage >> scaledTo: aNumber [
	
	"form := (Form fromBinaryStream: (HTTPSocket httpGet: url)) scaledToSize: aNumber."
	
	^ SPOCImage new image: ((Form fromBinaryStream: (HTTPSocket httpGet: url)) scaledToSize: aNumber)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/1/2024 14:50'
}
SPOCImage >> url [
	^ url
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/1/2024 15:08'
}
SPOCImage >> url: aString [
	url := aString
]
