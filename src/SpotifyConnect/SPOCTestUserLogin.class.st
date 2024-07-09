"
Test user Login Button field.
"
Class {
	#name : #SPOCTestUserLogin,
	#superclass : #SPOCTestCaseWithAuth,
	#instVars : [
		'app',
		'userLogin'
	],
	#category : #'SpotifyConnect-Auth-Tests',
	#'squeak_changestamp' : 'OW 7/9/2024 10:45'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/24/2024 01:34'
}
SPOCTestUserLogin >> app [

	^ app
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/24/2024 01:34'
}
SPOCTestUserLogin >> app: anObject [

	app := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/24/2024 03:21'
}
SPOCTestUserLogin >> setUp [

	self app: (SPOCApp new auth: self auth);
		userLogin: (SPOCUserLogin new app: self app)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 01:35'
}
SPOCTestUserLogin >> testChangingOnClickAction [
	
	| actionBefore actionNow |
	actionBefore := self userLogin button onClick.
	self userLogin toggleLogout.
	actionNow := self userLogin button onClick.
	self assert: actionNow ~= actionBefore
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 01:35'
}
SPOCTestUserLogin >> testToggleLogin [
	
	self userLogin buttonLabel: 'something else';
		toggleLogin.
	self assert: self userLogin buttonLabel equals: 'Login'
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 01:36'
}
SPOCTestUserLogin >> testToggleLogout [
	
	self userLogin toggleLogout.
	self assert: self userLogin buttonLabel equals: 'Logout'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/24/2024 01:34'
}
SPOCTestUserLogin >> userLogin [

	^ userLogin
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/24/2024 01:34'
}
SPOCTestUserLogin >> userLogin: anObject [

	userLogin := anObject
]
