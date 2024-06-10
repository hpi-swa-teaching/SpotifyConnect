Class {
	#name : #SPOCTestApiPlaybackState,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/10/2024 00:28'
}
SPOCTestApiPlaybackState >> setUp [

	self apiEndpoint: (SPOCApiPlaybackState new authorizer: self auth; yourself)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 14:06'
}
SPOCTestApiPlaybackState >> testApiPlaybackStateExecute [

	| paramDict res |
	paramDict := Dictionary new
		at: #additional_types put: 'track';
		yourself.
	res := self apiEndpoint execute: paramDict.	
	self assert: (res class = SPOCApiEndpointResult) not
]
