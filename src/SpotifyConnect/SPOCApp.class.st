Class {
	#name : #SPOCApp,
	#superclass : #Object,
	#instVars : [
		'auth'
	],
	#category : #SpotifyConnect
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/27/2024 16:15'
}
SPOCApp >> auth [
	^ auth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/27/2024 16:15'
}
SPOCApp >> auth: anObject [
	auth := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 5/27/2024 16:15'
}
SPOCApp >> initialize [

	super initialize.
	
	self auth: SPOCAuthorizer new.
	Transcript showln: auth startAuthorization.
	"Copy url to browser and authenticate"
	"Now use access tokens with"
	"auth accessToken"
	
]
