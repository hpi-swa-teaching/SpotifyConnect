Class {
	#name : #SPOCApiAlbum,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API'
}

{
	#category : #parameters,
	#'squeak_changestamp' : 'RK 6/13/2024 23:16'
}
SPOCApiAlbum >> endpoint [
	^ 'v1/albums/'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'RK 5/16/2024 18:51'
}
SPOCApiAlbum >> endpointMethod [
	^ 'GET'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'RK 6/13/2024 23:17'
}
SPOCApiAlbum >> executeRequest: request withParams: aParameterDictionary [

	request rawUrl: (request rawUrl, (aParameterDictionary at: 'id'), '/tracks').
	^ self client sendRequest: request
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'RK 6/13/2024 23:17'
}
SPOCApiAlbum >> executeTest [

	^ '...'
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 6/10/2024 23:32'
}
SPOCApiAlbum >> tinkerReponseContent: aContentStream [
	
	| content tracks |
	content := Json readFrom: aContentStream readStream.
	tracks := OrderedCollection new.
	((content at: #tracks) at: #items) do: [:anItem | tracks add: (self tinkerTrack: anItem)].
	^ tracks
]
