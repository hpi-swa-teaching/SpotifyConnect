Class {
	#name : #SPOCApiPlay,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 6/4/2024 14:48'
}
SPOCApiPlay >> buildData: aString [

	|data|
	data:= '{"uris":[', aString,'],"offset": {"uri":', aString,'},"position_ms": 0}'.
	^data
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 6/3/2024 14:59'
}
SPOCApiPlay >> buildEmptyData [

	|data|
	data:= ''.
	
	^data
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 15:41'
}
SPOCApiPlay >> endpoint [ 
	
	^ 'v1/me/player/play'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 15:42'
}
SPOCApiPlay >> endpointMethod [
	
	^ 'PUT'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 6/4/2024 14:44'
}
SPOCApiPlay >> executeRequest: request withParams: aParamDictionary [

	|data|
	"im parameterdict auch die data teile übergebe und jenachdem testen"  

	request rawUrl: (request rawUrl, '?device_id=', (aParamDictionary at: #device_id)).
	(aParamDictionary size = 1)
		ifTrue: [data:= self buildEmptyData.]
		ifFalse: [data:= self buildData: (aParamDictionary at: #uris).].
	Transcript showln: data.
	request headerAt: 'Content-Length' put: data size.

	(data size = 0)
		ifTrue: [request headerAt: 'Content-Length' put: 0.
			^ self client sendRequest: request.]
		ifFalse: [Transcript showln: request.
			^ self client sendRequest: request content: data readStream size: data size.].

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 5/27/2024 15:51'
}
SPOCApiPlay >> executeTest [
	
	"Response code 204"
	 ^ ''
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 5/27/2024 15:53'
}
SPOCApiPlay >> tinkerReponseContent: aContentStream [
	
	"wenn alles gut gelaufen ist, kommt keine response, sondern nur bei Fehler"
]
