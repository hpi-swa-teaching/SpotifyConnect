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
	#'squeak_changestamp' : 'VE 5/28/2024 20:59'
}
SPOCUserLogin >> attachButton [

	self text: (SPOCBoxedText new contents: self buttonLabel; yourself);
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
	#'squeak_changestamp' : 'VE 5/28/2024 20:58'
}
SPOCUserLogin >> buttonLabel: anObject [
	buttonLabel := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/28/2024 20:58'
}
SPOCUserLogin >> initialize [
	super initialize.
	
	self color: Color transparent;
		buttonLabel: 'Login';
		attachButton;
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
