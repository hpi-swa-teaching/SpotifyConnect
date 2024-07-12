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
	#category : #running,
	#'squeak_changestamp' : 'TL 6/24/2024 03:18'
}
SPOCTestApiPause >> setUp [

	self apiEndpoint: (SPOCApiPause new authorizer: self auth)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'VE 7/9/2024 11:50'
}
SPOCTestApiPause >> testApiPauseExecute [

	| dict res playbackState code |
	playbackState := self getPlaybackState.
	dict := Dictionary new
		at: #device_id put: playbackState device id;
		yourself.
	res := self apiEndpoint execute: dict.
	code := res response code.
	playbackState isPlaying
		ifTrue: [self assert: (code = 204)]
		ifFalse: [self assert: (code = 403)]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/12/2024 16:39'
}
SPOCTestApiPause >> testPauseOn [

	self apiEndpoint pauseOn: self getPlaybackState device id.
	(Delay forSeconds: 0.6) wait.
	self assert: self getPlaybackState isPlaying not
]
