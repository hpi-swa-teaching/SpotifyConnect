Class {
	#name : #SPOCApiVolume,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API'
}

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/17/2024 20:06'
}
SPOCApiVolume >> changeVolumeTo: aVolume on: aDevice [

	self execute: (Dictionary new
			at: #volume_percent put: aVolume;
			at: #device_id put: aDevice;
			yourself)
]

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
