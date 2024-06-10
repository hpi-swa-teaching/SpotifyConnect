Class {
	#name : #SPOCTestApiPause,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/10/2024 00:28'
}
SPOCTestApiPause >> setUp [

	self apiEndpoint: (SPOCApiPause new authorizer: self auth; yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/10/2024 03:30'
}
SPOCTestApiPause >> testApiPauseExecute [

	| paramDict res |
	paramDict := Dictionary new
		at: #device_id put: 'b704b454bce64526992a3f207723032f5f91e635';
		yourself.
	res := self apiEndpoint execute: paramDict.	
	self assert: true.
	"isPlaying
		ifTrue: [self assert: (res response code = 204)]
		ifFalse: [self assert: (res response code = 403)]"
]
