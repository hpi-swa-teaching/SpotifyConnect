"
Test the API request of the current playback state.
"
Class {
	#name : #SPOCTestApiPlaybackState,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:21'
}

{
	#category : #running,
	#'squeak_changestamp' : 'TL 6/24/2024 03:20'
}
SPOCTestApiPlaybackState >> setUp [

	self apiEndpoint: (SPOCApiPlaybackState new authorizer: self auth)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 03:23'
}
SPOCTestApiPlaybackState >> testApiPlaybackStateExecute [

	| dict res |
	dict := Dictionary new
		at: #additional_types put: 'track';
		yourself.
	res := self apiEndpoint execute: dict.
	self assert: res class ~= SPOCApiEndpointResult
]
