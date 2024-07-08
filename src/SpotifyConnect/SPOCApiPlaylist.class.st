"
concrete API endpoint for playlists
"
Class {
	#name : #SPOCApiPlaylist,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API',
	#'squeak_changestamp' : 'OW 7/4/2024 12:00'
}

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 7/7/2024 03:16'
}
SPOCApiPlaylist >> endpoint [

	^ 'v1/playlists/'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 7/7/2024 03:16'
}
SPOCApiPlaylist >> endpointMethod [

	^ 'GET'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/8/2024 17:20'
}
SPOCApiPlaylist >> executeRequest: request withParams: aParameterDictionary [

	request rawUrl: (request rawUrl, (aParameterDictionary at: #id), '/tracks?limit=', SPOCStyle defaultRequestLimit).
	^ self client sendRequest: request
]

{
	#category : #response,
	#'squeak_changestamp' : 'OW 7/7/2024 16:54'
}
SPOCApiPlaylist >> executeTest [

	^ self loadMockdataFromAsset: 'playlistResponse'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/7/2024 03:16'
}
SPOCApiPlaylist >> getPlaylistWithID: aString [

	^ self execute: (Dictionary new at: #id put: aString; yourself)
]

{
	#category : #response,
	#'squeak_changestamp' : 'RK 7/7/2024 13:53'
}
SPOCApiPlaylist >> tinkerReponseContent: aContentStream [
	
	| content tracks index |
	content := Json readFrom: aContentStream readStream.
	tracks := OrderedCollection new.
	index := 0.
	(content at: #items)
		do: [:anItem | tracks add: ((self tinkerTrack: (anItem at: #track)) offset: index + 1).
			index := index + 1].
	^ tracks
]
