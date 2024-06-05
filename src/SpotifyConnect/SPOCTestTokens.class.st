Class {
	#name : #SPOCTestTokens,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 6/4/2024 12:17'
}
SPOCTestTokens >> setUp [

	super setUp.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 6/5/2024 18:33'
}
SPOCTestTokens >> testAccAndRefToken [

	self assert: self auth accessToken notNil.
	self assert: self auth refreshToken notNil
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 6/5/2024 18:34'
}
SPOCTestTokens >> testRefreshAccessToken [

	| oldAccToken |
	oldAccToken := self auth accessToken.
	
	self auth refreshAccessToken.
	
	self assert: self auth accessToken notNil.
	self assert: self auth refreshToken notNil.
	self assert: self auth isAuthorized.
	self assert: (oldAccToken = self auth accessToken) not
	"undocumented: You dont get a new refresh token every time so no test for that"
]
