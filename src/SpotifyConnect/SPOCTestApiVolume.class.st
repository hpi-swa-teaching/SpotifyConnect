Class {
	#name : #SPOCTestApiVolume,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/10/2024 03:10'
}
SPOCTestApiVolume >> setUp [

	self apiEndpoint: (SPOCApiVolume new authorizer: self auth)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/10/2024 03:31'
}
SPOCTestApiVolume >> testApiVolumeExecute [

	| paramDict res |
	paramDict := Dictionary new
		at: #volume_percent put: 50;
		at: #device_id put: 'b704b454bce64526992a3f207723032f5f91e635';
		yourself.
	res := self apiEndpoint execute: paramDict.	
	res explore.
	self assert: (res response code = 204)
]
