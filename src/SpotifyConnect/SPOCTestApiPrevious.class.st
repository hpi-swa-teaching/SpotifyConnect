Class {
	#name : #SPOCTestApiPrevious,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/10/2024 00:28'
}
SPOCTestApiPrevious >> setUp [

	self apiEndpoint: (SPOCApiPrevious new authorizer: self auth; yourself)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/11/2024 14:58'
}
SPOCTestApiPrevious >> testApiNextExecute [

	| dict res |
	dict := Dictionary new
		at: #device_id put: self getPlaybackState device id;
		yourself.
	res := self apiEndpoint execute: dict.
	self assert: (res response code = 204)
]
