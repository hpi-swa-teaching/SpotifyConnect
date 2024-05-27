Class {
	#name : #SPOCApiPause,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 21:26'
}
SPOCApiPause >> endpoint [ 
	
	^ 'v1/me/player/pause'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 21:26'
}
SPOCApiPause >> endpointMethod [
	
	^ 'PUT'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/27/2024 14:26'
}
SPOCApiPause >> executeRequest: request withParams: aParamDictionary [

	"device_id kann angegeben werden muss aber nicht, aber wichtig für mehrere Geräte"
	request rawUrl: (request rawUrl, '?device_id=',(aParamDictionary at: #device_id)).
	Transcript showln: request.
	request headerAt: 'Content-Length' put: 0.
	^ self client sendRequest: request
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 21:29'
}
SPOCApiPause >> executeTest [
	
	"Response code 204"
	 ^ '{
  "error": {
    "status": 400,
    "message": "string"
  }
}' readStream
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/27/2024 14:34'
}
SPOCApiPause >> tinkerReponseContent: aContentStream [
	
	"wenn alles gut gelaufen ist kommt keine respons, nur bei Fehler"
	aContentStream
		ifNil: [Transcript showln: 'content is nil'].
	"^ Json readFrom: aContentStream"
	
]
