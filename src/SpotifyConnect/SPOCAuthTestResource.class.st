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
	#'squeak_changestamp' : 'TL 6/10/2024 04:38'
}
SPOCAuthTestResource >> auth [

	^ auth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:38'
}
SPOCAuthTestResource >> auth: anObject [

	auth := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/10/2024 04:46'
}
SPOCAuthTestResource >> setUp [

	self auth: SPOCAuthorizer new.
	self auth startAuthorization.	
	[self auth isAuthorized] 
		whileFalse: [(Delay forMilliseconds: 100) wait]
	
]
