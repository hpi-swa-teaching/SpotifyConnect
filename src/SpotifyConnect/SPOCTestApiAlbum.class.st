Class {
	#name : #SPOCTestApiAlbum,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/24/2024 03:18'
}
SPOCTestApiAlbum >> setUp [

	self apiEndpoint: (SPOCApiAlbum new authorizer: self auth)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 02:59'
}
SPOCTestApiAlbum >> testApiAlbumExecute [

	| dict res |
	dict := Dictionary new
		at: #id put: '6DEjYFkNZh67HP7R9PSZvv';
		yourself.
	res := self apiEndpoint execute: dict.
	self assert: res class ~= SPOCApiEndpointResult
]
