"
concrete API endpoint for devices
"
Class {
	#name : #SPOCApiDevices,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API',
	#'squeak_changestamp' : 'OW 7/4/2024 11:58'
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
	#category : #response,
	#'squeak_changestamp' : 'OW 7/7/2024 16:47'
}
SPOCApiDevices >> executeTest [

	^ self loadMockdataFromAsset: 'devicesResponse'

	
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/17/2024 20:17'
}
SPOCApiDevices >> getCurrentDevices [

	^ self execute: Dictionary new
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 7/11/2024 15:11'
}
SPOCApiDevices >> tinkerReponseContent: aContentStream [ 

	| content |
	content := Json readFrom: aContentStream readStream.
	^ (content at: #devices)
		collect: [:aDevice | self tinkerDevice: aDevice]
]
