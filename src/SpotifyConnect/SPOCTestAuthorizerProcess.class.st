"
Tests parts necessary for the Authorizer.
"
Class {
	#name : #SPOCTestAuthorizerProcess,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests',
	#'squeak_changestamp' : 'OW 7/9/2024 10:44'
}

{
	#category : #testing,
	#'squeak_changestamp' : 'VE 6/20/2024 19:56'
}
SPOCTestAuthorizerProcess >> testAuthorizationUrl [
	
	| targetUrl url | 
	url := self auth buildAuthorizationUrl.
	targetUrl := 'https://accounts.spotify.com/authorize',
		'?response_type=code',
		'&scope=', SPOCAuthorizer scope,
		'&redirect_uri=', SPOCAuthorizer redirectUri,
		'&state=', self auth randomState,
		'&client_id=', SPOCAuthorizer clientId. 
	self assert: targetUrl = url.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'VE 6/20/2024 19:54'
}
SPOCTestAuthorizerProcess >> testCallbackEndpoint [
	
	| response |
	response := WebClient httpGet: SPOCAuthorizer redirectUri.
	self assert: (response code = 404) not
]

{
	#category : #testing,
	#'squeak_changestamp' : 'VE 6/20/2024 19:54'
}
SPOCTestAuthorizerProcess >> testCallbackErrors [
	
	| response |
	response := WebClient httpGet: (SPOCAuthorizer redirectUri, '?code=123').
	self assert: response code = 400.
	response := WebClient httpGet: (SPOCAuthorizer redirectUri, '?state=123').
	self assert: response code = 400.
	response := WebClient httpGet: (SPOCAuthorizer redirectUri, '?error=error').
	self assert: response code = 500
]

{
	#category : #testing,
	#'squeak_changestamp' : 'VE 7/11/2024 22:26'
}
SPOCTestAuthorizerProcess >> testStartAuthorization [
	
	| entryPoints |
	self auth setupCallbackService. 
	entryPoints := WebServer default entryPoints.
	self assert: ((entryPoints at: (SPOCAuthorizer redirectRoute)) isNil not)
]
