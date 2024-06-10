Class {
	#name : #SPOCTestAuthorizer,
	#superclass : #TestCase,
	#instVars : [
		'authorizer'
	],
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:46'
}
SPOCTestAuthorizer >> authorizer [

	^ authorizer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:46'
}
SPOCTestAuthorizer >> authorizer: anObject [

	authorizer := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/10/2024 04:46'
}
SPOCTestAuthorizer >> setUp [

	self authorizer: SPOCAuthorizer new
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:39'
}
SPOCTestAuthorizer >> testAuthorizationUrl [
	
	| clipboardText responseUrl targetUrl | 
	responseUrl := self authorizer startAuthorization.
	targetUrl := 'https://accounts.spotify.com/authorize',
		'?response_type=code',
		'&scope=', SPOCAuthorizer scope,
		'&redirect_uri=', SPOCAuthorizer redirectUri,
		'&state=', self authorizer randomState,
		'&client_id=', SPOCAuthorizer clientId. 
	clipboardText := Clipboard default primitiveClipboardText.	
	self assert: targetUrl equals: responseUrl.
	self assert: targetUrl equals: clipboardText
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:40'
}
SPOCTestAuthorizer >> testCallbackEndpoint [
	
	| response |
	self authorizer startAuthorization.
	response := WebClient httpGet: SPOCAuthorizer redirectUri.
	self assert: (response code = 404) not
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:40'
}
SPOCTestAuthorizer >> testCallbackErrors [
	
	| response |
	self authorizer startAuthorization.
	response := WebClient httpGet: (SPOCAuthorizer redirectUri, '?code=123').
	self assert: response code = 400.
	response := WebClient httpGet: (SPOCAuthorizer redirectUri, '?state=123').
	self assert: response code = 400.
	response := WebClient httpGet: (SPOCAuthorizer redirectUri, '?error=error').
	self assert: response code = 500
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:40'
}
SPOCTestAuthorizer >> testOnAuthorizationSuccessCallbacks [
	
	| tmp |
	tmp := 0.
	self authorizer registerSuccessCallback: [tmp := 1].
	self authorizer callSuccessCallbacks.
	self assert: tmp = 1
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:41'
}
SPOCTestAuthorizer >> testRandomState [
	
	| lastRandomState |
	self authorizer nextRandomState.
	self assert: self authorizer randomState isString.
	lastRandomState := self authorizer randomState.
	self authorizer nextRandomState.
	self assert: (lastRandomState = self authorizer randomState) not
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:41'
}
SPOCTestAuthorizer >> testResponseAsset [
	
	self assert: ((GitAssetLoader for: 'SpotifyConnect') loadString: 'assets/successResponse.html') notNil
]
