"
Test for correct set access and refreshToken.
"
Class {
	#name : #SPOCTestTokens,
	#superclass : #SPOCTestCaseWithAuth,
	#category : #'SpotifyConnect-Auth-Tests',
	#'squeak_changestamp' : 'OW 7/9/2024 10:45'
}

{
	#category : #running,
	#'squeak_changestamp' : 'TL 6/10/2024 04:53'
}
SPOCTestTokens >> setUp [

	super setUp
]

{
	#category : #testing,
	#'squeak_changestamp' : 'OW 6/5/2024 18:33'
}
SPOCTestTokens >> testAccAndRefToken [

	self assert: self auth accessToken notNil.
	self assert: self auth refreshToken notNil
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:53'
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
