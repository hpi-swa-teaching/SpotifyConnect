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
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/10/2024 03:57'
}
SPOCApiEndpoint class >> apiHost [

	^ 'https://api.spotify.com/'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:37'
}
SPOCApiEndpoint >> authorizer [

	^ authorizer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:37'
}
SPOCApiEndpoint >> authorizer: anAuthorizer [

	authorizer := anAuthorizer
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 03:37'
}
SPOCApiEndpoint >> client [

	^ WebClient new initializeFromUrl: SPOCApiEndpoint apiHost
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 6/10/2024 03:37'
}
SPOCApiEndpoint >> endpoint [

	^ self subclassResponsibility
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 6/10/2024 03:37'
}
SPOCApiEndpoint >> endpointMethod [

	^ self subclassResponsibility
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 03:40'
}
SPOCApiEndpoint >> execute: aParamDictionary [ 

	| response contentStream |
	self returnsTestContent
		ifTrue: [^ self tinkerReponseContent: self executeTest].
	self authorizer
		ifNil: [^ SPOCApiEndpointResult new error: 'Authorizer needed'; yourself].
	response := self executeRequest: (self tinkerRequest) withParams: aParamDictionary.
	response code = 401
		ifTrue: [^ self refreshAccessTokenAndExecute: aParamDictionary].
	response code = 200
		ifTrue: [contentStream := response content readStream.
			^ self tinkerReponseContent: contentStream].
	^ SPOCApiEndpointResult new response: response; yourself
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 03:39'
}
SPOCApiEndpoint >> executeRequest: request withParams: aParameterDictionary [

	^ self subclassResponsibility
	
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 03:39'
}
SPOCApiEndpoint >> executeTest [

	^ self subclassResponsibility
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/10/2024 03:39'
}
SPOCApiEndpoint >> initialize [

	super initialize.
	
	self returnsTestContent: false
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 03:39'
}
SPOCApiEndpoint >> refreshAccessTokenAndExecute: aParamDictionary [

	self authorizer refreshAccessToken.
	self authorizer isAuthorized
		ifTrue: [^ self execute: aParamDictionary]
		ifFalse: [^ SPOCApiEndpointResult new error: 'Access Token Refresh Faild'; yourself]
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 6/10/2024 03:40'
}
SPOCApiEndpoint >> requestUri [

	^ SPOCApiEndpoint apiHost, self endpoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:40'
}
SPOCApiEndpoint >> returnsTestContent [

	^ returnsTestContent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:40'
}
SPOCApiEndpoint >> returnsTestContent: aBoolean [

	returnsTestContent := aBoolean
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 6/10/2024 03:40'
}
SPOCApiEndpoint >> tinkerReponseContent: aContentStream [

	^ self subclassResponsibility
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 03:41'
}
SPOCApiEndpoint >> tinkerRequest [

	| request |
	request := self client requestWithUrl: SPOCApiEndpoint apiHost, self endpoint.
	request method: self endpointMethod;
		headerAt: 'Authorization' put: 'Bearer ', self authorizer accessToken;
		headerAt: 'Content-Type' put: 'application/json'.
	^ request
]
