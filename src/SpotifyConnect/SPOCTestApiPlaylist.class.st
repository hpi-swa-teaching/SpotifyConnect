"
Test the API request of a playlist.
"
Class {
	#name : #SPOCTestApiPlaylist,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:21'
}

{
	#category : #running,
	#'squeak_changestamp' : 'TL 6/24/2024 04:53'
}
SPOCTestApiPlaylist >> setUp [

	self apiEndpoint: (SPOCApiPlaylist new authorizer: self auth)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 04:56'
}
SPOCTestApiPlaylist >> testApiPlaylistExecute [

	| dict res |
	dict := Dictionary new
		at: #id put: '3cEYpjA9oz9GiPac4AsH4n';
		yourself.
	res := self apiEndpoint execute: dict.
	self assert: res class ~= SPOCApiEndpointResult
]
