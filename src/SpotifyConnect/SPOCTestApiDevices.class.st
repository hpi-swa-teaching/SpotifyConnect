Class {
	#name : #SPOCTestApiDevices,
	#superclass : #SPOCTestApiEndpoint,
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 5/25/2024 21:36'
}
SPOCTestApiDevices >> setUp [
	apiEndpoint := SPOCApiDevices new.
	apiEndpoint returnsTestContent: true.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 5/25/2024 21:42'
}
SPOCTestApiDevices >> testExecute [
	| dict res devices |
	dict := Dictionary new.
	res := apiEndpoint execute: dict.
	devices := res first.
	self assert: devices id = 'string'.
	self assert: devices name = 'Kitchen speaker'.
	self assert: devices isActive = false.
	self assert: devices isPrivateSession = false.
	self assert: devices isRestricted = false.
	self assert: devices type = 'computer'.
	self assert: devices volume = 59.
	self assert: devices supportsVolume = false
]
