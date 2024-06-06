Class {
	#name : #SPOCAuthTestResource,
	#superclass : #TestResource,
	#instVars : [
		'auth'
	],
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'OW 6/5/2024 18:28'
}
SPOCAuthTestResource >> auth [
	^ auth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OW 6/5/2024 18:28'
}
SPOCAuthTestResource >> auth: anObject [
	auth := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 6/5/2024 19:12'
}
SPOCAuthTestResource >> setUp [

	auth := SPOCAuthorizer new.
	self auth startAuthorization.
	
	[auth isAuthorized] 
		whileFalse: [(Delay forMilliseconds: 100) wait]
	
]
