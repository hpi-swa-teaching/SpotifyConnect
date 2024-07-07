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
	#'squeak_changestamp' : 'TL 7/7/2024 01:21'
}
SPOCApiAlbum >> executeRequest: request withParams: aParameterDictionary [

	request rawUrl: (request rawUrl, (aParameterDictionary at: #id), '/tracks?limit=', SPOCStyle resultListLimit).
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
	#'squeak_changestamp' : 'RK 7/7/2024 13:53'
}
SPOCApiAlbum >> tinkerReponseContent: aContentStream [
	
	| content index tracks |
	content := Json readFrom: aContentStream readStream.
	tracks := OrderedCollection new.
	index := 0.
	(content at: #items) 
		do: [:anItem | tracks add: ((self tinkerTrack: anItem) offset: index + 1).
			index := index + 1].
	^ tracks
]
