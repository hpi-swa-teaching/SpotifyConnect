Class {
	#name : #SPOCApp,
	#superclass : #Object,
	#instVars : [
		'auth'
	],
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/13/2024 21:07'
}
SPOCApp >> initialize [
	super initialize.
	auth := SPOCAuthenticator new.
	Transcript showln: auth buildAuthenticationURL.
	"Copy url to browser and authenticate"
	"Now use access tokens with"
	"auth accessToken"
	
]
