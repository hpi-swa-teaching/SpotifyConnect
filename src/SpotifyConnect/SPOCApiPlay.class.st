Class {
	#name : #SPOCApiPlay,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API'
}

{
	#category : #parameters,
	#'squeak_changestamp' : 'MH 6/10/2024 19:04'
}
SPOCApiPlay >> buildDataWithContext: aString andTrack: aTrack [

	^ '{"context_uri":', aString, ',"offset": {"uri":', aTrack, '},"position_ms": 0}'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'MH 6/17/2024 11:41'
}
SPOCApiPlay >> buildDataWithTrack: aString [

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
	#'squeak_changestamp' : 'MH 6/17/2024 11:41'
}
SPOCApiPlay >> executeRequest: request withParams: aParamDictionary [

	| data |
	request rawUrl: (request rawUrl, '?device_id=', (aParamDictionary at: #device_id)).
	(aParamDictionary size = 1)
		ifTrue: [data := ''].
	(aParamDictionary size = 2)
		ifTrue: [data := self buildDataWithTrack: (aParamDictionary at: #uris)]
		ifFalse: [(aParamDictionary includesKey: 'context_uri')
			ifTrue: [data:= self buildDataWithContext: (aParamDictionary at: #context_uri) andTrack: (aParamDictionary at: #uris)]].
	request headerAt: 'Content-Length' put: data size.
	(data size = 0)
		ifTrue: [request headerAt: 'Content-Length' put: 0.
			^ self client sendRequest: request]
		ifFalse: [^ self client sendRequest: request content: data readStream size: data size]

]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/17/2024 12:14'
}
SPOCApiPlay >> playOn: aDevice [

	| dict |
	dict := Dictionary new
		at: #device_id put: aDevice;
		yourself.
	self execute: dict
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/17/2024 12:18'
}
SPOCApiPlay >> playTrack: aString on: aDevice [

	| dict |
	dict := Dictionary new
		at: #device_id put: aDevice;
		at: #uris put: '"spotify:track:', aString, '"';
		yourself.
	self execute: dict
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/17/2024 12:19'
}
SPOCApiPlay >> playTrack: aString withContext: anotherString on: aDevice [

	| dict |
	dict := Dictionary new
		at: #device_id put: aDevice;
		at: #context_uri put: anotherString;
		at: #uris put: '"spotify:track:', aString, '"';
		yourself.
	self execute: dict
]
