Class {
	#name : #SPOCTestApiEndpoint,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 05:01'
}
SPOCTestApiEndpoint >> apiEndpoint [

	^ apiEndpoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 05:01'
}
SPOCTestApiEndpoint >> apiEndpoint: anObject [

	apiEndpoint := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/10/2024 05:02'
}
SPOCTestApiEndpoint >> setUp [

	self apiEndpoint: SPOCApiEndpoint new
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 05:02'
}
SPOCTestApiEndpoint >> testNoAuthenticator [
	
	| res |
	res := self apiEndpoint execute: (Dictionary new).
	self assert: res class = SPOCApiEndpointResult
]
