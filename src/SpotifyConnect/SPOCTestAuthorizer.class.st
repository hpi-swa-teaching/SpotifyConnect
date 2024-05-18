Class {
	#name : #SPOCTestAuthorizer,
	#superclass : #TestCase,
	#instVars : [
		'authorizer'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 18:50'
}
SPOCTestAuthorizer >> setUp [
	authorizer := SPOCAuthorizer new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 18:50'
}
SPOCTestAuthorizer >> testCallbackEndpoint [
	
	| response |
	authorizer startAuthorization.
	response := WebClient httpGet: SPOCAuthorizer redirectUri.
	self assert: (response code = 404) not.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 18:50'
}
SPOCTestAuthorizer >> testCallbackErrors [
	
	| response |
	authorizer startAuthorization.
	response := WebClient httpGet: (SPOCAuthorizer redirectUri, '?code=123').
	self assert: response code = 400.
	response := WebClient httpGet: (SPOCAuthorizer redirectUri, '?state=123').
	self assert: response code = 400.
	response := WebClient httpGet: (SPOCAuthorizer redirectUri, '?error=error').
	self assert: response code = 500.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 18:50'
}
SPOCTestAuthorizer >> testRandomState [
	
	| lastRandomState |
	self assert: authorizer randomState = nil.
	authorizer nextRandomState.
	self assert: authorizer randomState isString.
	lastRandomState := authorizer randomState.
	authorizer nextRandomState.
	self assert: (lastRandomState = authorizer randomState) not
]
