Class {
	#name : #SPOCTestApiDevices,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #setup,
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
