Class {
	#name : #SPOCMockTestApiDevice,
	#superclass : #TestCase,
	#instVars : [
		'device',
		'apiEndpoint'
	],
	#category : #'SpotifyConnect-Mock-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/5/2024 19:35'
}
SPOCMockTestApiDevice >> setUp [
	apiEndpoint := SPOCApiDevices new.
	device := SPOCDevice new.
	device id: 'string';
		name: 'Kitchen speaker';
		isActive: false;
		isPrivateSession: false;
		isRestricted: false;
		type: 'computer';
		volume: 59;
		supportsVolume: false.
	apiEndpoint returnsTestContent: true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/5/2024 19:38'
}
SPOCMockTestApiDevice >> testMockApiDeviceExecute [
	| dict res resDevice |
	dict := Dictionary new.
	res := apiEndpoint execute: dict.
	resDevice := res first.
	self assert: (device equals: resDevice)
]
