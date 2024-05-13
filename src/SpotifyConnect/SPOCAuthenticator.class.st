Class {
	#name : #SPOCAuthenticator,
	#superclass : #Object,
	#instVars : [
		'randomState',
		'accessToken',
		'refreshToken',
		'callbackServer'
	],
	#classVars : [
		'ClientId',
		'ClientSecret'
	],
	#category : #SpotifyConnect
}

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
	#'squeak_changestamp' : 'VE 5/13/2024 19:38'
}
SPOCAuthenticator class >> redirectUri [
	^ 'http://localhost:8080/callback'
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
	#'squeak_changestamp' : 'VE 5/13/2024 19:46'
}
SPOCAuthenticator class >> scope [
	^ 'user-read-private user-read-email'
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
	#'squeak_changestamp' : 'VE 5/13/2024 20:43'
}
SPOCAuthenticator >> buildAuthenticationURL [
	self nextRandomState.
	^ 'https://accounts.spotify.com/authorize',
	'?response_type=code',
	'&scope=', SPOCAuthenticator scope,
	'&redirect_uri=', SPOCAuthenticator redirectUri,
	'&state=', self randomState,
	'&client_id=', SPOCAuthenticator clientId.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/13/2024 20:44'
}
SPOCAuthenticator >> callback: aRequest [
	| code state |
	aRequest fields at: 'error' ifPresent: [aRequest send500Response: 'Error'].
	code := aRequest fields at: 'code' ifAbsent: [aRequest send500Response: 'Error'].
	state := aRequest fields at: 'state' ifAbsent: [aRequest send500Response: 'Error'].
	self retreiveAccessTokenWithAccessCode: code.
	aRequest send200Response: 'Success, you are now logged in! Switch back to your Squeak'.
	self stopCallbackEndpoint.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/13/2024 20:43'
}
SPOCAuthenticator >> initialize [
	super initialize.
	self startCallbackEndpoint.
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
	#'squeak_changestamp' : 'VE 5/13/2024 20:35'
}
SPOCAuthenticator >> randomString: aLength [
	| chars randomString index |
    chars := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789' asArray.
    randomString := String new: aLength.
    1 to: aLength do: [:i | index := (1 to: chars size) atRandom.
        randomString at: i put: (chars at: index)].
    ^ randomString
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
	#'squeak_changestamp' : 'VE 5/13/2024 21:07'
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
	#'squeak_changestamp' : 'VE 5/13/2024 21:04'
}
SPOCAuthenticator >> startCallbackEndpoint [
	callbackServer := WebServer new.
	callbackServer listenOn: 8080.
	callbackServer addService: '/callback' action: [:aRequest | self callback: aRequest]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/13/2024 21:04'
}
SPOCAuthenticator >> stopCallbackEndpoint [
	callbackServer destroy.
	callbackServer := nil.
]
