"
concrete API endpoint for pausing the playback
"
Class {
	#name : #SPOCApiPause,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API',
	#'squeak_changestamp' : 'OW 7/4/2024 11:59'
}

{
	#category : #parameters,
	#'squeak_changestamp' : 'MH 5/26/2024 21:26'
}
SPOCApiPause >> endpoint [ 
	
	^ 'v1/me/player/pause'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'MH 5/26/2024 21:26'
}
SPOCApiPause >> endpointMethod [
	
	^ 'PUT'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 01:17'
}
SPOCApiPause >> executeRequest: request withParams: aParamDictionary [

	request rawUrl: (request rawUrl, '?device_id=', (aParamDictionary at: #device_id));
		headerAt: 'Content-Length' put: 0.
	^ self client sendRequest: request
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/7/2024 03:08'
}
SPOCApiPause >> pauseOn: aDevice [

	self execute: (Dictionary new at: #device_id put: aDevice; yourself)
]

{
	#category : #response,
	#'squeak_changestamp' : 'VE 7/9/2024 11:49'
}
SPOCApiPause >> tinkerReponseContent: aContentStream [
	
	^ SPOCApiEndpointResult new response: (WebResponse protocol: '' code: 204) 
]
