Class {
	#name : #SPOCApiNext,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 21:40'
}
SPOCApiNext >> endpoint [ 
	
	^ 'v1/me/player/next'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 21:40'
}
SPOCApiNext >> endpointMethod [
	
	^ 'POST'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/10/2024 01:17'
}
SPOCApiNext >> executeRequest: request withParams: aParamDictionary [

	request rawUrl: (request rawUrl, '?device_id=', (aParamDictionary at: #device_id));
		headerAt: 'Content-Length' put: 0.
	^ self client sendRequest: request
]
