Class {
	#name : #SPOCApiEndpointResult,
	#superclass : #Object,
	#instVars : [
		'code',
		'error',
		'response'
	],
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/3/2024 16:11'
}
SPOCApiEndpointResult >> error [
	^ error
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/3/2024 16:11'
}
SPOCApiEndpointResult >> error: anObject [
	error := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/3/2024 16:11'
}
SPOCApiEndpointResult >> response [
	^ response
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/3/2024 16:11'
}
SPOCApiEndpointResult >> response: anObject [
	response := anObject
]
