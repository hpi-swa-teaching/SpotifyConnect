"
Test the API request to skip one song ahead.
"
Class {
	#name : #SPOCTestApiNext,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:20'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/24/2024 03:18'
}
SPOCTestApiNext >> setUp [

	self apiEndpoint: (SPOCApiNext new authorizer: self auth)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/17/2024 11:49'
}
SPOCTestApiNext >> testApiNextExecute [

	| dict res |
	dict := Dictionary new
		at: #device_id put: self getPlaybackState device id;
		yourself.
	res := self apiEndpoint execute: dict.	
	self assert: (res response code = 204)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 02:08'
}
SPOCTestApiNext >> testSkipToNextOn [

	| oldPlaybackState newPlaybackState |
	oldPlaybackState := self getPlaybackState.
	self apiEndpoint skipToNextOn: oldPlaybackState device id.
	newPlaybackState := self getPlaybackState.
	"self assert: newPlaybackState track id ~= oldPlaybackState track id."
	self assert: newPlaybackState isPlaying
]
