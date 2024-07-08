"
concrete API endpoint for the history of played songs
"
Class {
	#name : #SPOCApiRecentlyPlayed,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API',
	#'squeak_changestamp' : 'OW 7/4/2024 12:00'
}

{
	#category : #parameters,
	#'squeak_changestamp' : 'VK 6/1/2024 22:32'
}
SPOCApiRecentlyPlayed >> endpoint [

	^ 'v1/me/player/recently-played'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'VK 6/1/2024 12:25'
}
SPOCApiRecentlyPlayed >> endpointMethod [	

	^ 'GET'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/7/2024 01:20'
}
SPOCApiRecentlyPlayed >> executeRequest: request withParams: aParameterDictionary [

	request rawUrl: (request rawUrl, '?limit=', (aParameterDictionary at: #limit), '&before=', (aParameterDictionary at: #before)).
	^ self client sendRequest: request
]

{
	#category : #response,
	#'squeak_changestamp' : 'OW 7/7/2024 17:00'
}
SPOCApiRecentlyPlayed >> executeTest [
	
	^ self loadMockdataFromAsset: 'recentlyPlayedResponse'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/8/2024 19:45'
}
SPOCApiRecentlyPlayed >> getRecentlyPlayed [

	^ self execute: (Dictionary new at: #limit put: SPOCStyle defaultRequestLimit;
			at: #before put: SPOCRecentlyPlayed beforeTimestamp;
			yourself)
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 7/7/2024 03:19'
}
SPOCApiRecentlyPlayed >> tinkerReponseContent: aContentStream [
	
	| content tracks |
	content := Json readFrom: aContentStream readStream.
	tracks := OrderedCollection new.
	(content at: #items)
		do: [:anItem | tracks add: (self tinkerTrack: (anItem at: #track))].
	^ tracks
]
