Class {
	#name : #SPOCUserLogin,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'text',
		'button',
		'buttonLabel'
	],
	#category : #'SpotifyConnect-UI'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/10/2024 04:32'
}
SPOCUserLogin >> attachButton [

	self text: (SPOCBoxedText new contents: ''; yourself);
		button: (SPOCClickable newUsing: self text onClick: [:anEvent | self app auth startAuthorization]);
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
	#'squeak_changestamp' : 'TL 6/10/2024 04:33'
}
SPOCUserLogin >> buttonLabel: aString [

	buttonLabel := aString.
	self text contents: aString.
	self extendFully
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/10/2024 04:32'
}
SPOCUserLogin >> initialize [

	super initialize.

	self color: Color transparent;
		attachButton;
		buttonLabel: 'Login'
		
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
	#'squeak_changestamp' : 'VE 5/28/2024 21:33'
}
SPOCUserLogin >> toggleLogin [
	
	self buttonLabel: 'Login'.
	self button onClick: [:anEvent | self app auth startAuthorization]
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 6/10/2024 04:33'
}
SPOCUserLogin >> toggleLogout [
	
	self buttonLabel: 'Logout'.
	self button onClick: [:anEvent |
			self app auth logout.
			self toggleLogin]
]
