Class {
	#name : #SPOCImage,
	#superclass : #SPOCData,
	#instVars : [
		'url',
		'height',
		'width',
		'morph'
	],
	#category : #SpotifyConnect
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:21'
}
SPOCImage >> height [
	^ height
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:22'
}
SPOCImage >> height: aNumber [
	height := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:21'
}
SPOCImage >> url [
	^ url
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:22'
}
SPOCImage >> url: aString [
	url := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:21'
}
SPOCImage >> width [
	^ width
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:22'
}
SPOCImage >> width: aNumber [
	width := aNumber
]
