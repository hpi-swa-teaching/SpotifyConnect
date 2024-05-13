Class {
	#name : #SPOCTestAccessTokens,
	#superclass : #TestCase,
	#instVars : [
		'accessTokens'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/13/2024 17:27'
}
SPOCTestAccessTokens >> setUp [
	super setUp.
	accessTokens := SPOCAccessTokens new 
		accessToken: '123'; 
		refreshToken: 'MEGA'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/13/2024 17:28'
}
SPOCTestAccessTokens >> testAccessTokens [

	self assert: accessTokens accessToken = '123'.
	self assert: accessTokens refreshToken = 'fresh'
]
