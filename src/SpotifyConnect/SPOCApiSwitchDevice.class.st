"
concrete API endpoint for switching the playing device
"
Class {
	#name : #SPOCApiSwitchDevice,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API',
	#'squeak_changestamp' : 'OW 7/4/2024 12:01'
}

{
	#category : #parameters,
	#'squeak_changestamp' : 'VK 6/3/2024 12:19'
}
SPOCApiSwitchDevice >> endpoint [

	^ 'v1/me/player'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'VK 6/3/2024 12:19'
}
SPOCApiSwitchDevice >> endpointMethod [

	^ 'PUT'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'VK 6/17/2024 11:33'
}
SPOCApiSwitchDevice >> executeRequest: request withParams: aParameterDictionary [

	| data |
	data := '{"device_ids": ["', (aParameterDictionary at: #device_id), '"]}'.
	request headerAt: 'Content-Length' put: data size.
	^ self client sendRequest: request content: data readStream size: data size
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/7/2024 03:27'
}
SPOCApiSwitchDevice >> switchDeviceTo: aDevice [
	
	self execute: (Dictionary new at: #device_id put: aDevice; yourself)
]
