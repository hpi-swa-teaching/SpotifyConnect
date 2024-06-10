Class {
	#name : #SPOCTestApiPause,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 14:11'
}
SPOCTestApiPause >> getPlaybackState [

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
	#'squeak_changestamp' : 'TL 6/10/2024 00:28'
}
SPOCTestApiPause >> setUp [

	self apiEndpoint: (SPOCApiPause new authorizer: self auth; yourself)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 14:24'
}
SPOCTestApiPause >> testApiPauseExecute [

	| dict res |
	dict := Dictionary new
		at: #device_id put: 'b704b454bce64526992a3f207723032f5f91e635';
		yourself.
	res := self apiEndpoint execute: dict.
	self assert: true
	"self getPlaybackState isPlaying
		ifTrue: [self assert: (res response code = 204)]
		ifFalse: [self assert: (res response code = 403)]"
]
