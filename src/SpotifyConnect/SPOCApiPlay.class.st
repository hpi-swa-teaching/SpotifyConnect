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
	#'squeak_changestamp' : 'MH 6/10/2024 17:37'
}
SPOCApiPlay >> buildDataWithSong: aString [

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
	#'squeak_changestamp' : 'MH 6/10/2024 19:04'
}
SPOCApiPlay >> executeRequest: request withParams: aParamDictionary [

	| data |
	request rawUrl: (request rawUrl, '?device_id=', (aParamDictionary at: #device_id)).
	"wenn param dict size = 1 resume play, size = 1 song, size = 2 album?"
	(aParamDictionary size = 1)
		ifTrue: [data := ''].
	"	ifFalse: [data := self buildDataWithSong: (aParamDictionary at: #uris)]."
	(aParamDictionary size = 2)
		ifTrue: [data := self buildDataWithSong: (aParamDictionary at: #uris)]
		ifFalse: [data:= self buildDataWithContext: (aParamDictionary at: #context_uri) andTrack: (aParamDictionary at: #uris)].
	request headerAt: 'Content-Length' put: data size.
	(data size = 0)
		ifTrue: [request headerAt: 'Content-Length' put: 0.
			^ self client sendRequest: request]
		ifFalse: [^ self client sendRequest: request content: data readStream size: data size]

]
