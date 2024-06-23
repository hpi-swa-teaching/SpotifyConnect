Class {
	#name : #SPOCTestPause,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 6/24/2024 00:19'
}
SPOCTestPause >> setUp [

	self apiEndpoint: (SPOCApiPlay new authorizer: self auth; yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 6/24/2024 00:27'
}
SPOCTestPause >> testApiPause [

	|playbackState|
	playbackState := self getPlaybackState.
	apiEndpoint playOn: playbackState device id.
	self apiEndpoint: (SPOCApiPause new authorizer: self auth; yourself).
	apiEndpoint pauseOn: playbackState device id.
	playbackState := self getPlaybackState.
	self assert: playbackState isPlaying = false
]
