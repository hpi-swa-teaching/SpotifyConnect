Class {
	#name : #SPOCTestApiTrack,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 6/5/2024 19:26'
}
SPOCTestApiTrack >> setUp [

	apiEndpoint := SPOCApiTrack new authorizer: self auth; yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 6/5/2024 19:25'
}
SPOCTestApiTrack >> testApiTrackExecute [

	| dict res |
	dict := Dictionary new.
	dict at: 'trackId' put: '4PTG3Z6ehGkBFwjybzWkR8'.
	res := apiEndpoint execute: dict.
	
	self assert: res notNil
]
