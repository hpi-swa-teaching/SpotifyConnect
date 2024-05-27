Class {
	#name : #SPOCTestTokens,
	#superclass : #TestCase,
	#instVars : [
		'authorizer'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/26/2024 21:55'
}
SPOCTestTokens >> setUp [
	authorizer := SPOCAuthorizer new.
	(Delay forSeconds: 1) wait.
	authorizer startAuthorization.
	(Delay forSeconds: 2) wait.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/26/2024 21:49'
}
SPOCTestTokens >> testAccAndRefToken [

	self assert: authorizer accessToken notNil.
	self assert: authorizer refreshToken notNil
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/26/2024 21:51'
}
SPOCTestTokens >> testRefreshAccessToken [

	| oldAccToken |
	oldAccToken := authorizer accessToken.
	
	authorizer refreshAccessToken.
	
	self assert: authorizer accessToken notNil.
	self assert: authorizer refreshToken notNil.
	self assert: authorizer isAuthorized.
	self assert: (oldAccToken = authorizer accessToken) not
	"undocumented: You dont get a new refresh token every time so no test for that"
]
