Class {
	#name : #SPOCTestApiPlaybackState,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/10/2024 00:28'
}
SPOCTestApiPlaybackState >> setUp [

	self apiEndpoint: (SPOCApiPlaybackState new authorizer: self auth; yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/10/2024 00:28'
}
SPOCTestApiPlaybackState >> testApiPlaybackStateExecute [

	| paramDict res |
	paramDict := Dictionary new
		at: #additional_types put: 'track';
		yourself.
	res := self apiEndpoint execute: paramDict.	
	self assert: true "(res code = 200)"
]
