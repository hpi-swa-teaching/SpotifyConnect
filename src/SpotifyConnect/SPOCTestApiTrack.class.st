Class {
	#name : #SPOCTestApiTrack,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/10/2024 04:51'
}
SPOCTestApiTrack >> setUp [

	self apiEndpoint: (SPOCApiTrack new authorizer: self auth; yourself)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:51'
}
SPOCTestApiTrack >> testApiTrackExecute [

	| dict res |
	dict := Dictionary new
		at: 'trackId' put: '4PTG3Z6ehGkBFwjybzWkR8';
		yourself.
	res := self apiEndpoint execute: dict.
	self assert: res notNil
]
