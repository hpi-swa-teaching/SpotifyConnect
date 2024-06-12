Class {
	#name : #SPOCTestApiVolume,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/10/2024 04:52'
}
SPOCTestApiVolume >> setUp [

	self apiEndpoint: (SPOCApiVolume new authorizer: self auth; yourself)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/11/2024 15:00'
}
SPOCTestApiVolume >> testApiVolumeExecute [

	| dict res |
	dict := Dictionary new
		at: #volume_percent put: 50;
		at: #device_id put: self getPlaybackState device id;
		yourself.
	res := self apiEndpoint execute: dict.
	self assert: (res response code = 204)
]
