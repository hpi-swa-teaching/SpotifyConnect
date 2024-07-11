"
Tests for logic of the authorizer.
"
Class {
	#name : #SPOCTestAuthorizer,
	#superclass : #TestCase,
	#instVars : [
		'authorizer'
	],
	#category : #'SpotifyConnect-Auth-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:17'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/11/2024 19:57'
}
SPOCTestAuthorizer >> authorizer [

	^ authorizer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/11/2024 19:57'
}
SPOCTestAuthorizer >> authorizer: anObject [

	authorizer := anObject
]

{
	#category : #running,
	#'squeak_changestamp' : 'TL 7/11/2024 18:40'
}
SPOCTestAuthorizer >> setUp [

	self authorizer: SPOCAuthorizer new
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 18:40'
}
SPOCTestAuthorizer >> testOnAuthorizationSuccessCallbacks [
	
	| value |
	value := 0.
	self authorizer registerSuccessCallback: [value := 1].
	self authorizer callSuccessCallbacks.
	self assert: value = 1
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 18:40'
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
	#'squeak_changestamp' : 'TL 6/10/2024 23:17'
}
SPOCTestAuthorizer >> testResponseAsset [
	
	self assert: ((GitAssetLoader for: 'SpotifyConnect') loadString: 'assets/successResponse.html') notNil
]
