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
	#'squeak_changestamp' : 'VE 5/15/2024 12:49'
}
SPOCTestApiEndpoint >> testNoAuthenticator [
	
	self should: [apiEndpoint execute: (Dictionary new)] raise: Error.
]
