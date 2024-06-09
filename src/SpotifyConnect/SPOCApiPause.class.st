Class {
	#name : #SPOCApiPause,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 21:26'
}
SPOCApiPause >> endpoint [ 
	
	^ 'v1/me/player/pause'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 21:26'
}
SPOCApiPause >> endpointMethod [
	
	^ 'PUT'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/10/2024 01:17'
}
SPOCApiPause >> executeRequest: request withParams: aParamDictionary [

	request rawUrl: (request rawUrl, '?device_id=', (aParamDictionary at: #device_id));
		headerAt: 'Content-Length' put: 0.
	^ self client sendRequest: request
]
