Class {
	#name : #SPOCAuthorizer,
	#superclass : #Object,
	#instVars : [
		'randomState',
		'accessToken',
		'refreshToken'
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
SPOCAuthorizer class >> clientId [
   ^ ClientId ifNil: [ClientId := UIManager default request: 'Please enter client id']
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/13/2024 19:15'
}
SPOCAuthorizer class >> clientSecret [
   ^ ClientSecret ifNil: [ClientSecret := UIManager default request: 'Please enter client secret']
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 09:52'
}
SPOCAuthorizer class >> redirectPort [
	^ 8080
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 11:30'
}
SPOCAuthorizer class >> redirectRoute [
	^ '/callback'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 11:30'
}
SPOCAuthorizer class >> redirectUri [
	^ 'http://localhost:', self redirectPort asString, self redirectRoute
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 11:12'
}
SPOCAuthorizer class >> resetClient [
	ClientId := nil.
	ClientSecret := nil
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 12:22'
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
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/13/2024 20:42'
}
SPOCAuthorizer >> accessToken [
	^ accessToken
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/13/2024 20:42'
}
SPOCAuthorizer >> accessToken: anObject [
	accessToken := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 11:11'
}
SPOCAuthorizer >> callback: aRequest [ 
	| code state |
	aRequest fields at: 'error' ifPresent: [aRequest send500Response: (aRequest fields at: 'error')].
	code := aRequest fields at: 'code' ifAbsent: [aRequest send400Response].
	state := aRequest fields at: 'state' ifAbsent: [aRequest send400Response].
	"state = self randomState"
	true
		ifTrue: [self retreiveAccessTokenWithAccessCode: code.
			aRequest send200Response: 'Success, you are now logged in! Switch back to your Squeak']
		ifFalse: [aRequest send500Response: 'Error: There was an error regarding the auth state.']
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 16:48'
}
SPOCAuthorizer >> initialize [
	super initialize.
	SPOCAuthorizer clientId.
	SPOCAuthorizer clientSecret.
	WebServer reset default listenOn: SPOCAuthorizer redirectPort
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/13/2024 20:36'
}
SPOCAuthorizer >> nextRandomState [
	self randomState: (self randomString: 16).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/13/2024 20:35'
}
SPOCAuthorizer >> randomState [
	^ randomState
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/13/2024 20:42'
}
SPOCAuthorizer >> randomState: aState [
	randomState := aState.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 09:49'
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
	#category : #accessing,
	#'squeak_changestamp' : 'OW 5/15/2024 18:30'
}
SPOCAuthorizer >> refreshAccessToken [
	
	| content response url responseContent |
	url := 'https://accounts.spotify.com/api/token'.
	content := 'grant_type=refresh_token',
		'&refresh_token=', self refreshToken, 
		'&client_id=', SPOCAuthorizer clientId,
		'&client_secret=', SPOCAuthorizer clientSecret.
	response := WebClient httpPost: url content: content type: 'application/x-www-form-urlencoded'.
	response isSuccess ifFalse:[^self error: response status].
	responseContent := Json readFrom: response content readStream.
 	self accessToken: (responseContent at: 'access_token').
	self refreshToken: (responseContent at: 'refresh_token').
	

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/13/2024 20:42'
}
SPOCAuthorizer >> refreshToken [
	^ refreshToken
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/13/2024 20:42'
}
SPOCAuthorizer >> refreshToken: anObject [
	refreshToken := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 16:48'
}
SPOCAuthorizer >> retreiveAccessTokenWithAccessCode: anAccessCode [
	
	| content response url responseContent |
	url := 'https://accounts.spotify.com/api/token'.
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
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 16:48'
}
SPOCAuthorizer >> setupCallbackService [
	WebServer default removeService: SPOCAuthorizer redirectRoute.
	WebServer default addService: SPOCAuthorizer redirectRoute action: [:aRequest | self callback: aRequest]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 16:48'
}
SPOCAuthorizer >> startAuthorization [
	self nextRandomState.
	self setupCallbackService.
	^ 'https://accounts.spotify.com/authorize',
		'?response_type=code',
		'&scope=', SPOCAuthorizer scope,
		'&redirect_uri=', SPOCAuthorizer redirectUri,
		'&state=', self randomState,
		'&client_id=', SPOCAuthorizer clientId.
]
