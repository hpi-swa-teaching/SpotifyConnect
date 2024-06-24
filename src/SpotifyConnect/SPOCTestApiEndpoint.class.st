Class {
	#name : #SPOCTestApiEndpoint,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'VE 6/23/2024 18:22'
}
SPOCTestApiEndpoint >> setUp [

	apiEndpoint := SPOCApiEndpoint new
]

{
	#category : #testing,
	#'squeak_changestamp' : 'VE 6/23/2024 18:23'
}
SPOCTestApiEndpoint >> testNoAuthenticator [
	
	| res |
	res := apiEndpoint execute: (Dictionary new).
	self assert: (res isKindOf: SPOCApiEndpointResult)
]
