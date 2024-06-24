Class {
	#name : #SPOCTestApiTrack,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/24/2024 03:21'
}
SPOCTestApiTrack >> setUp [

	self apiEndpoint: (SPOCApiTrack new authorizer: self auth)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 02:06'
}
SPOCTestApiTrack >> testApiTrackExecute [

	| dict res |
	dict := Dictionary new
		at: #trackId put: '4PTG3Z6ehGkBFwjybzWkR8';
		yourself.
	res := self apiEndpoint execute: dict.
	self assert: res notNil
]
