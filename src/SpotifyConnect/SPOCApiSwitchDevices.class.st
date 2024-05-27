Class {
	#name : #SPOCApiSwitchDevices,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 5/27/2024 15:08'
}
SPOCApiSwitchDevices >> executeRequest: request withParams: aParameterDictionary [
	| jsonString |
	jsonString := Json
	request headerAt: 'Content-Length' put: 0.
	^ self client sendRequest: request content: ('{...}' readStream) size: 0
]
