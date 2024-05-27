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
	#'squeak_changestamp' : 'MH 5/27/2024 14:08'
}
SPOCApiPlay >> executeRequest: request withParams: aParamDictionary [

	"device_id kann angegeben werden muss aber nicht, aber wichtig für mehrere Geräte"
	request rawUrl: (request rawUrl, '?device_id=',(aParamDictionary at: #device_id)).
	Transcript showln: request.
	request headerAt: 'Content-Length' put: 0.
	^ self client sendRequest: request.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 20:59'
}
SPOCApiPlay >> executeTest [
	
	"Response code 204"
	 ^ '{  "error": {

    "status": 403,    "message": "Player command failed: Premium required",    "reason": "PREMIUM_REQUIRED"

  }}' readStream
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/27/2024 14:34'
}
SPOCApiPlay >> tinkerReponseContent: aContentStream [
	
	"wenn alles gut gelaufen ist kommt keine respons, nur bei Fehler"
	aContentStream
		ifNil: [Transcript showln: 'content is nil'].
	"^ Json readFrom: aContentStream"	
]
