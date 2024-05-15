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
	#'squeak_changestamp' : 'VE 5/15/2024 11:40'
}
SPOCApp >> initialize [
	super initialize.
	auth := SPOCAuthenticator new.
	Transcript showln: auth startAuthentication.
	"Copy url to browser and authenticate"
	"Now use access tokens with"
	"auth accessToken"
	
]
