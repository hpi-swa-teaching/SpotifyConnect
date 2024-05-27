Class {
	#name : #SPOCApiPlay,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

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
	#'squeak_changestamp' : 'TL 5/27/2024 15:54'
}
SPOCApiPlay >> executeRequest: request withParams: aParamDictionary [

	request rawUrl: (request rawUrl, '?device_id=', (aParamDictionary at: #device_id)).
	request headerAt: 'Content-Length' put: 0.
	^ self client sendRequest: request.
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
