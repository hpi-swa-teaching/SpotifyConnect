Class {
	#name : #SPOCTestApiTrack,
	#superclass : #SPOCTestApiEndpoint,
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 18:05'
}
SPOCTestApiTrack >> setUp [
	apiEndpoint := SPOCApiTrack new.
	apiEndpoint isInTestMode: true.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 18:08'
}
SPOCTestApiTrack >> testExecute [
	| dict res |
	dict := Dictionary new.
	dict at: 'trackId' put: '11dFghVXANMlKmJXsNCbNl'.
	res := apiEndpoint execute: dict.
	
	self assert: res class = JsonObject
]
