Class {
	#name : #SPOCApiPrevious,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/3/2024 22:33'
}
SPOCApiPrevious >> endpoint [ 
	
	^ 'v1/me/player/previous'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/3/2024 22:33'
}
SPOCApiPrevious >> endpointMethod [
	
	^ 'POST'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/10/2024 01:19'
}
SPOCApiPrevious >> executeRequest: request withParams: aParamDictionary [

	request rawUrl: (request rawUrl, '?device_id=', (aParamDictionary at: #device_id));
		headerAt: 'Content-Length' put: 0.
	^ self client sendRequest: request
]
