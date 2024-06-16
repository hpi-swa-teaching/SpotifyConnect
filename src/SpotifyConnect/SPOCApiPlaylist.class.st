Class {
	#name : #SPOCApiPlaylist,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API'
}

{
	#category : #parameters,
	#'squeak_changestamp' : 'RK 6/16/2024 12:29'
}
SPOCApiPlaylist >> endpoint [
	^ 'v1/playlists/'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'RK 5/16/2024 18:51'
}
SPOCApiPlaylist >> endpointMethod [
	^ 'GET'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'RK 6/13/2024 23:17'
}
SPOCApiPlaylist >> executeRequest: request withParams: aParameterDictionary [

	request rawUrl: (request rawUrl, (aParameterDictionary at: 'id'), '/tracks').
	^ self client sendRequest: request
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'RK 6/13/2024 23:17'
}
SPOCApiPlaylist >> executeTest [

	^ '...'
]

{
	#category : #response,
	#'squeak_changestamp' : 'RK 6/16/2024 12:56'
}
SPOCApiPlaylist >> tinkerReponseContent: aContentStream [
	
	| content tracks |
	content := Json readFrom: aContentStream readStream.
	tracks := OrderedCollection new.
	(content at: #items) do: [:anItem | tracks add: (self tinkerTrack: anItem)].
	^ tracks
]

{
	#category : #response,
	#'squeak_changestamp' : 'RK 6/16/2024 12:51'
}
SPOCApiPlaylist >> tinkerTrack: aJson [

	| track artists |
	track := aJson at: #track. 
	artists := OrderedCollection new.
	(track at: #artists) do: [:anArtist | artists add: (self tinkerArtist: anArtist)].
	^ SPOCTrack new
		id: (track at: #id);
		name: (track at: #name);
		image: (SPOCImage newWithUrl: ((((track at: #album) at: #images) at: 1) at: #url));
		artists: artists;
		duration: (track at: #duration_ms) // 1000;
		trackNumber: (track at: #track_number);
		yourself
]
