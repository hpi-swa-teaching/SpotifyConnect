Class {
	#name : #SPOCMockTestApiDevice,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint',
		'device'
	],
	#category : #'SpotifyConnect-Mock-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:55'
}
SPOCMockTestApiDevice >> apiEndpoint [

	^ apiEndpoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:55'
}
SPOCMockTestApiDevice >> apiEndpoint: anObject [

	apiEndpoint := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:55'
}
SPOCMockTestApiDevice >> device [

	^ device
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:55'
}
SPOCMockTestApiDevice >> device: anObject [

	device := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/10/2024 04:57'
}
SPOCMockTestApiDevice >> setUp [

	self apiEndpoint: SPOCApiDevices new;
		device: (SPOCDevice new
			id: 'string';
			name: 'Kitchen speaker';
			isActive: false;
			isPrivateSession: false;
			isRestricted: false;
			type: 'computer';
			volume: 59;
			supportsVolume: false;
			yourself).
	self apiEndpoint returnsTestContent: true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:53'
}
SPOCMockTestApiDevice >> testMockApiDeviceExecute [

	| dict res resDevice |
	dict := Dictionary new.
	res := self apiEndpoint execute: dict.
	resDevice := res first.
	self assert: (self device equals: resDevice)
]
