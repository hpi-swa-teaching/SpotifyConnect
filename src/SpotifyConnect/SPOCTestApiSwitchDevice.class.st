"
Test the API request to switch the active device.
"
Class {
	#name : #SPOCTestApiSwitchDevice,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests',
	#'squeak_changestamp' : 'OW 7/9/2024 10:42'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/24/2024 03:18'
}
SPOCTestApiSwitchDevice >> setUp [

	self apiEndpoint: (SPOCApiSwitchDevice new authorizer: self auth)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 01:57'
}
SPOCTestApiSwitchDevice >> testApiSwitchDeviceExecute [

	| dict res |
	dict := Dictionary new
		at: #device_id put: self getPlaybackState device id;
		yourself.
	res := self apiEndpoint execute: dict.
	self assert: (res response code = 204)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 02:05'
}
SPOCTestApiSwitchDevice >> testSwitchDeviceTo [

	| newDeviceID |
	newDeviceID := self getPlaybackState device id.
	self apiEndpoint switchDeviceTo: newDeviceID.
	self assert: self getPlaybackState device id = newDeviceID
]
