Class {
	#name : #SPOCTestApiSearch,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/24/2024 03:18'
}
SPOCTestApiSearch >> setUp [

	self apiEndpoint: (SPOCApiSearch new authorizer: self auth)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 03:27'
}
SPOCTestApiSearch >> testApiSearchExecute [

	| dict res |
	dict := Dictionary new
			at: #input put: 'Morning+Blue';
			at: #type put: 'track';
			at: #limit put: SPOCStyle resultListLimit;
			yourself.
	res := self apiEndpoint execute: dict.
	self assert: res class ~= SPOCApiEndpointResult
]
