Class {
	#name : #SPOCTestAuthorizer,
	#superclass : #TestCase,
	#instVars : [
		'authorizer'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'VE 6/20/2024 19:50'
}
SPOCTestAuthorizer >> setUp [

	authorizer := SPOCAuthorizer new.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'VE 6/20/2024 19:49'
}
SPOCTestAuthorizer >> testOnAuthorizationSuccessCallbacks [
	
	| tmp |
	tmp := 0.
	authorizer registerSuccessCallback: [tmp := 1].
	authorizer callSuccessCallbacks.
	self assert: tmp = 1
]

{
	#category : #testing,
	#'squeak_changestamp' : 'VE 6/20/2024 19:49'
}
SPOCTestAuthorizer >> testRandomState [
	
	| lastRandomState |
	authorizer nextRandomState.
	self assert: authorizer randomState isString.
	lastRandomState := authorizer randomState.
	authorizer nextRandomState.
	self assert: (lastRandomState = authorizer randomState) not
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:17'
}
SPOCTestAuthorizer >> testResponseAsset [
	
	self assert: ((GitAssetLoader for: 'SpotifyConnect') loadString: 'assets/successResponse.html') notNil
]

{
	#category : #testing,
	#'squeak_changestamp' : 'VE 6/20/2024 20:03'
}
SPOCTestAuthorizer >> testStartAuthorization [
	
	| url entryPoints |
	url := authorizer startAuthorization.
	entryPoints := WebServer default entryPoints.
	self assert: ((entryPoints at: (SPOCAuthorizer redirectRoute)) ~= nil).
	self assert: url ~= nil.
]
