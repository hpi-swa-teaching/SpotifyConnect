Class {
	#name : #SPOCTestAuthenticator,
	#superclass : #TestCase,
	#instVars : [
		'authenticator'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 18:31'
}
SPOCTestAuthenticator >> setUp [
	authenticator := SPOCAuthorizer new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 18:09'
}
SPOCTestAuthenticator >> testCallbackEndpoint [
	
	| response |
	authenticator startAuthorization.
	response := WebClient httpGet: SPOCAuthorizer redirectUri.
	self assert: (response code = 404) not.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 18:09'
}
SPOCTestAuthenticator >> testCallbackErrors [
	
	| response |
	authenticator startAuthorization.
	response := WebClient httpGet: (SPOCAuthorizer redirectUri, '?code=123').
	self assert: response code = 400.
	response := WebClient httpGet: (SPOCAuthorizer redirectUri, '?state=123').
	self assert: response code = 400.
	response := WebClient httpGet: (SPOCAuthorizer redirectUri, '?error=error').
	self assert: response code = 500.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 14:39'
}
SPOCTestAuthenticator >> testRandomState [
	
	| lastRandomState |
	self assert: authenticator randomState = nil.
	authenticator nextRandomState.
	self assert: authenticator randomState isString.
	lastRandomState := authenticator randomState.
	authenticator nextRandomState.
	self assert: (lastRandomState = authenticator randomState) not
]
