"
Test the API endpoint.
"
Class {
	#name : #SPOCTestApiEndpoint,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint'
	],
	#category : #'SpotifyConnect-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:25'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:38'
}
SPOCTestApiEndpoint >> apiEndpoint [

	^ apiEndpoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:38'
}
SPOCTestApiEndpoint >> apiEndpoint: anObject [

	apiEndpoint := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 7/11/2024 12:38'
}
SPOCTestApiEndpoint >> setUp [

	self apiEndpoint: SPOCApiEndpoint new
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:38'
}
SPOCTestApiEndpoint >> testNoAuthenticator [
	
	| res |
	res := self apiEndpoint execute: Dictionary new.
	self assert: res class = SPOCApiEndpointResult
]
