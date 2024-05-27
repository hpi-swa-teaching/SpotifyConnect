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
	#'squeak_changestamp' : 'TL 5/27/2024 15:54'
}
SPOCApiNext >> executeRequest: request withParams: aParamDictionary [

	request rawUrl: (request rawUrl, '?device_id=', (aParamDictionary at: #device_id)).
	request headerAt: 'Content-Length' put: 0.
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
	#'squeak_changestamp' : 'TL 5/27/2024 15:55'
}
SPOCApiNext >> tinkerReponseContent: aContentStream [
	
	"wenn alles gut gelaufen ist, kommt keine response, sondern nur bei Fehler"
	
]
