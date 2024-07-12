"
Test the API request to skip to the previous song.
"
Class {
	#name : #SPOCTestApiPrevious,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:22'
}

{
	#category : #running,
	#'squeak_changestamp' : 'TL 7/12/2024 16:45'
}
SPOCTestApiPrevious >> setUp [

	self apiEndpoint: (SPOCApiPrevious new authorizer: self auth)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/17/2024 11:51'
}
SPOCTestApiPrevious >> testApiPreviousExecute [

	| dict res |
	dict := Dictionary new
		at: #device_id put: self getPlaybackState device id;
		yourself.
	res := self apiEndpoint execute: dict.
	self assert: (res response code = 204)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/12/2024 16:26'
}
SPOCTestApiPrevious >> testSkipToPreviousOn [

	| oldPlaybackState newPlaybackState |
	oldPlaybackState := self getPlaybackState.
	self apiEndpoint skipToPreviousOn: oldPlaybackState device id.
	(Delay forSeconds: 0.6) wait.
	newPlaybackState := self getPlaybackState.
	self assert: newPlaybackState track id ~= oldPlaybackState track id.
	self assert: newPlaybackState isPlaying
]
