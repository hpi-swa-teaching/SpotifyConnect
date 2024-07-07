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
	#'squeak_changestamp' : 'TL 7/7/2024 03:25'
}
SPOCApiSearch >> tinkerReponseContent: aContentStream [
	
	| content results index |
	content := Json readFrom: aContentStream readStream.
	results := OrderedCollection new.
	index := 0.
	(content includesKey: #tracks)
		ifTrue: [((content at: #tracks) at: #items)
				do: [:aTrack | results add: ((self tinkerTrack: aTrack) offset: index).
					index := index + 1].
			^ results].
	(content includesKey: #albums)
		ifTrue: [((content at: #albums) at: #items)
				do: [:anAlbum | results add: ((self tinkerAlbum: anAlbum) offset: index).
					index := index + 1].
			^ results].
	(content includesKey: #playlists)
		ifTrue: [((content at: #playlists) at: #items)
				do: [:aPlaylist | results add: ((self tinkerPlaylist: aPlaylist) offset: index).
					index := index + 1].
			^ results]
]
