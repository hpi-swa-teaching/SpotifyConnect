"
Tests the API call and the change of volume.
"
Class {
	#name : #SPOCTestApiVolume,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests',
	#'squeak_changestamp' : 'OW 7/9/2024 10:43'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/24/2024 03:21'
}
SPOCTestApiVolume >> setUp [

	self apiEndpoint: (SPOCApiVolume new authorizer: self auth)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 02:41'
}
SPOCTestApiVolume >> testApiVolumeExecute [

	| device dict res |
	device := self getPlaybackState device.
	device supportsVolume
		ifTrue: [dict := Dictionary new
				at: #volume_percent put: 50;
				at: #device_id put: device id;
				yourself.
			res := self apiEndpoint execute: dict.
			self assert: (res response code = 204)]
		ifFalse: [self assert: true]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 02:41'
}
SPOCTestApiVolume >> testChangeVolumeTo [

	| device newVolume |
	device := self getPlaybackState device.
	device supportsVolume
		ifTrue: [newVolume := 70.
			self apiEndpoint changeVolumeTo: newVolume on: device id.
			self assert: self getPlaybackState device volume = newVolume]
		ifFalse: [self assert: true]
]
