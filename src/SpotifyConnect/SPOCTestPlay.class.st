Class {
	#name : #SPOCTestPlay,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/24/2024 03:21'
}
SPOCTestPlay >> setUp [

	self apiEndpoint: (SPOCApiPlay new authorizer: self auth)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 02:30'
}
SPOCTestPlay >> testPlayOn [
	
	self apiEndpoint playOn: self getPlaybackState device id.
	self assert: self getPlaybackState isPlaying
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 02:30'
}
SPOCTestPlay >> testPlayTrackOn [

	| playbackState |
	self apiEndpoint playTrack: '4PTG3Z6ehGkBFwjybzWkR8' on: self getPlaybackState device id.
	playbackState := self getPlaybackState.
	self assert: playbackState track id = '4PTG3Z6ehGkBFwjybzWkR8'.
	self assert: playbackState isPlaying

]

{
	#category : #testing,
	#'squeak_changestamp' : 'MH 7/7/2024 15:50'
}
SPOCTestPlay >> testPlayTrackWithContextOn [

	| playbackState |
	self apiEndpoint playTrack: '4PTG3Z6ehGkBFwjybzWkR8' withAlbum: '6eUW0wxWtzkFdaEFsTJto6' on: self getPlaybackState device id.
	playbackState := self getPlaybackState.
	self assert: playbackState track id = '4PTG3Z6ehGkBFwjybzWkR8'.
	self assert: playbackState track album id = '6eUW0wxWtzkFdaEFsTJto6'.
	self assert: playbackState isPlaying

]
