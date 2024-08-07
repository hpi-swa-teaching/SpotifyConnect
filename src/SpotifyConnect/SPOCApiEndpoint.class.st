"
I represent the abstract endpoint for the Spotify API.
"
Class {
	#name : #SPOCApiEndpoint,
	#superclass : #Object,
	#instVars : [
		'authorizer',
		'returnsTestContent'
	],
	#category : #'SpotifyConnect-API',
	#'squeak_changestamp' : 'OW 7/4/2024 12:29'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/10/2024 03:57'
}
SPOCApiEndpoint class >> apiHost [

	^ 'https://api.spotify.com/'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 7/8/2024 16:21'
}
SPOCApiEndpoint class >> cannotRefreshErrorMessage [

	^ 'Refreshing Access Token failed'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'OW 7/7/2024 16:37'
}
SPOCApiEndpoint class >> mockdataBasepath [

	^ 'assets/mockdata/'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 7/8/2024 16:20'
}
SPOCApiEndpoint class >> noAuthorizerErrorMessage [
	
	^ 'Authorizer needed'
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
	#'squeak_changestamp' : 'TL 7/7/2024 02:40'
}
SPOCApiEndpoint >> authorizer: aSPOCAuthorizer [

	authorizer := aSPOCAuthorizer
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/8/2024 20:09'
}
SPOCApiEndpoint >> client [

	^ WebClient new initializeFromUrl: self class apiHost
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
	#'squeak_changestamp' : 'VE 7/8/2024 16:21'
}
SPOCApiEndpoint >> execute: aParamDictionary [ 

	| response contentStream |
	self returnsTestContent
		ifTrue: [^ self tinkerReponseContent: self executeTest].
	self authorizer
		ifNil: [^ SPOCApiEndpointResult new error: self class noAuthorizerErrorMessage].
	response := self executeRequest: self tinkerRequest withParams: aParamDictionary.
	response code = 401
		ifTrue: [^ self refreshAccessTokenAndExecute: aParamDictionary].
	response code = 200
		ifTrue: [contentStream := response content readStream.
			^ self tinkerReponseContent: contentStream].
	^ SPOCApiEndpointResult new response: response
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 03:39'
}
SPOCApiEndpoint >> executeRequest: request withParams: aParameterDictionary [

	^ self subclassResponsibility
	
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 6/10/2024 03:39'
}
SPOCApiEndpoint >> executeTest [

	^ self subclassResponsibility
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'TL 6/10/2024 03:39'
}
SPOCApiEndpoint >> initialize [

	super initialize.
	
	self returnsTestContent: false
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 7/11/2024 20:04'
}
SPOCApiEndpoint >> loadMockdataFromAsset: anAsset [

	^ ((GitAssetLoader for: SPOCApp gitRepoName)
		loadPlaintext: self class mockdataBasepath, anAsset) readStream
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'VE 7/8/2024 16:21'
}
SPOCApiEndpoint >> refreshAccessTokenAndExecute: aParamDictionary [

	self authorizer refreshAccessToken.
	self authorizer isAuthorized
		ifTrue: [^ self execute: aParamDictionary]
		ifFalse: [^ SPOCApiEndpointResult new error: self class cannotRefreshErrorMessage]
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 7/8/2024 20:09'
}
SPOCApiEndpoint >> requestUri [

	^ self class apiHost, self endpoint
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
	#'squeak_changestamp' : 'TL 7/11/2024 15:11'
}
SPOCApiEndpoint >> tinkerAlbum: aJson [

	| artists |
	artists := (aJson at: #artists) 
			collect: [:anArtist | self tinkerArtist: anArtist].
	^ SPOCAlbum new id: (aJson at: #id);
		name: (aJson at: #name);
		image: (SPOCImage newWithUrl: (((aJson at: #images) first) at: #url));
		artists: artists;
		totalTracks: (aJson at: #total_tracks);
		hasTertiaryText: false;
		yourself
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 7/7/2024 02:47'
}
SPOCApiEndpoint >> tinkerArtist: aJson [

	^ SPOCArtist new id: (aJson at: #id);
		name: (aJson at: #name);
		yourself
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 7/7/2024 02:47'
}
SPOCApiEndpoint >> tinkerDevice: aJson [
	
	^ SPOCDevice new id: (aJson at: #id);
		isActive: (aJson at: #is_active);
		name: (aJson at: #name);
		type: (aJson at: #type);
		volume: (aJson at: #volume_percent);
		supportsVolume: (aJson at: #supports_volume);
		yourself
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 7/7/2024 02:47'
}
SPOCApiEndpoint >> tinkerPlaybackState: aJson [

	| playbackState |
	playbackState := SPOCPlaybackState new device: (self tinkerDevice: (aJson at: #device));
		progress: (aJson at: #progress_ms);
		isPlaying: (aJson at: #is_playing);
		yourself.
	((aJson at: #currently_playing_type) = 'track')
		ifTrue: [playbackState track: (self tinkerTrack: (aJson at: #item))].
	^ playbackState
]

{
	#category : #response,
	#'squeak_changestamp' : 'RK 7/7/2024 16:55'
}
SPOCApiEndpoint >> tinkerPlaylist: aJson [

	^ SPOCPlaylist new id: (aJson at: #id);
		name: (aJson at: #name);
		image: (SPOCImage newWithUrl: (((aJson at: #images) first) at: #url));
		owner: ((aJson at: #owner) at: #display_name);
		hasTertiaryText: false;
		yourself
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
	#'squeak_changestamp' : 'TL 7/7/2024 02:48'
}
SPOCApiEndpoint >> tinkerRequest [

	| request |
	request := self client requestWithUrl: self requestUri.
	request method: self endpointMethod;
		headerAt: 'Authorization' put: 'Bearer ', self authorizer accessToken;
		headerAt: 'Content-Type' put: 'application/json'.
	^ request
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 7/11/2024 15:12'
}
SPOCApiEndpoint >> tinkerTrack: aJson [

	| album artists track |
	artists := (aJson at: #artists)
			collect: [:anArtist | self tinkerArtist: anArtist].
	track := SPOCTrack new id: (aJson at: #id);
			name: (aJson at: #name);
			artists: artists;
			duration: (aJson at: #duration_ms) // 1000;
			trackNumber: (aJson at: #track_number);
			hasTertiaryText: true;
			yourself.
	(aJson includesKey: #album)
		ifTrue: [album := self tinkerAlbum: (aJson at: #album).
			track image: album image;
				album: album].
	^ track
]
