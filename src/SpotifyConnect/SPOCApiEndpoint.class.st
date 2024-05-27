Class {
	#name : #SPOCApiEndpoint,
	#superclass : #Object,
	#instVars : [
		'authorizer',
		'returnsTestContent'
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
	#'squeak_changestamp' : 'VE 5/15/2024 18:44'
}
SPOCApiEndpoint >> authorizer [
	^ authorizer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/15/2024 18:57'
}
SPOCApiEndpoint >> authorizer: anAuthorizer [
	authorizer := anAuthorizer
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
	#'squeak_changestamp' : 'TL 5/27/2024 15:55'
}
SPOCApiEndpoint >> execute: aParamDictionary [ 
	| response request contentStream |
	self returnsTestContent
		ifTrue: [^ self tinkerReponseContent: self executeTest]
		ifFalse: [self authorizer
				ifNil: [self error: 'Authorizer needed']
				ifNotNil: [request := self tinkerRequest.
					response := self executeRequest: request withParams: aParamDictionary.
					response code = 401
						ifTrue: [authorizer refreshAccessToken.
							authorizer isAuthorized
								ifTrue: [^ self execute: aParamDictionary]
								ifFalse: [^ self error: 'Could not refresh access token']]
						ifFalse: [
							"Use for executeTest string"
							"Transcript showln: (response content)."
							contentStream := response content readStream.
							^ self tinkerReponseContent: contentStream]]]
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
	#'squeak_changestamp' : 'VE 5/15/2024 18:57'
}
SPOCApiEndpoint >> initialize [
	super initialize.
	
	self returnsTestContent: false.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 12:13'
}
SPOCApiEndpoint >> requestUri [
	^ SPOCApiEndpoint apiHost, self endpoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/15/2024 18:57'
}
SPOCApiEndpoint >> returnsTestContent [
	^ returnsTestContent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/15/2024 18:57'
}
SPOCApiEndpoint >> returnsTestContent: aBoolean [
	returnsTestContent := aBoolean
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
	#'squeak_changestamp' : 'MH 5/26/2024 21:47'
}
SPOCApiEndpoint >> tinkerRequest [
	| request |
	request := self client requestWithUrl: SPOCApiEndpoint apiHost, self endpoint.
	request method: self endpointMethod.
	request headerAt: 'Authorization' put: 'Bearer ', self authorizer accessToken.
	request headerAt: 'Content-Type' put: 'application/json'.
	^ request.
]
