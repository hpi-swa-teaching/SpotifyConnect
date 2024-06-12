Class {
	#name : #SPOCTestApiPlaybackState,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/11/2024 15:02'
}
SPOCTestApiPlaybackState >> testApiPlaybackStateExecute [

	self assert: (self getPlaybackState class = SPOCApiEndpointResult) not
]
