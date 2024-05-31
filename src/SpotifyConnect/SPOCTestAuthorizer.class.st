Class {
	#name : #SPOCTestAuthorizer,
	#superclass : #TestCase,
	#instVars : [
		'authorizer'
	],
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/26/2024 21:13'
}
SPOCTestAuthorizer >> setUp [
	authorizer := SPOCAuthorizer new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/26/2024 21:04'
}
SPOCTestAuthorizer >> testAuthorisationUrl [
	
	| responseUrl targetUrl clipboardText | 
	responseUrl := authorizer startAuthorization.
	targetUrl := 'https://accounts.spotify.com/authorize',
		'?response_type=code',
		'&scope=', SPOCAuthorizer scope,
		'&redirect_uri=', SPOCAuthorizer redirectUri,
		'&state=', authorizer randomState,
		'&client_id=', SPOCAuthorizer clientId. 
	clipboardText := Clipboard default primitiveClipboardText.
	
	self assert: targetUrl equals: responseUrl.
	self assert: targetUrl equals: clipboardText
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/26/2024 19:00'
}
SPOCTestAuthorizer >> testCallbackEndpoint [
	
	| response |
	authorizer startAuthorization.
	response := WebClient httpGet: SPOCAuthorizer redirectUri.
	self assert: (response code = 404) not
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/26/2024 19:00'
}
SPOCTestAuthorizer >> testCallbackErrors [
	
	| response |
	authorizer startAuthorization.
	response := WebClient httpGet: (SPOCAuthorizer redirectUri, '?code=123').
	self assert: response code = 400.
	response := WebClient httpGet: (SPOCAuthorizer redirectUri, '?state=123').
	self assert: response code = 400.
	response := WebClient httpGet: (SPOCAuthorizer redirectUri, '?error=error').
	self assert: response code = 500
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/28/2024 21:19'
}
SPOCTestAuthorizer >> testOnAuthorizationSuccessCallbacks [
	
	| tmp |
	tmp := 0.
	authorizer registerSuccessCallback: [tmp := 1].
	authorizer callSuccessCallbacks.
	self assert: tmp = 1.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/26/2024 21:48'
}
SPOCTestAuthorizer >> testRandomState [
	
	| lastRandomState |
	authorizer nextRandomState.
	self assert: authorizer randomState isString.
	lastRandomState := authorizer randomState.
	authorizer nextRandomState.
	self assert: (lastRandomState = authorizer randomState) not
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/26/2024 19:05'
}
SPOCTestAuthorizer >> testResponseAsset [
	
	self assert: ((GitAssetLoader for: 'SpotifyConnect') loadString: 'assets/successResponse.html') notNil.
]
