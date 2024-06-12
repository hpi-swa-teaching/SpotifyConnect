Class {
	#name : #SPOCApiEndpoint,
	#superclass : #Object,
	#instVars : [
		'authorizer',
		'returnsTestContent'
	],
	#category : #'SpotifyConnect-API'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/10/2024 03:57'
}
SPOCApiEndpoint class >> apiHost [

	^ 'https://api.spotify.com/'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:37'
}
SPOCApiEndpoint >> authorizer [

	^ authorizer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:37'
}
SPOCApiEndpoint >> authorizer: anAuthorizer [

	authorizer := anAuthorizer
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 03:37'
}
SPOCApiEndpoint >> client [

	^ WebClient new initializeFromUrl: SPOCApiEndpoint apiHost
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 6/10/2024 03:37'
}
SPOCApiEndpoint >> endpoint [

	^ self subclassResponsibility
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 6/10/2024 03:37'
}
SPOCApiEndpoint >> endpointMethod [

	^ self subclassResponsibility
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 03:40'
}
SPOCApiEndpoint >> execute: aParamDictionary [ 

	| response contentStream |
	self returnsTestContent
		ifTrue: [^ self tinkerReponseContent: self executeTest].
	self authorizer
		ifNil: [^ SPOCApiEndpointResult new error: 'Authorizer needed'; yourself].
	response := self executeRequest: (self tinkerRequest) withParams: aParamDictionary.
	response code = 401
		ifTrue: [^ self refreshAccessTokenAndExecute: aParamDictionary].
	response code = 200
		ifTrue: [contentStream := response content readStream.
			^ self tinkerReponseContent: contentStream].
	^ SPOCApiEndpointResult new response: response; yourself
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 03:39'
}
SPOCApiEndpoint >> executeRequest: request withParams: aParameterDictionary [

	^ self subclassResponsibility
	
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 03:39'
}
SPOCApiEndpoint >> executeTest [

	^ self subclassResponsibility
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/10/2024 03:39'
}
SPOCApiEndpoint >> initialize [

	super initialize.
	
	self returnsTestContent: false
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 21:03'
}
SPOCApiEndpoint >> refreshAccessTokenAndExecute: aParamDictionary [

	self authorizer refreshAccessToken.
	self authorizer isAuthorized
		ifTrue: [^ self execute: aParamDictionary]
		ifFalse: [^ SPOCApiEndpointResult new error: 'Access Token Refresh Failed'; yourself]
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 6/10/2024 03:40'
}
SPOCApiEndpoint >> requestUri [

	^ SPOCApiEndpoint apiHost, self endpoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:40'
}
SPOCApiEndpoint >> returnsTestContent [

	^ returnsTestContent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:40'
}
SPOCApiEndpoint >> returnsTestContent: aBoolean [

	returnsTestContent := aBoolean
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 6/12/2024 01:31'
}
SPOCApiEndpoint >> tinkerAlbum: aJson [

	| artists |
	artists := OrderedCollection new.
	(aJson at: #artists) do: [:anArtist | artists add: (self tinkerArtist: anArtist)].
	^ SPOCAlbum new
		id: (aJson at: #id);
		name: (aJson at: #name);
		image: (SPOCImage newWithUrl: (((aJson at: #images) first) at: #url));
		artists: artists;
		totalTracks: (aJson at: #total_tracks);
		yourself
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 6/12/2024 00:35'
}
SPOCApiEndpoint >> tinkerArtist: aJson [

	^ SPOCArtist new
		id: (aJson at: #id);
		name: (aJson at: #name);
		yourself
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 6/11/2024 11:55'
}
SPOCApiEndpoint >> tinkerDevice: aJson [
	
	^ SPOCDevice new
		id: (aJson at: #id);
		isActive: (aJson at: #is_active);
		name: (aJson at: #name);
		type: (aJson at: #type);
		volume: (aJson at: #volume_percent);
		supportsVolume: (aJson at: #supports_volume);
		yourself
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 6/10/2024 23:33'
}
SPOCApiEndpoint >> tinkerPlaybackState: aJson [

	| playbackState |
	playbackState := SPOCPlaybackState new
		device: (self tinkerDevice: (aJson at: #device));
		progress: (aJson at: #progress_ms);
		isPlaying: (aJson at: #is_playing);
		yourself.
	((aJson at: #currently_playing_type) = 'track')
		ifTrue: [playbackState track: (self tinkerTrack: (aJson at: #item))]
		ifFalse: [playbackState track: nil].
	^ playbackState
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 6/10/2024 03:40'
}
SPOCApiEndpoint >> tinkerReponseContent: aContentStream [

	^ self subclassResponsibility
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 03:41'
}
SPOCApiEndpoint >> tinkerRequest [

	| request |
	request := self client requestWithUrl: SPOCApiEndpoint apiHost, self endpoint.
	request method: self endpointMethod;
		headerAt: 'Authorization' put: 'Bearer ', self authorizer accessToken;
		headerAt: 'Content-Type' put: 'application/json'.
	^ request
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 6/11/2024 23:27'
}
SPOCApiEndpoint >> tinkerTrack: aJson [

	| album artists |
	album := self tinkerAlbum: (aJson at: #album).
	artists := OrderedCollection new.
	(aJson at: #artists) do: [:anArtist | artists add: (self tinkerArtist: anArtist)].
	^ SPOCTrack new
		id: (aJson at: #id);
		name: (aJson at: #name);
		image: album image;
		album: album;
		artists: artists;
		duration: (aJson at: #duration_ms) // 1000;
		trackNumber: (aJson at: #track_number);
		yourself
]
