Class {
	#name : #SPOCTestApiNext,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/10/2024 00:27'
}
SPOCTestApiNext >> setUp [

	self apiEndpoint: (SPOCApiNext new authorizer: self auth; yourself)
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
