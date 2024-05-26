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
	#'squeak_changestamp' : 'MH 5/26/2024 16:04'
}
SPOCApiPlay >> executeRequest: request withParams: aParamDictionary [

	"device_id kann angegeben werden muss aber nicht, aber wichtig für mehrere Geräte"
	request rawUrl: (request rawUrl, '?device_id=',(aParamDictionary at: #device_id)).
	Transcript showln: request.
	^ self client sendRequest: request
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 15:43'
}
SPOCApiPlay >> executeTest [
	
	"Response code 204"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 16:13'
}
SPOCApiPlay >> tinkerReponseContent: aContentStream [
	
	"wenn alles gut gelaufen ist kommt keine respons, nur bei Fehler"
	^ Json readFrom: aContentStream
	
]
