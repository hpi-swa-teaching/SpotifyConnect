"
concrete API endpoint for skipping back to the previous song
"
Class {
	#name : #SPOCApiPrevious,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API',
	#'squeak_changestamp' : 'OW 7/4/2024 12:00'
}

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 6/3/2024 22:33'
}
SPOCApiPrevious >> endpoint [ 
	
	^ 'v1/me/player/previous'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 6/3/2024 22:33'
}
SPOCApiPrevious >> endpointMethod [
	
	^ 'POST'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 01:19'
}
SPOCApiPrevious >> executeRequest: request withParams: aParamDictionary [

	request rawUrl: (request rawUrl, '?device_id=', (aParamDictionary at: #device_id));
		headerAt: 'Content-Length' put: 0.
	^ self client sendRequest: request
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/7/2024 03:18'
}
SPOCApiPrevious >> skipToPreviousOn: aDevice [

	self execute: (Dictionary new at: #device_id put: aDevice; yourself)
]
