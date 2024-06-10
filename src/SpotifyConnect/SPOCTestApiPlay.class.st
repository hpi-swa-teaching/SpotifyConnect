Class {
	#name : #SPOCTestApiPlay,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 14:11'
}
SPOCTestApiPlay >> getPlaybackState [

	| apiEndpoint dict |
	dict := Dictionary new
		at: #additional_types put: 'track';
		yourself.
	apiEndpoint := SPOCApiPlaybackState new
		authorizer: self auth;
		yourself.
	^ apiEndpoint execute: dict
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/10/2024 04:44'
}
SPOCTestApiPlay >> setUp [

	self apiEndpoint: (SPOCApiPlay new authorizer: self auth; yourself)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:08'
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
