Class {
	#name : #SPOCTestApiAlbum,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'RK 6/16/2024 13:17'
}
SPOCTestApiAlbum >> setUp [

	self apiEndpoint: (SPOCApiAlbum new authorizer: self auth; yourself)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/17/2024 11:59'
}
SPOCTestApiAlbum >> testApiAlbumExecute [

	| dict res |
	dict := Dictionary new
		at: #id put: '6DEjYFkNZh67HP7R9PSZvv';
		yourself.
	res := self apiEndpoint execute: dict.
	self assert: (res class = SPOCApiEndpointResult) not
]
