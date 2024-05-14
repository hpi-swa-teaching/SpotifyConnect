Class {
	#name : #SPOCTestAuthenticator,
	#superclass : #TestCase,
	#instVars : [
		'track',
		'authenticator'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 14:12'
}
SPOCTestAuthenticator >> setUp [
	authenticator := SPOCAuthenticator new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 14:29'
}
SPOCTestAuthenticator >> testCallbackErrors [
	
	| response |
	response := WebClient httpGet: (SPOCAuthenticator redirectUri, '?code=123').
	self assert: response code = 400.
	response := WebClient httpGet: (SPOCAuthenticator redirectUri, '?state=123').
	self assert: response code = 400.
	response := WebClient httpGet: (SPOCAuthenticator redirectUri, '?error=error').
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
