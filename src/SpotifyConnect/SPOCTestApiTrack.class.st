Class {
	#name : #SPOCTestApiTrack,
	#superclass : #SPOCTestApiEndpoint,
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 18:57'
}
SPOCTestApiTrack >> setUp [
	apiEndpoint := SPOCApiTrack new.
	apiEndpoint returnsTestContent: true.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 18:08'
}
SPOCTestApiTrack >> testExecute [
	| dict res |
	dict := Dictionary new.
	dict at: 'trackId' put: '11dFghVXANMlKmJXsNCbNl'.
	res := apiEndpoint execute: dict.
	
	self assert: res class = JsonObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 18:57'
}
SPOCTestApiTrack >> testRefreshAccessTokenFails [
	
	| authorizer dict |
	authorizer := SPOCAuthorizer new.
	authorizer refreshToken: '123'.
	authorizer accessToken: '123'.
	
	apiEndpoint authorizer: authorizer.
	apiEndpoint returnsTestContent: false.
	
	dict := Dictionary new.
	dict at: 'trackId' put: '11dFghVXANMlKmJXsNCbNl'.
	self should: [apiEndpoint execute: dict] raise: Error.
	
]
