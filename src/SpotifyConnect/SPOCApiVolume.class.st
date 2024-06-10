Class {
	#name : #SPOCApiVolume,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 6/10/2024 02:24'
}
SPOCApiVolume >> endpoint [

	^ 'v1/me/player/volume'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 6/10/2024 02:24'
}
SPOCApiVolume >> endpointMethod [

	^ 'PUT'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 03:28'
}
SPOCApiVolume >> executeRequest: request withParams: aParameterDictionary [

	request rawUrl: (request rawUrl, '?volume_percent=', (aParameterDictionary at: #volume_percent), '&device_id=', (aParameterDictionary at: #device_id));
		headerAt: 'Content-Length' put: 0.
	^ self client sendRequest: request
]
