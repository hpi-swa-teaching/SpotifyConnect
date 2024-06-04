Class {
	#name : #SPOCTestApiEndpoint,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 12:42'
}
SPOCTestApiEndpoint >> setUp [
	apiEndpoint := SPOCApiEndpoint new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/4/2024 09:09'
}
SPOCTestApiEndpoint >> testNoAuthenticator [
	
	| res |
	res := apiEndpoint execute: (Dictionary new).
	self assert: res class = SPOCApiEndpointResult
]
