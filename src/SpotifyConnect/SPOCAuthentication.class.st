Class {
	#name : #SPOCAuthentication,
	#superclass : #Object,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/13/2024 17:49'
}
SPOCAuthentication >> authenticate [
	"TODO open browser with correct link"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/13/2024 18:22'
}
SPOCAuthentication >> callback: aRequest [
	| code state |
	code := aRequest fields at: 'code' ifAbsent: [aRequest send500Response: 'Error'].
	state := aRequest fields at: 'state' ifAbsent: [aRequest send500Response: 'Error'].
	aRequest send200Response: 'Success'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/13/2024 17:52'
}
SPOCAuthentication >> initialize [
	super initialize.
	self startCallbackEndpoint.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/13/2024 17:52'
}
SPOCAuthentication >> startCallbackEndpoint [
	(WebServer reset default) listenOn: 8080.

	WebServer default addService: '/callback' action: [:aRequest | self callback: aRequest]
]
