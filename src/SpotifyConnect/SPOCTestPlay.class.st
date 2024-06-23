Class {
	#name : #SPOCTestPlay,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 6/23/2024 18:40'
}
SPOCTestPlay >> setUp [

	self apiEndpoint: (SPOCApiPlay new authorizer: self auth; yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 6/23/2024 23:58'
}
SPOCTestPlay >> testApiPlayOn [

	|playbackState instance|
	playbackState := self getPlaybackState.
	instance := apiEndpoint playOn: playbackState device id.
	playbackState := self getPlaybackState.
	self assert: playbackState isPlaying = true

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 6/24/2024 00:32'
}
SPOCTestPlay >> testApiPlayTrack [

	|playbackState instance trackID|
	playbackState := self getPlaybackState.
	instance := apiEndpoint playTrack: '4PTG3Z6ehGkBFwjybzWkR8' on: playbackState device id.
	playbackState := self getPlaybackState.
	self assert: trackID = '4PTG3Z6ehGkBFwjybzWkR8'

]
