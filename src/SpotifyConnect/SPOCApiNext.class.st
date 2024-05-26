Class {
	#name : #SPOCApiNext,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 21:40'
}
SPOCApiNext >> endpoint [ 
	
	^ 'v1/me/player/next'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 21:40'
}
SPOCApiNext >> endpointMethod [
	
	^ 'POST'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 21:41'
}
SPOCApiNext >> executeRequest: request withParams: aParamDictionary [

	"device_id kann angegeben werden muss aber nicht, aber wichtig für mehrere Geräte"
	request rawUrl: (request rawUrl, '?device_id=',(aParamDictionary at: #device_id)).
	Transcript showln: request.
	^ self client sendRequest: request
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 21:41'
}
SPOCApiNext >> executeTest [
	
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
	#'squeak_changestamp' : 'MH 5/26/2024 21:42'
}
SPOCApiNext >> tinkerReponseContent: aContentStream [
	
	"wenn alles gut gelaufen ist kommt keine respons, nur bei Fehler"
	aContentStream
		ifNil: [Transcript showln: 'content is nil'].
	^ Json readFrom: aContentStream
	
]
