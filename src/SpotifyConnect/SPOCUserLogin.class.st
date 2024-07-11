"
concrete class for the login/logout button component
"
Class {
	#name : #SPOCUserLogin,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'button',
		'buttonLabel',
		'text'
	],
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:14'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/11/2024 17:38'
}
SPOCUserLogin >> attachButton [

	self text: SPOCBoxedText new;
		button: (SPOCClickable newUsing: self text
				onClick: [:anEvent | self app auth startAuthorization]);
		addMorph: self button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:33'
}
SPOCUserLogin >> button [

	^ button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:33'
}
SPOCUserLogin >> button: anObject [

	button := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:33'
}
SPOCUserLogin >> buttonLabel [

	^ buttonLabel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 7/8/2024 17:13'
}
SPOCUserLogin >> buttonLabel: aString [

	buttonLabel := aString.
	self text contents: aString.
	self extendFully
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/8/2024 19:39'
}
SPOCUserLogin >> initialize [

	super initialize.

	self color: Color transparent;
		attachButton;
		buttonLabel: 'Login'
		
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 7/2/2024 19:12'
}
SPOCUserLogin >> needsLogin [
	
	^ false
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:34'
}
SPOCUserLogin >> text [

	^ text
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:34'
}
SPOCUserLogin >> text: anObject [

	text := anObject
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 7/11/2024 17:41'
}
SPOCUserLogin >> toggleLogin [
	
	self buttonLabel: 'Login'.
	self button
		onClick: [:anEvent | self app auth startAuthorization]
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 7/11/2024 17:41'
}
SPOCUserLogin >> toggleLogout [
	
	self buttonLabel: 'Logout'.
	self button
		onClick: [:anEvent | self app logout.
			self toggleLogin]
]
