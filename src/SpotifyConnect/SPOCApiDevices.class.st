Class {
	#name : #SPOCApiDevices,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 5/25/2024 21:01'
}
SPOCApiDevices >> endpoint [
	^ 'v1/me/player/devices'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 5/25/2024 19:09'
}
SPOCApiDevices >> endpointMethod [
	^ 'GET'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/3/2024 13:23'
}
SPOCApiDevices >> executeRequest: request withParams: aParameterDictionary [
	
	^ self client sendRequest: request
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 5/25/2024 19:15'
}
SPOCApiDevices >> executeTest [
	^'{
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/3/2024 13:30'
}
SPOCApiDevices >> tinkerReponseContent: aContentStream [
	
	| content devices deviceItems |
	content := Json readFrom: aContentStream readStream.
	devices := OrderedCollection new.
	deviceItems := content at: #devices.
	deviceItems do: [ :deviceItem |
		| device |
		device := SPOCDevice new.
		device
			id: (deviceItem at: #id);
			isActive: (deviceItem at: #is_active);
			isPrivateSession: (deviceItem at: #is_private_session);
			isRestricted: (deviceItem at: #is_restricted);
			name: (deviceItem at: #name);
			type: (deviceItem at: #type);
			volume: (deviceItem at: #volume_percent);
			supportsVolume: (deviceItem at: #supports_volume).
		devices add: device 
	].
	^ devices
]
