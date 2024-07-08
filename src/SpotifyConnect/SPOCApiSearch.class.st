"
concrete API endpoint for searching
"
Class {
	#name : #SPOCApiSearch,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API',
	#'squeak_changestamp' : 'OW 7/4/2024 12:00'
}

{
	#category : #response,
	#'squeak_changestamp' : 'VE 7/8/2024 16:44'
}
SPOCApiSearch >> contentItemsAt: aSymbol in: aJsonContent [

	(aJsonContent includesKey: aSymbol)
		ifTrue: [^ (aJsonContent at: aSymbol) at: #items].
	^ OrderedCollection new
	
	
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'RK 5/16/2024 19:01'
}
SPOCApiSearch >> endpoint [
	^ 'v1/search'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'RK 5/16/2024 18:51'
}
SPOCApiSearch >> endpointMethod [
	^ 'GET'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/7/2024 01:19'
}
SPOCApiSearch >> executeRequest: request withParams: aParameterDictionary [

	request rawUrl: (request rawUrl, '?q=', (aParameterDictionary at: #input), '&type=', (aParameterDictionary at: #type), '&limit=', (aParameterDictionary at: #limit)).
	^ self client sendRequest: request
]

{
	#category : #response,
	#'squeak_changestamp' : 'OW 7/7/2024 17:05'
}
SPOCApiSearch >> executeTest [

	^ self loadMockdataFromAsset: 'searchResponse'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/7/2024 03:25'
}
SPOCApiSearch >> search: aString withFilter: aFilter [

	^ self execute: (Dictionary new at: #input put: aString;
			at: #type put: aFilter;
			at: #limit put: SPOCStyle resultListLimit;
			yourself)
]

{
	#category : #response,
	#'squeak_changestamp' : 'VE 7/8/2024 16:43'
}
SPOCApiSearch >> tinkerReponseContent: aContentStream [
	
	| content results |
	content := Json readFrom: aContentStream readStream.
	results := OrderedCollection new.
	(self contentItemsAt: #tracks in: content)
		do: [:aTrack | results add: (self tinkerTrack: aTrack)].
	(self contentItemsAt: #albums in: content)
		do: [:anAlbum | results add: (self tinkerAlbum: anAlbum)].
	(self contentItemsAt: #playlists in: content)
		do: [:aPlaylist | results add: (self tinkerPlaylist: aPlaylist)].
	results withIndexDo: [:aDataPiece :anIndex | aDataPiece offset: anIndex].
	^ results
]
