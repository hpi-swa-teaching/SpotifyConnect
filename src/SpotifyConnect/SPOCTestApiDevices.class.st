Class {
	#name : #SPOCTestApiDevices,
	#superclass : #SPOCTestApiEndpoint,
	#instVars : [
		'device'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 5/27/2024 16:32'
}
SPOCTestApiDevices >> setUp [
	apiEndpoint := SPOCApiDevices new.
	device := SPOCDevice new.
	device id: 'string'.
	device name: 'Kitchen speaker'.
	device isActive: false.
	device isPrivateSession: false.
	device isRestricted: false.
	device type: 'computer'.
	device volume: 59.
	device supportsVolume: false.
	apiEndpoint returnsTestContent: true.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 5/27/2024 16:36'
}
SPOCTestApiDevices >> testExecute [
	| dict res resDevice |
	dict := Dictionary new.
	res := apiEndpoint execute: dict.
	resDevice := res first.
	self assert: (device equals: resDevice)
]
