"
Test the API request to pause the playback.
"
Class {
	#name : #SPOCTestApiPause,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:20'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/24/2024 03:18'
}
SPOCTestApiPause >> setUp [

	self apiEndpoint: (SPOCApiPause new authorizer: self auth)
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

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 01:53'
}
SPOCTestApiPause >> testPauseOn [

	self apiEndpoint pauseOn: self getPlaybackState device id.
	self assert: self getPlaybackState isPlaying not
]
