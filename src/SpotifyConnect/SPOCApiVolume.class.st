Class {
	#name : #SPOCApiVolume,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/27/2024 00:41'
}
SPOCApiVolume >> endpoint [

	^ 'v1/me/player/volume'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/27/2024 00:44'
}
SPOCApiVolume >> endpointMethod [

	^ 'PUT'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/27/2024 15:15'
}
SPOCApiVolume >> executeRequest: request withParams: aParameterDictionary [

	request rawUrl: (request rawUrl,'?volume_percent=', (aParameterDictionary at: 'volume_percent'),'&device_id=',(aParameterDictionary at: 'device_id')).
	Transcript showln: request.
	request headerAt: 'Content-Length' put: 0.
	^ self client sendRequest: request
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/27/2024 00:50'
}
SPOCApiVolume >> executeTest [

	^ '{
  "error": {
    "status": 403,
    "message": "Player command failed: Cannot control device volume",
    "reason": "VOLUME_CONTROL_DISALLOW"
  }
}' readStream
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/27/2024 15:26'
}
SPOCApiVolume >> tinkerReponseContent: aContentStream [

	aContentStream
		ifNil:[Transcript showln: 'response ist nil'].
	"^ Json readFrom: aContentStream"
]
