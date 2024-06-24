Class {
	#name : #SPOCTestApiPlaybackState,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #setup,
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
