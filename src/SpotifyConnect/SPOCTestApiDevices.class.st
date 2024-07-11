"
Test the API request of available devices.
"
Class {
	#name : #SPOCTestApiDevices,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:19'
}

{
	#category : #running,
	#'squeak_changestamp' : 'TL 6/24/2024 02:49'
}
SPOCTestApiDevices >> setUp [

	self apiEndpoint: (SPOCApiDevices new authorizer: self auth)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 02:59'
}
SPOCTestApiDevices >> testApiDevicesExecute [

	| res |
	res := self apiEndpoint execute: Dictionary new.
	self assert: res class ~= SPOCApiEndpointResult
]
