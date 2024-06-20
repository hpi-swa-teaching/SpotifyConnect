Class {
	#name : #SPOCTestAuthorizerProcess,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #'as yet unclassified',
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 19:54'
}
SPOCTestAuthorizerProcess >> testCallbackEndpoint [
	
	| response |
	response := WebClient httpGet: SPOCAuthorizer redirectUri.
	self assert: (response code = 404) not
]

{
	#category : #'as yet unclassified',
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:11'
}
SPOCTestAuthorizerProcess >> testStartAuthorization [
	
	| entryPoints |
	entryPoints := WebServer default entryPoints.
	self assert: ((entryPoints at: (SPOCAuthorizer redirectRoute)) ~= nil).
]
