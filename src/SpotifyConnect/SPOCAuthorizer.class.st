Class {
	#name : #SPOCAuthorizer,
	#superclass : #Object,
	#instVars : [
		'randomState',
		'accessToken',
		'refreshToken',
		'isAuthorized',
		'successCallbacks'
	],
	#classVars : [
		'ClientId',
		'ClientSecret'
	],
	#category : #SpotifyConnect
}

{
	#category : #credentials,
	#'squeak_changestamp' : 'OW 5/22/2024 18:43'
}
SPOCAuthorizer class >> clientId [

   ^ ClientId ifNil: [ClientId := UIManager default request: 'Please enter client id']
]

{
	#category : #credentials,
	#'squeak_changestamp' : 'OW 5/22/2024 18:43'
}
SPOCAuthorizer class >> clientSecret [

   ^ ClientSecret ifNil: [ClientSecret := UIManager default request: 'Please enter client secret']
]

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 6/4/2024 09:28'
}
SPOCAuthorizer class >> randomStateStringLength [

	^ 16
]

{
	#category : #constants,
	#'squeak_changestamp' : 'OW 5/22/2024 18:43'
}
SPOCAuthorizer class >> redirectPort [

	^ 8080
]

{
	#category : #constants,
	#'squeak_changestamp' : 'OW 5/22/2024 18:43'
}
SPOCAuthorizer class >> redirectRoute [

	^ '/callback'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'OW 5/22/2024 18:43'
}
SPOCAuthorizer class >> redirectUri [

	^ 'http://localhost:', self redirectPort asString, self redirectRoute
]

{
	#category : #reset,
	#'squeak_changestamp' : 'OW 5/22/2024 18:44'
}
SPOCAuthorizer class >> resetClient [

	ClientId := nil.
	ClientSecret := nil
]

{
	#category : #constants,
	#'squeak_changestamp' : 'VK 6/4/2024 16:52'
}
SPOCAuthorizer class >> scope [

	^ 'user-read-playback-state ',
		'user-modify-playback-state ',
		'user-read-currently-playing ',
		'playlist-read-private ',
		'playlist-read-collaborative ',
		'user-read-playback-position ',
		'user-read-email ',
		'user-read-private ',
		'user-read-recently-played'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'OW 5/22/2024 22:28'
}
SPOCAuthorizer class >> spotifyTokenApiUrl [

	^ 'https://accounts.spotify.com/api/token'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 6/4/2024 09:38'
}
SPOCAuthorizer class >> successPage [
		
	^ (GitAssetLoader for: 'SpotifyConnect') loadString: 'assets/successResponse.html'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OW 5/22/2024 18:37'
}
SPOCAuthorizer >> accessToken [

	^ accessToken
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OW 5/22/2024 18:37'
}
SPOCAuthorizer >> accessToken: aToken [

	accessToken := aToken
]

{
	#category : #authorization,
	#'squeak_changestamp' : 'VE 6/4/2024 09:30'
}
SPOCAuthorizer >> buildAuthorizationUrl [
	
	self nextRandomState.
	 ^ 'https://accounts.spotify.com/authorize',
		'?response_type=code',
		'&scope=', SPOCAuthorizer scope,
		'&redirect_uri=', SPOCAuthorizer redirectUri,
		'&state=', self randomState,
		'&client_id=', SPOCAuthorizer clientId
]

{
	#category : #callback,
	#'squeak_changestamp' : 'VE 5/28/2024 21:19'
}
SPOCAuthorizer >> callSuccessCallbacks [

	successCallbacks do: [:aBlock | aBlock value]
]

{
	#category : #callback,
	#'squeak_changestamp' : 'VE 6/4/2024 09:38'
}
SPOCAuthorizer >> callback: aRequest [

	| code state |
	aRequest fields at: 'error' ifPresent: [aRequest send500Response: (aRequest fields at: 'error')].
	code := aRequest fields at: 'code' ifAbsent: [aRequest send400Response].
	state := aRequest fields at: 'state' ifAbsent: [aRequest send400Response].
	state = self randomState
		ifTrue: [self retreiveAccessTokenWithAccessCode: code.
			aRequest send200Response: (SPOCAuthorizer successPage) contentType: 'text/html']
		ifFalse: [aRequest send500Response: 'Error: There was an error regarding the auth state.']
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/28/2024 21:20'
}
SPOCAuthorizer >> initialize [

	super initialize.
	SPOCAuthorizer clientId.
	SPOCAuthorizer clientSecret.
	self isAuthorized: false;
		successCallbacks: OrderedCollection new.
	WebServer reset default listenOn: SPOCAuthorizer redirectPort
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OW 5/22/2024 18:37'
}
SPOCAuthorizer >> isAuthorized [

	^ isAuthorized
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OW 5/22/2024 18:37'
}
SPOCAuthorizer >> isAuthorized: aBoolean [

	isAuthorized := aBoolean
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 21:37'
}
SPOCAuthorizer >> logout [

	self accessToken: nil
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/4/2024 09:27'
}
SPOCAuthorizer >> nextRandomState [

	self randomState: (self randomString: SPOCAuthorizer randomStateStringLength).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OW 5/22/2024 18:36'
}
SPOCAuthorizer >> randomState [

	^ randomState
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OW 5/22/2024 18:38'
}
SPOCAuthorizer >> randomState: aState [

	randomState := aState.
]

{
	#category : #utilities,
	#'squeak_changestamp' : 'OW 5/22/2024 18:38'
}
SPOCAuthorizer >> randomString: aLength [

	| chars randomString index |
    	chars := Character alphabet asArray.
    	randomString := String new: aLength.
    	1 to: aLength do: [:i | index := (1 to: chars size) atRandom.
        	randomString at: i put: (chars at: index)].
    	
	^ randomString
]

{
	#category : #authorization,
	#'squeak_changestamp' : 'VE 6/4/2024 09:36'
}
SPOCAuthorizer >> refreshAccessToken [

	| content response responseContent |
	self isAuthorized: false.
	content := self spotifyRefreshApiContent.
	response := self requestSpotifyApiEndpoint: content.
	response isSuccess ifFalse: [^ self error: response status].
	responseContent := Json readFrom: response content readStream.
	self accessToken: (responseContent at: 'access_token').
	self refreshToken: (responseContent at: 'refresh_token' ifAbsent: [self refreshToken]).
	self isAuthorized: true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OW 5/22/2024 18:36'
}
SPOCAuthorizer >> refreshToken [

	^ refreshToken
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OW 5/22/2024 18:36'
}
SPOCAuthorizer >> refreshToken: aToken [

	refreshToken := aToken
]

{
	#category : #callback,
	#'squeak_changestamp' : 'VE 6/4/2024 09:18'
}
SPOCAuthorizer >> registerSuccessCallback: aBlock [

	self successCallbacks add: aBlock
]

{
	#category : #'api-calls',
	#'squeak_changestamp' : 'VE 6/4/2024 09:36'
}
SPOCAuthorizer >> requestSpotifyApiEndpoint: aContentString [
	
	^ WebClient httpPost: SPOCAuthorizer spotifyTokenApiUrl content: aContentString type: 'application/x-www-form-urlencoded'

]

{
	#category : #authorization,
	#'squeak_changestamp' : 'VE 6/4/2024 09:36'
}
SPOCAuthorizer >> retreiveAccessTokenWithAccessCode: anAccessCode [
	
	| content response responseContent |
	content := self spotifyAccessApiContent: anAccessCode.
	response := self requestSpotifyApiEndpoint: content.
	response isSuccess ifFalse:[^self error: response status].
	responseContent := Json readFrom: response content readStream.
 	self accessToken: (responseContent at: 'access_token');
		refreshToken: (responseContent at: 'refresh_token');
		isAuthorized: true;
		callSuccessCallbacks.
	

]

{
	#category : #callback,
	#'squeak_changestamp' : 'VE 5/28/2024 14:47'
}
SPOCAuthorizer >> setupCallbackService [

	WebServer default removeService: SPOCAuthorizer redirectRoute.
	WebServer default addService: SPOCAuthorizer redirectRoute action: [:aRequest | self callback: aRequest].
]

{
	#category : #'api-calls',
	#'squeak_changestamp' : 'VE 6/4/2024 09:33'
}
SPOCAuthorizer >> spotifyAccessApiContent: anAccessCode [

	^ 'grant_type=authorization_code',
		'&code=', anAccessCode, 
		'&redirect_uri=', SPOCAuthorizer redirectUri,
		'&client_id=', SPOCAuthorizer clientId,
		'&client_secret=', SPOCAuthorizer clientSecret

]

{
	#category : #'api-calls',
	#'squeak_changestamp' : 'VE 6/4/2024 09:34'
}
SPOCAuthorizer >> spotifyRefreshApiContent [
	
	^ 'grant_type=refresh_token' ,
		'&refresh_token=' , self refreshToken , 
		'&client_id=' , SPOCAuthorizer clientId , 
		'&client_secret=' , SPOCAuthorizer clientSecret
]

{
	#category : #authorization,
	#'squeak_changestamp' : 'VE 6/4/2024 09:30'
}
SPOCAuthorizer >> startAuthorization [

	| url |
	self setupCallbackService.
	url := self buildAuthorizationUrl.
	Clipboard default primitiveClipboardText: url.	
	WebBrowser default openOnUrl: url.
	^ url
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/4/2024 09:29'
}
SPOCAuthorizer >> successCallbacks [

	^ successCallbacks
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/4/2024 09:29'
}
SPOCAuthorizer >> successCallbacks: aCollection [

	successCallbacks := aCollection
]
