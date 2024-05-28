Class {
	#name : #SPOCUserLogin,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'text',
		'button',
		'buttonLabel'
	],
	#category : #SpotifyConnect
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/28/2024 21:36'
}
SPOCUserLogin >> attachButton [

	self text: (SPOCBoxedText new contents: ''; yourself);
		button: ( SPOCClickable newUsing: text onClick: [:enEvent | self app auth startAuthorization]);
		addMorph: self button.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 20:59'
}
SPOCUserLogin >> button [
	^ button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 20:59'
}
SPOCUserLogin >> button: anObject [
	button := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 20:58'
}
SPOCUserLogin >> buttonLabel [
	^ buttonLabel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 21:36'
}
SPOCUserLogin >> buttonLabel: aString [

	buttonLabel := aString.
	self text contents: aString.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/28/2024 21:36'
}
SPOCUserLogin >> initialize [
	super initialize.

	self color: Color transparent;
		attachButton;
		buttonLabel: 'Login';
		extendFully.
		
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 20:59'
}
SPOCUserLogin >> text [
	^ text
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 20:59'
}
SPOCUserLogin >> text: anObject [
	text := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/28/2024 21:33'
}
SPOCUserLogin >> toggleLogin [
	
	self buttonLabel: 'Login'.
	self button onClick: [:anEvent | self app auth startAuthorization]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/28/2024 21:37'
}
SPOCUserLogin >> toggleLogout [
	
	self buttonLabel: 'Logout'.
	self button onClick: [:anEvent | self app auth logout. self toggleLogin]
]
