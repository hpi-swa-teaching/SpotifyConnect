Class {
	#name : #SPOCImage,
	#superclass : #ImageMorph,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/21/2024 16:37'
}
SPOCImage class >> newWithUrl: aString [
	| form |
	
	form := (Form fromBinaryStream: (HTTPSocket httpGet: aString)) scaledToSize: (SPOCSearchbar searchbarHeight * 1.5).
	^ ImageMorph new image: form
]
