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
	#'squeak_changestamp' : 'TL 5/27/2024 15:54'
}
SPOCApiPause >> executeRequest: request withParams: aParamDictionary [

	request rawUrl: (request rawUrl, '?device_id=', (aParamDictionary at: #device_id)).
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
	#'squeak_changestamp' : 'TL 5/27/2024 15:54'
}
SPOCApiPause >> tinkerReponseContent: aContentStream [
	
	"wenn alles gut gelaufen ist kommt, keine response, sondern nur bei Fehler"
]
