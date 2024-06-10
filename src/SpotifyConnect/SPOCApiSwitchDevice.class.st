Class {
	#name : #SPOCApiSwitchDevice,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API'
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
	#'squeak_changestamp' : 'TL 6/10/2024 03:43'
}
SPOCApiSwitchDevice >> executeRequest: request withParams: aParameterDictionary [

	| data |
	data := '{"device_ids": ["', (aParameterDictionary at: #deviceID), '"]}'.
	request headerAt: 'Content-Length' put: data size.
	^ self client sendRequest: request content: data readStream size: data size
]
