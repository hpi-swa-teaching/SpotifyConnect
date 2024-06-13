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
	#'squeak_changestamp' : 'RK 6/13/2024 23:25'
}
SPOCApiAlbum >> tinkerReponseContent: aContentStream [
	
	| content tracks |
	content := Json readFrom: aContentStream readStream.
	tracks := OrderedCollection new.
	(content at: #items) do: [:anItem | tracks add: (self tinkerTrack: anItem)].
	^ tracks
]

{
	#category : #response,
	#'squeak_changestamp' : 'RK 6/13/2024 23:49'
}
SPOCApiAlbum >> tinkerTrack: aJson [

	| artists |
	artists := OrderedCollection new.
	(aJson at: #artists) do: [:anArtist | artists add: (self tinkerArtist: anArtist)].
	^ SPOCTrack new
		id: (aJson at: #id);
		name: (aJson at: #name);
		image: (SPOCImage newWithPath: '/assets/squeak-mouse.png');
		artists: artists;
		duration: (aJson at: #duration_ms) // 1000;
		trackNumber: (aJson at: #track_number);
		yourself
]
