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
	#'squeak_changestamp' : 'VK 6/11/2024 14:50'
}
SPOCTestApiNext >> testApiNextExecute [

	| dict res |
	dict := Dictionary new
		at: #device_id put: 'b704b454bce64526992a3f207723032f5f91e635';
		yourself.
	res := self apiEndpoint execute: dict.	
	self assert: (res response code = 204)
]
