"
Test the API request of available devices with mock data.
"
Class {
	#name : #SPOCMockTestApiDevices,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint',
		'device'
	],
	#category : #'SpotifyConnect-Mock-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:23'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:55'
}
SPOCMockTestApiDevices >> apiEndpoint [

	^ apiEndpoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:55'
}
SPOCMockTestApiDevices >> apiEndpoint: anObject [

	apiEndpoint := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:55'
}
SPOCMockTestApiDevices >> device [

	^ device
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:55'
}
SPOCMockTestApiDevices >> device: anObject [

	device := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/24/2024 02:48'
}
SPOCMockTestApiDevices >> setUp [

	self apiEndpoint: (SPOCApiDevices new returnsTestContent: true);
		device: (SPOCDevice new
			id: 'string';
			name: 'Kitchen speaker';
			isActive: false;
			type: 'computer';
			volume: 59;
			supportsVolume: false;
			yourself)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 03:07'
}
SPOCMockTestApiDevices >> testMockApiDeviceExecute [

	| res |
	res := self apiEndpoint getCurrentDevices.
	self assert: (res first equals: self device)
]
