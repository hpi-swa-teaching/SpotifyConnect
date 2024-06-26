Class {
	#name : #SPOCTestApiRecentlyPlayed,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/24/2024 03:01'
}
SPOCTestApiRecentlyPlayed >> setUp [

	self apiEndpoint: (SPOCApiRecentlyPlayed new authorizer: self auth)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 03:09'
}
SPOCTestApiRecentlyPlayed >> testApiRecentlyPlayedExecute [

	| dict res |
	dict := Dictionary new
			at: #limit put: SPOCRecentlyPlayed trackLimit;
			at: #before put: SPOCRecentlyPlayed beforeTimestamp;
			yourself.
	res := self apiEndpoint execute: dict.
	self assert: res class ~= SPOCApiEndpointResult
]
