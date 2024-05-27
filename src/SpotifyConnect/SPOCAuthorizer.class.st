Class {
	#name : #SPOCAuthorizer,
	#superclass : #Object,
	#instVars : [
		'randomState',
		'accessToken',
		'refreshToken',
		'isAuthorized'
	],
	#classVars : [
		'ClientId',
		'ClientSecret'
	],
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/22/2024 18:43'
}
SPOCAuthorizer class >> clientId [

   ^ ClientId ifNil: [ClientId := UIManager default request: 'Please enter client id']
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/22/2024 18:43'
}
SPOCAuthorizer class >> clientSecret [

   ^ ClientSecret ifNil: [ClientSecret := UIManager default request: 'Please enter client secret']
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/22/2024 18:43'
}
SPOCAuthorizer class >> redirectPort [

	^ 8080
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/22/2024 18:43'
}
SPOCAuthorizer class >> redirectRoute [

	^ '/callback'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/22/2024 18:43'
}
SPOCAuthorizer class >> redirectUri [

	^ 'http://localhost:', self redirectPort asString, self redirectRoute
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/22/2024 18:44'
}
SPOCAuthorizer class >> resetClient [

	ClientId := nil.
	ClientSecret := nil
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/22/2024 18:44'
}
SPOCAuthorizer class >> scope [

	^ 'user-read-playback-state ',
		'user-modify-playback-state ',
		'user-read-currently-playing ',
		'playlist-read-private ',
		'playlist-read-collaborative ',
		'user-read-playback-position ',
		'user-read-email ',
		'user-read-private'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/22/2024 22:28'
}
SPOCAuthorizer class >> spotifyTokenApiUrl [

	^ 'https://accounts.spotify.com/api/token'
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/26/2024 18:45'
}
SPOCAuthorizer >> callback: aRequest [

	| code state htmlResponse |
	aRequest fields at: 'error' ifPresent: 
		[aRequest send500Response: (aRequest fields at: 'error')].
	code := aRequest fields at: 'code' ifAbsent: 
		[aRequest send400Response].
	state := aRequest fields at: 'state' ifAbsent: 
		[aRequest send400Response].
	state = self randomState
		ifTrue: [self retreiveAccessTokenWithAccessCode: code.
			htmlResponse := ((GitAssetLoader for: 'SpotifyConnect') 
								loadString: 'assets/successResponse.html').
			aRequest send200Response: htmlResponse contentType: 'text/html']
		ifFalse: [aRequest send500Response: 'Error: There was an error regarding the auth state.']
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/22/2024 18:38'
}
SPOCAuthorizer >> initialize [

	super initialize.
	SPOCAuthorizer clientId.
	SPOCAuthorizer clientSecret.
	self isAuthorized: false.
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/22/2024 18:38'
}
SPOCAuthorizer >> nextRandomState [

	self randomState: (self randomString: 16).
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
	#category : #'as yet unclassified',
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/22/2024 22:34'
}
SPOCAuthorizer >> refreshAccessToken [

	| content response responseContent tmpRefreshToken |
	self isAuthorized: false.
	content := 'grant_type=refresh_token' ,
				'&refresh_token=' , self refreshToken , 
				'&client_id=' , SPOCAuthorizer clientId , 
				'&client_secret=' , SPOCAuthorizer clientSecret.
	response := WebClient
				httpPost: SPOCAuthorizer spotifyTokenApiUrl
				content: content
				type: 'application/x-www-form-urlencoded'.
	response isSuccess
		ifFalse: [^ self error: response status].
	responseContent := Json readFrom: response content readStream.
	self accessToken: (responseContent at: 'access_token').
	tmpRefreshToken := responseContent at: 'refresh_token'.
	tmpRefreshToken
		ifNotNil: [self refreshToken: tmpRefreshToken].
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/22/2024 22:30'
}
SPOCAuthorizer >> retreiveAccessTokenWithAccessCode: anAccessCode [
	
	| content response url responseContent |
	url := SPOCAuthorizer spotifyTokenApiUrl.
	content := 'grant_type=authorization_code',
		'&code=', anAccessCode, 
		'&redirect_uri=', SPOCAuthorizer redirectUri,
		'&client_id=', SPOCAuthorizer clientId,
		'&client_secret=', SPOCAuthorizer clientSecret.
	response := WebClient httpPost: url content: content type: 'application/x-www-form-urlencoded'.
	response isSuccess ifFalse:[^self error: response status].
	responseContent := Json readFrom: response content readStream.
 	self accessToken: (responseContent at: 'access_token').
	self refreshToken: (responseContent at: 'refresh_token').
	self isAuthorized: true
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/22/2024 18:38'
}
SPOCAuthorizer >> setupCallbackService [

	WebServer default removeService: SPOCAuthorizer redirectRoute.
	WebServer default addService: SPOCAuthorizer redirectRoute action: [:aRequest | self callback: aRequest]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/25/2024 17:13'
}
SPOCAuthorizer >> startAuthorization [

	| url |
	self nextRandomState.
	self setupCallbackService.
	url := 'https://accounts.spotify.com/authorize',
		'?response_type=code',
		'&scope=', SPOCAuthorizer scope,
		'&redirect_uri=', SPOCAuthorizer redirectUri,
		'&state=', self randomState,
		'&client_id=', SPOCAuthorizer clientId.
	
	Clipboard default primitiveClipboardText: url.	
	WebBrowser default openOnUrl: url.
	^ url
]
