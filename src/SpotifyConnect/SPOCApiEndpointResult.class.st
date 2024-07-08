"
I hold the result and the possible error of API requests.
"
Class {
	#name : #SPOCApiEndpointResult,
	#superclass : #Object,
	#instVars : [
		'code',
		'error',
		'response'
	],
	#category : #'SpotifyConnect-Utils',
	#'squeak_changestamp' : 'OW 7/4/2024 12:31'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/8/2024 16:26'
}
SPOCApiEndpointResult >> error [

	^ error
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/8/2024 16:26'
}
SPOCApiEndpointResult >> error: anObject [

	error := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/8/2024 16:26'
}
SPOCApiEndpointResult >> response [

	^ response
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/8/2024 16:26'
}
SPOCApiEndpointResult >> response: anObject [

	response := anObject
]
