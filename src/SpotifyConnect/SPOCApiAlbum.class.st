"
concrete API endpoint for albums
"
Class {
	#name : #SPOCApiAlbum,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API',
	#'squeak_changestamp' : 'OW 7/4/2024 11:58'
}

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 6/23/2024 15:54'
}
SPOCApiAlbum >> endpoint [

	^ 'v1/albums/'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 6/23/2024 15:54'
}
SPOCApiAlbum >> endpointMethod [

	^ 'GET'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/8/2024 17:20'
}
SPOCApiAlbum >> executeRequest: request withParams: aParameterDictionary [

	request rawUrl: (request rawUrl, (aParameterDictionary at: #id), '/tracks?limit=', SPOCStyle defaultRequestLimit).
	^ self client sendRequest: request
]

{
	#category : #response,
	#'squeak_changestamp' : 'OW 7/7/2024 16:40'
}
SPOCApiAlbum >> executeTest [

	^ self loadMockdataFromAsset: 'albumResponse'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/7/2024 03:03'
}
SPOCApiAlbum >> getAlbumWithID: aString [

	^ self execute: (Dictionary new at: #id put: aString; yourself)
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 7/11/2024 16:35'
}
SPOCApiAlbum >> tinkerReponseContent: aContentStream [
	
	| content |
	content := Json readFrom: aContentStream readStream.
	^ (content at: #items) 
		collect: [:anItem | self tinkerTrack: anItem]
]
