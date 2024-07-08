"
I am responsibile for the OAuth2 authorization workflow.
"
Class {
	#name : #SPOCAuthorizer,
	#superclass : #Object,
	#instVars : [
		'accessToken',
		'isAuthorized',
		'randomState',
		'successCallbacks'
	],
	#classVars : [
		'ClientId',
		'ClientSecret',
		'RefreshToken'
	],
	#category : #SpotifyConnect,
	#'squeak_changestamp' : 'OW 7/4/2024 12:28'
}

{
	#category : #messages,
	#'squeak_changestamp' : 'TL 7/7/2024 02:06'
}
SPOCAuthorizer class >> authStateErrorMessage [

	^ 'Error: There was an error regarding the auth state.'
]

{
	#category : #credentials,
	#'squeak_changestamp' : 'TL 7/7/2024 02:00'
}
SPOCAuthorizer class >> clientId [

	^ ClientId
		ifNil: [ClientId := UIManager default request: self clientIdMessage]
]

{
	#category : #messages,
	#'squeak_changestamp' : 'TL 7/7/2024 02:00'
}
SPOCAuthorizer class >> clientIdMessage [

	^ 'Please enter client id'
]

{
	#category : #credentials,
	#'squeak_changestamp' : 'TL 7/7/2024 02:01'
}
SPOCAuthorizer class >> clientSecret [

   ^ ClientSecret
		ifNil: [ClientSecret := UIManager default request: self clientSecretMessage]
]

{
	#category : #messages,
	#'squeak_changestamp' : 'TL 7/7/2024 02:01'
}
SPOCAuthorizer class >> clientSecretMessage [

	^ 'Please enter client secret'
]

{
	#category : #messages,
	#'squeak_changestamp' : 'TL 7/7/2024 02:18'
}
SPOCAuthorizer class >> pasteUrlToWebBrowserMessage [

	^ 'Paste this url (already in your clipboard) to a web browser: ', String cr, String cr
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
	#category : #credentials,
	#'squeak_changestamp' : 'VE 7/2/2024 19:38'
}
SPOCAuthorizer class >> refreshToken [

	^ RefreshToken
]

{
	#category : #credentials,
	#'squeak_changestamp' : 'VE 7/2/2024 19:37'
}
SPOCAuthorizer class >> refreshToken: aToken [
	
	RefreshToken := aToken
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
	#'squeak_changestamp' : 'VE 7/8/2024 16:17'
}
SPOCAuthorizer >> authorizeByRefresh [
	
	self refreshAccessToken. 
	self isAuthorized
		ifTrue: [self callSuccessCallbacks]
]

{
	#category : #authorization,
	#'squeak_changestamp' : 'TL 7/8/2024 20:10'
}
SPOCAuthorizer >> buildAuthorizationUrl [
	
	self nextRandomState.
	 ^ 'https://accounts.spotify.com/authorize',
		'?response_type=code',
		'&scope=', self class scope,
		'&redirect_uri=', self class redirectUri,
		'&state=', self randomState,
		'&client_id=', self class clientId
]

{
	#category : #callback,
	#'squeak_changestamp' : 'TL 7/7/2024 02:03'
}
SPOCAuthorizer >> callSuccessCallbacks [

	self successCallbacks
		do: [:aBlock | aBlock value]
]

{
	#category : #callback,
	#'squeak_changestamp' : 'TL 7/8/2024 20:10'
}
SPOCAuthorizer >> callback: aRequest [

	| code state |
	aRequest fields at: #error ifPresent: [aRequest send500Response: (aRequest fields at: #error)].
	code := aRequest fields at: #code ifAbsent: [aRequest send400Response].
	state := aRequest fields at: #state ifAbsent: [aRequest send400Response].
	state = self randomState
		ifTrue: [self retreiveAccessTokenWithAccessCode: code.
			aRequest send200Response: (self class successPage) contentType: 'text/html']
		ifFalse: [aRequest send500Response: self class authStateErrorMessage]
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/7/2024 02:15'
}
SPOCAuthorizer >> canRefresh [
	
	^ self refreshToken isNil not
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/8/2024 20:10'
}
SPOCAuthorizer >> initialize [

	super initialize.
	
	self class clientId.
	self class clientSecret.
	self isAuthorized: false;
		successCallbacks: OrderedCollection new.
	WebServer reset default listenOn: self class redirectPort
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
	#category : #actions,
	#'squeak_changestamp' : 'TL 7/7/2024 02:16'
}
SPOCAuthorizer >> logout [

	self accessToken: nil;
		isAuthorized: false
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/7/2024 02:17'
}
SPOCAuthorizer >> nextRandomState [

	self randomState: (self randomString: self class randomStateStringLength)
]

{
	#category : #authorization,
	#'squeak_changestamp' : 'TL 7/7/2024 02:18'
}
SPOCAuthorizer >> openUrlIfPossible: aUrl in: aWebBrowser [
	
	aWebBrowser
		ifNotNil: [WebBrowser default openOnUrl: aUrl]
		ifNil: [UIManager inform: self class pasteUrlToWebBrowserMessage, aUrl]
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
	#'squeak_changestamp' : 'TL 7/7/2024 02:19'
}
SPOCAuthorizer >> randomState: aState [

	randomState := aState
]

{
	#category : #utilities,
	#'squeak_changestamp' : 'VE 7/8/2024 16:17'
}
SPOCAuthorizer >> randomString: aLength [

	| chars index randomString |
    	chars := Character alphabet asArray.
    	randomString := String new: aLength.
    	1 to: aLength
		do: [:anIndex | index := (1 to: chars size) atRandom.
      		randomString at: anIndex put: (chars at: index)].
	^ randomString
]

{
	#category : #authorization,
	#'squeak_changestamp' : 'TL 7/7/2024 02:22'
}
SPOCAuthorizer >> refreshAccessToken [

	| content response responseContent |
	self isAuthorized: false.
	content := self spotifyRefreshApiContent.
	response := self requestSpotifyApiEndpoint: content.
	response isSuccess
		ifFalse: [self refreshToken: nil. 
			self startAuthorization].
	responseContent := Json readFrom: response content readStream.
	self accessToken: (responseContent at: #access_token);
		refreshToken: (responseContent at: #refresh_token ifAbsent: [self refreshToken]);
		isAuthorized: true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 7/2/2024 19:36'
}
SPOCAuthorizer >> refreshToken [

	^ self class refreshToken
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 7/2/2024 19:37'
}
SPOCAuthorizer >> refreshToken: aToken [

	self class refreshToken: aToken
]

{
	#category : #callback,
	#'squeak_changestamp' : 'VE 6/4/2024 09:18'
}
SPOCAuthorizer >> registerSuccessCallback: aBlock [

	self successCallbacks add: aBlock
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/8/2024 20:10'
}
SPOCAuthorizer >> requestSpotifyApiEndpoint: aContentString [
	
	^ WebClient httpPost: self class spotifyTokenApiUrl content: aContentString type: 'application/x-www-form-urlencoded'

]

{
	#category : #authorization,
	#'squeak_changestamp' : 'TL 7/7/2024 01:16'
}
SPOCAuthorizer >> retreiveAccessTokenWithAccessCode: anAccessCode [
	
	| content response responseContent |
	content := self spotifyAccessApiContent: anAccessCode.
	response := self requestSpotifyApiEndpoint: content.
	response isSuccess
		ifFalse: [^self error: response status].
	responseContent := Json readFrom: response content readStream.
 	self accessToken: (responseContent at: #access_token);
		refreshToken: (responseContent at: #refresh_token);
		isAuthorized: true;
		callSuccessCallbacks
	

]

{
	#category : #callback,
	#'squeak_changestamp' : 'TL 7/8/2024 20:10'
}
SPOCAuthorizer >> setupCallbackService [

	WebServer default removeService: self class redirectRoute.
	WebServer default addService: self class redirectRoute action: [:aRequest | self callback: aRequest]
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/8/2024 20:10'
}
SPOCAuthorizer >> spotifyAccessApiContent: anAccessCode [

	^ 'grant_type=authorization_code',
		'&code=', anAccessCode, 
		'&redirect_uri=', self class redirectUri,
		'&client_id=', self class clientId,
		'&client_secret=', self class clientSecret

]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/8/2024 20:10'
}
SPOCAuthorizer >> spotifyRefreshApiContent [
	
	^ 'grant_type=refresh_token',
		'&refresh_token=', self refreshToken, 
		'&client_id=', self class clientId, 
		'&client_secret=', self class clientSecret
]

{
	#category : #authorization,
	#'squeak_changestamp' : 'VE 7/8/2024 16:16'
}
SPOCAuthorizer >> startAuthorization [

	| url |
	self canRefresh
		ifTrue: [self authorizeByRefresh.
			^ self].
	self setupCallbackService.
	url := self buildAuthorizationUrl.
	Clipboard default primitiveClipboardText: url.	
	self openUrlIfPossible: url in: WebBrowser default.
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
