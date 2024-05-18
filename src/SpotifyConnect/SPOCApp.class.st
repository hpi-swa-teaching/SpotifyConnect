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
	#'squeak_changestamp' : 'VE 5/15/2024 16:48'
}
SPOCApp >> initialize [
	super initialize.
	auth := SPOCAuthorizer new.
	Transcript showln: auth startAuthorization.
	"Copy url to browser and authenticate"
	"Now use access tokens with"
	"auth accessToken"
	
]
