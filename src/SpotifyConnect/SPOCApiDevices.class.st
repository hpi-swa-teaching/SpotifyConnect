Class {
	#name : #SPOCApiDevices,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API'
}

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 6/10/2024 03:41'
}
SPOCApiDevices >> endpoint [

	^ 'v1/me/player/devices'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 6/10/2024 03:41'
}
SPOCApiDevices >> endpointMethod [

	^ 'GET'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'VK 6/3/2024 13:23'
}
SPOCApiDevices >> executeRequest: request withParams: aParameterDictionary [
	
	^ self client sendRequest: request
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 03:42'
}
SPOCApiDevices >> executeTest [

	^ '{
		  "devices": [
		    {
		      "id": "string",
		      "is_active": false,
		      "is_private_session": false,
		      "is_restricted": false,
		      "name": "Kitchen speaker",
		      "type": "computer",
		      "volume_percent": 59,
		      "supports_volume": false
		    }
		  ]
		}' readStream
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 6/10/2024 21:45'
}
SPOCApiDevices >> tinkerReponseContent: aContentStream [
	
	| content devices |
	content := Json readFrom: aContentStream readStream.
	devices := OrderedCollection new.
	(content at: #devices) do: [:aDevice | devices add: (self setDevice: aDevice)].
	^ devices
]
