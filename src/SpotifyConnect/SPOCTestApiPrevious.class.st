Class {
	#name : #SPOCTestApiPrevious,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/24/2024 03:21'
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
	#'squeak_changestamp' : 'TL 6/24/2024 02:09'
}
SPOCTestApiPrevious >> testSkipToPreviousOn [

	| oldPlaybackState newPlaybackState |
	oldPlaybackState := self getPlaybackState.
	self apiEndpoint skipToPreviousOn: oldPlaybackState device id.
	newPlaybackState := self getPlaybackState.
	self assert: newPlaybackState track id ~= oldPlaybackState track id.
	self assert: newPlaybackState isPlaying
]
