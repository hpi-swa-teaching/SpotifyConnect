"
Test the API request to play a song.
"
Class {
	#name : #SPOCTestApiPlay,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:20'
}

{
	#category : #running,
	#'squeak_changestamp' : 'TL 6/24/2024 03:18'
}
SPOCTestApiPlay >> setUp [

	self apiEndpoint: (SPOCApiPlay new authorizer: self auth)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'MH 6/23/2024 18:59'
}
SPOCTestApiPlay >> testApiPlayExecute [

	| dict res playbackState |
	playbackState := self getPlaybackState.
	dict := Dictionary new
		at: #device_id put: playbackState device id;
		yourself.
	res := self apiEndpoint execute: dict.
	playbackState isPlaying
		ifTrue: [self assert: (res response code = 403)]
		ifFalse: [self assert: (res response code = 204)]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 01:52'
}
SPOCTestApiPlay >> testApiPlayTrackExecute [

	| dict res |
	dict := Dictionary new
		at: #device_id put: self getPlaybackState device id;
		at: #uris put: '"spotify:track:4PTG3Z6ehGkBFwjybzWkR8"';
		yourself.
	res := self apiEndpoint execute: dict.
	self assert: res response code = 204
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 01:52'
}
SPOCTestApiPlay >> testApiPlayTrackwithAlbumExecute [

	| dict res |
	dict := Dictionary new
		at: #device_id put: self getPlaybackState device id;
		at: #context_uri put: '"spotify:album:37i9dQZF1E4xipYPjRSrPX"';
		at: #uris put: '"spotify:track:4PTG3Z6ehGkBFwjybzWkR8"';
		yourself.
	res := self apiEndpoint execute: dict.
	self assert: res response code = 204
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 01:52'
}
SPOCTestApiPlay >> testApiPlayTrackwithPlaylistExecute [

	| dict res |
	dict := Dictionary new
		at: #device_id put: self getPlaybackState device id;
		at: #context_uri put: '"spotify:playlist:37i9dQZF1E4xipYPjRSrPX"';
		at: #uris put: '"spotify:track:4PTG3Z6ehGkBFwjybzWkR8"';
		yourself.
	res := self apiEndpoint execute: dict.
	self assert: res response code = 204
]
