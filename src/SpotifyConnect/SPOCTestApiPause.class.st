Class {
	#name : #SPOCTestApiPause,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/10/2024 00:28'
}
SPOCTestApiPause >> setUp [

	self apiEndpoint: (SPOCApiPause new authorizer: self auth; yourself)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:12'
}
SPOCTestApiPause >> testApiPauseExecute [

	| dict res playbackState |
	playbackState := self getPlaybackState.
	dict := Dictionary new
		at: #device_id put: playbackState device id;
		yourself.
	res := self apiEndpoint execute: dict.
	playbackState isPlaying
		ifTrue: [self assert: (res response code = 204)]
		ifFalse: [self assert: (res response code = 403)]
]
