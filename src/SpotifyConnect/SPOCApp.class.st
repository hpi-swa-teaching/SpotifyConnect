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
	#'squeak_changestamp' : 'TL 5/27/2024 16:34'
}
SPOCApp >> initialize [

	| player |
	super initialize.
	
	self auth: SPOCAuthorizer new.
	auth startAuthorization.
	player := SPOCPlayer new
		app: self;
		openInWorld
	
]
