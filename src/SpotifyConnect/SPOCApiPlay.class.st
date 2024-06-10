Class {
	#name : #SPOCApiPlay,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 6/10/2024 01:18'
}
SPOCApiPlay >> buildData: aString [

	^ '{"uris":[', aString, '],"offset": {"uri":', aString, '},"position_ms": 0}'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'MH 5/26/2024 15:41'
}
SPOCApiPlay >> endpoint [ 
	
	^ 'v1/me/player/play'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'MH 5/26/2024 15:42'
}
SPOCApiPlay >> endpointMethod [
	
	^ 'PUT'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 04:02'
}
SPOCApiPlay >> executeRequest: request withParams: aParamDictionary [

	| data |
	request rawUrl: (request rawUrl, '?device_id=', (aParamDictionary at: #device_id)).
	(aParamDictionary size = 1)
		ifTrue: [data := '']
		ifFalse: [data := self buildData: (aParamDictionary at: #uris)].
	request headerAt: 'Content-Length' put: data size.
	(data size = 0)
		ifTrue: [request headerAt: 'Content-Length' put: 0.
			^ self client sendRequest: request]
		ifFalse: [^ self client sendRequest: request content: data readStream size: data size]

]
