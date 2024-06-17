Class {
	#name : #SPOCApiPause,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API'
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
	#'squeak_changestamp' : 'TL 6/17/2024 12:20'
}
SPOCApiPause >> pauseOn: aDevice [

	| dict |
	dict := Dictionary new
		at: #device_id put: aDevice;
		yourself.
	self execute: dict
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/17/2024 12:20'
}
SPOCApiPause >> playOn: aDevice [

	| dict |
	dict := Dictionary new
		at: #device_id put: aDevice;
		yourself.
	self execute: dict
]
