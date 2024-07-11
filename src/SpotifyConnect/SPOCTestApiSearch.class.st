"
Test the API request to search.
"
Class {
	#name : #SPOCTestApiSearch,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:23'
}

{
	#category : #running,
	#'squeak_changestamp' : 'TL 6/24/2024 03:18'
}
SPOCTestApiSearch >> setUp [

	self apiEndpoint: (SPOCApiSearch new authorizer: self auth)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/8/2024 17:20'
}
SPOCTestApiSearch >> testApiSearchExecute [

	| dict res |
	dict := Dictionary new
			at: #input put: 'Morning+Blue';
			at: #type put: 'track';
			at: #limit put: SPOCStyle defaultRequestLimit;
			yourself.
	res := self apiEndpoint execute: dict.
	self assert: res class ~= SPOCApiEndpointResult
]
