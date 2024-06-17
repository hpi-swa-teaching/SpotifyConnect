Class {
	#name : #SPOCTestApiSwitchDevice,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'VK 6/17/2024 11:27'
}
SPOCTestApiSwitchDevice >> setUp [

	self apiEndpoint: (SPOCApiSwitchDevice new authorizer: self auth; yourself)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'VK 6/17/2024 11:28'
}
SPOCTestApiSwitchDevice >> testApiPreviousExecute [

	| dict res |
	dict := Dictionary new
		at: #device_id put: self getPlaybackState device id;
		yourself.
	res := self apiEndpoint execute: dict.
	self assert: (res response code = 204)
]
