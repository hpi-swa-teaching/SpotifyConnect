"
I hold a valid authorizer so test can make real API calls.
"
Class {
	#name : #SPOCAuthTestResource,
	#superclass : #TestResource,
	#instVars : [
		'auth'
	],
	#category : #'SpotifyConnect-Auth-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:19'
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
	#'squeak_changestamp' : 'VE 7/9/2024 11:36'
}
SPOCAuthTestResource >> setUp [

	SPOCAuthorizer refreshToken: nil.
	self auth: SPOCAuthorizer new.
	self auth startAuthorization.	
	[self auth isAuthorized] 
		whileFalse: [(Delay forMilliseconds: 100) wait]
	
]
