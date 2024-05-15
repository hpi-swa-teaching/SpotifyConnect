Class {
	#name : #SPOCApiEndpoint,
	#superclass : #Object,
	#instVars : [
		'authenticator',
		'isInTestMode'
	],
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 12:14'
}
SPOCApiEndpoint class >> apiHost [
	^ 'https://api.spotify.com/'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/14/2024 14:59'
}
SPOCApiEndpoint >> authenticator [
	^ authenticator
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/14/2024 14:59'
}
SPOCApiEndpoint >> authenticator: anObject [
	authenticator := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 12:18'
}
SPOCApiEndpoint >> client [
	^ WebClient new initializeFromUrl: SPOCApiEndpoint apiHost.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 11:53'
}
SPOCApiEndpoint >> endpoint [
	^ self subclassResponsibility
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 11:52'
}
SPOCApiEndpoint >> endpointMethod [
	^ self subclassResponsibility
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 18:15'
}
SPOCApiEndpoint >> execute: aParamDictionary [ 
	| response request contentStream |
	self isInTestMode
		ifTrue: [^ self tinkerReponseContent: self executeTest]
		ifFalse: [self authenticator
				ifNil: [self error: 'Authenticator needed']
				ifNotNil: [request := self tinkerRequest.
					response := self executeRequest: request withParams: aParamDictionary.
					contentStream := response content readStream.
					"Use for executeTest string"
					"Transcript showln: (response content)."
					^ self tinkerReponseContent: contentStream]]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 11:56'
}
SPOCApiEndpoint >> executeRequest: request withParams: aParameterDictionary [
	^ self subclassResponsibility
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 18:00'
}
SPOCApiEndpoint >> executeTest [
	^ self subclassResponsibility
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 18:00'
}
SPOCApiEndpoint >> initialize [
	super initialize.
	
	self isInTestMode: false.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/15/2024 18:00'
}
SPOCApiEndpoint >> isInTestMode [
	^ isInTestMode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/15/2024 18:00'
}
SPOCApiEndpoint >> isInTestMode: anObject [
	isInTestMode := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 12:13'
}
SPOCApiEndpoint >> requestUri [
	^ SPOCApiEndpoint apiHost, self endpoint
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 17:57'
}
SPOCApiEndpoint >> tinkerReponseContent: aContentStream [
	^ self subclassResponsibility
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 12:13'
}
SPOCApiEndpoint >> tinkerRequest [
	| request |
	request := self client requestWithUrl: SPOCApiEndpoint apiHost, self endpoint.
	request method: self endpointMethod.
	request headerAt: 'Authorization' put: 'Bearer ', self authenticator accessToken.
	request headerAt: 'Content-Type' put: 'application/json'.
	^ request.
]
