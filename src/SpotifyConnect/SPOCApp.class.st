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
	#'squeak_changestamp' : 'VE 5/13/2024 20:48'
}
SPOCApp >> initialize [
	super initialize.
	auth := SPOCAuthenticator new.
	Transcript showln: auth buildAuthenticationURL.
	
]
