Class {
	#name : #SPOCApiSwitchDevice,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/3/2024 12:19'
}
SPOCApiSwitchDevice >> endpoint [

	^ 'v1/me/player'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/3/2024 12:19'
}
SPOCApiSwitchDevice >> endpointMethod [

	^ 'PUT'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/3/2024 14:28'
}
SPOCApiSwitchDevice >> executeRequest: request withParams: aParameterDictionary [

	| data |
	data := '{"device_ids": ["', (aParameterDictionary at: #deviceID), '"]}'.
	^ self client sendRequest: request content: data readStream size: data size
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/3/2024 12:21'
}
SPOCApiSwitchDevice >> executeTest [
	"TODO: empty Response"
	^ ''
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/3/2024 12:21'
}
SPOCApiSwitchDevice >> tinkerReponseContent: aContentStream [
	
	"wenn alles gut gelaufen ist, kommt keine response, sondern nur bei Fehler"
]