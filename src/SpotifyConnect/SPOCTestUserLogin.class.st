Class {
	#name : #SPOCTestUserLogin,
	#superclass : #SPOCTestCaseWithAuth,
	#instVars : [
		'userLogin',
		'app'
	],
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:43'
}
SPOCTestUserLogin >> setUp [

	app := SPOCApp new.
	app auth: self auth.
	userLogin := SPOCUserLogin new app: app; yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:46'
}
SPOCTestUserLogin >> testChangingOnClickAction [
	
	| actionBefore actionNow |
	actionBefore := userLogin button onClick.
	userLogin toggleLogout.
	actionNow := userLogin button onClick.
	self assert: actionNow ~= actionBefore.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:48'
}
SPOCTestUserLogin >> testToggleLogin [
	
	userLogin buttonLabel: 'something else'.
	userLogin toggleLogin.
	self assert: userLogin buttonLabel equals: 'Login'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:48'
}
SPOCTestUserLogin >> testToggleLogout [
	
	userLogin toggleLogout.
	self assert: userLogin buttonLabel equals: 'Logout'.
]
