"
Tests for logic of the authorizer.
"
Class {
	#name : #SPOCTestAuthorizer,
	#superclass : #TestCase,
	#category : #'SpotifyConnect-Auth-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:17'
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
