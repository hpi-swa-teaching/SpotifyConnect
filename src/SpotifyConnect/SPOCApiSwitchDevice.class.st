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
	#'squeak_changestamp' : 'VK 6/4/2024 16:06'
}
SPOCApiSwitchDevice >> executeRequest: request withParams: aParameterDictionary [

	| data |
	data := 
	'{"device_ids": ["', (aParameterDictionary at: #deviceID), '"]}'.
	Transcript show: data.
	request headerAt: 'Content-Length' put: data size.
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
	#'squeak_changestamp' : 'VK 6/4/2024 16:01'
}
SPOCApiSwitchDevice >> tinkerReponseContent: aContentStream [
	
	"wenn alles gut gelaufen ist, kommt keine response, sondern nur bei Fehler"
]
