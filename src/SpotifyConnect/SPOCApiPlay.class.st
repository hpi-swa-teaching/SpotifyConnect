"
concrete API endpoint for starting the playback
"
Class {
	#name : #SPOCApiPlay,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API',
	#'squeak_changestamp' : 'OW 7/4/2024 11:59'
}

{
	#category : #parameters,
	#'squeak_changestamp' : 'MH 7/7/2024 15:25'
}
SPOCApiPlay >> buildContextAlbum: aString [

	^ '"spotify:album:', aString, '"'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'MH 7/7/2024 15:27'
}
SPOCApiPlay >> buildContextPlaylist: aString [

	^ '"spotify:playlist:', aString, '"'
]

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
	#'squeak_changestamp' : 'TL 7/7/2024 03:14'
}
SPOCApiPlay >> buildUris: aString [

	^ '"spotify:track:', aString, '"'
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
	#'squeak_changestamp' : 'TL 7/11/2024 16:51'
}
SPOCApiPlay >> executeRequest: request withParams: aParamDictionary [

	| data |
	data := ''.
	request rawUrl: (request rawUrl, '?device_id=', (aParamDictionary at: #device_id)).
	(aParamDictionary size = 2)
		ifTrue: [data := self buildDataWithTrack: (aParamDictionary at: #uris)]
		ifFalse: [(aParamDictionary includesKey: #context_uri)
				ifTrue: [data := self buildDataWithContext: (aParamDictionary at: #context_uri) andTrack: (aParamDictionary at: #uris)]].
	request headerAt: 'Content-Length' put: data size.
	(data isEmpty)
		ifTrue: [^ self client sendRequest: request]
		ifFalse: [^ self client sendRequest: request content: data readStream size: data size]

]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/7/2024 03:09'
}
SPOCApiPlay >> playOn: aDevice [

	self execute: (Dictionary new at: #device_id put: aDevice; yourself)
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/7/2024 03:20'
}
SPOCApiPlay >> playTrack: aString on: aDevice [

	self execute: (Dictionary new at: #device_id put: aDevice;
			at: #uris put: (self buildUris: aString);
			yourself)
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'MH 7/7/2024 15:26'
}
SPOCApiPlay >> playTrack: aString withAlbum: anotherString on: aDevice [

	self execute: (Dictionary new at: #device_id put: aDevice;
			at: #context_uri put: (self buildContextAlbum: anotherString);
			at: #uris put: (self buildUris: aString);
			yourself)
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'MH 7/7/2024 15:27'
}
SPOCApiPlay >> playTrack: aString withPlaylist: anotherString on: aDevice [

	self execute: (Dictionary new at: #device_id put: aDevice;
			at: #context_uri put: (self buildContextPlaylist: anotherString);
			at: #uris put: (self buildUris: aString);
			yourself)
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'VE 7/9/2024 11:51'
}
SPOCApiPlay >> tinkerReponseContent: aContentStream [
	
	^ SPOCApiEndpointResult new response: (WebResponse protocol: '' code: 204) 
]
