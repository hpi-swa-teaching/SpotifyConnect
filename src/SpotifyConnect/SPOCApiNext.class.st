"
concrete API endpoint for skip to next song
"
Class {
	#name : #SPOCApiNext,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API',
	#'squeak_changestamp' : 'OW 7/4/2024 11:59'
}

{
	#category : #parameters,
	#'squeak_changestamp' : 'MH 5/26/2024 21:40'
}
SPOCApiNext >> endpoint [ 
	
	^ 'v1/me/player/next'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'MH 5/26/2024 21:40'
}
SPOCApiNext >> endpointMethod [
	
	^ 'POST'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 01:17'
}
SPOCApiNext >> executeRequest: request withParams: aParamDictionary [

	request rawUrl: (request rawUrl, '?device_id=', (aParamDictionary at: #device_id));
		headerAt: 'Content-Length' put: 0.
	^ self client sendRequest: request
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/7/2024 03:07'
}
SPOCApiNext >> skipToNextOn: aDevice [

	self execute: (Dictionary new at: #device_id put: aDevice; yourself)
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'VE 7/9/2024 11:51'
}
SPOCApiNext >> tinkerReponseContent: aContentStream [
	
	^ SPOCApiEndpointResult new response: (WebResponse protocol: '' code: 204) 
]
