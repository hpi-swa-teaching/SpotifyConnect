Class {
	#name : #SPOCAuthenticator,
	#superclass : #Object,
	#instVars : [
		'randomState',
		'accessToken',
		'refreshToken'
	],
	#classVars : [
		'CallbackServer',
		'ClientId',
		'ClientSecret'
	],
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 11:40'
}
SPOCAuthenticator class >> callbackServer [
	CallbackServer ifNil: [CallbackServer := WebServer new].
	CallbackServer listenOn: SPOCAuthenticator redirectPort.
	^ CallbackServer 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/13/2024 19:59'
}
SPOCAuthenticator class >> clientId [
   ^ ClientId ifNil: [ClientId := UIManager default request: 'Please enter client id']
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/13/2024 19:15'
}
SPOCAuthenticator class >> clientSecret [
   ^ ClientSecret ifNil: [ClientSecret := UIManager default request: 'Please enter client secret']
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 09:52'
}
SPOCAuthenticator class >> redirectPort [
	^ 8080
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 09:53'
}
SPOCAuthenticator class >> redirectRoute [
	^ 'callback'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 09:53'
}
SPOCAuthenticator class >> redirectUri [
	^ 'http://localhost:', self redirectPort asString, '/', self redirectRoute
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/13/2024 20:00'
}
SPOCAuthenticator class >> resetClient [
	ClientId := nil.
	ClientSecret := nil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 12:22'
}
SPOCAuthenticator class >> scope [
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
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/13/2024 20:42'
}
SPOCAuthenticator >> accessToken [
	^ accessToken
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/13/2024 20:42'
}
SPOCAuthenticator >> accessToken: anObject [
	accessToken := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 11:45'
}
SPOCAuthenticator >> buildAuthenticationURL [
	self nextRandomState.
	self setupCallbackService.
	^ 'https://accounts.spotify.com/authorize',
		'?response_type=code',
		'&scope=', SPOCAuthenticator scope,
		'&redirect_uri=', SPOCAuthenticator redirectUri,
		'&state=', self randomState,
		'&client_id=', SPOCAuthenticator clientId.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 14:26'
}
SPOCAuthenticator >> callback: aRequest [ 
	| code state |
	aRequest fields at: 'error' ifPresent: [aRequest send500Response: (aRequest fields at: 'error')].
	code := aRequest fields at: 'code' ifAbsent: [aRequest send400Response].
	state := aRequest fields at: 'state' ifAbsent: [aRequest send400Response].
	state = self randomState
		ifTrue: [self retreiveAccessTokenWithAccessCode: code.
			aRequest send200Response: 'Success, you are now logged in! Switch back to your Squeak']
		ifFalse: [aRequest send500Response: 'Error: There was an error regarding the auth state.']
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 10:10'
}
SPOCAuthenticator >> initialize [
	super initialize.
	SPOCAuthenticator clientId.
	SPOCAuthenticator clientSecret.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/13/2024 20:36'
}
SPOCAuthenticator >> nextRandomState [
	self randomState: (self randomString: 16).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/13/2024 20:35'
}
SPOCAuthenticator >> randomState [
	^ randomState
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/13/2024 20:42'
}
SPOCAuthenticator >> randomState: aState [
	randomState := aState.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 09:49'
}
SPOCAuthenticator >> randomString: aLength [
	| chars randomString index |
    	chars := Character alphabet asArray.
    	randomString := String new: aLength.
    	1 to: aLength do: [:i | index := (1 to: chars size) atRandom.
        	randomString at: i put: (chars at: index)].
    	
	^ randomString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/14/2024 14:40'
}
SPOCAuthenticator >> refreshAccessToken [
	"TODO Refresh"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/13/2024 20:42'
}
SPOCAuthenticator >> refreshToken [
	^ refreshToken
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/13/2024 20:42'
}
SPOCAuthenticator >> refreshToken: anObject [
	refreshToken := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 10:01'
}
SPOCAuthenticator >> retreiveAccessTokenWithAccessCode: anAccessCode [
	
	| content response url responseContent |
	url := 'https://accounts.spotify.com/api/token'.
	content := 'grant_type=authorization_code',
		'&code=', anAccessCode, 
		'&redirect_uri=', SPOCAuthenticator redirectUri,
		'&client_id=', SPOCAuthenticator clientId,
		'&client_secret=', SPOCAuthenticator clientSecret.
	response := WebClient httpPost: url content: content type: 'application/x-www-form-urlencoded'.
	response isSuccess ifFalse:[^self error: response status].
	responseContent := Json readFrom: response content readStream.
 	self accessToken: (responseContent at: 'access_token').
	self refreshToken: (responseContent at: 'refresh_token').
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 11:45'
}
SPOCAuthenticator >> setupCallbackService [
	SPOCAuthenticator callbackServer removeService: ('/', SPOCAuthenticator redirectRoute).
	SPOCAuthenticator callbackServer addService: ('/', SPOCAuthenticator redirectRoute) action: [:aRequest | self callback: aRequest]
]
