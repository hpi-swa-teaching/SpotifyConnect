Class {
	#name : #SPOCUserLogin,
	#superclass : #SPOCUIComponent,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/28/2024 14:38'
}
SPOCUserLogin >> attachButton [
	| btn txt |
	txt := SPOCBoxedText new contents: 'Login'; yourself.
	btn := SPOCClickable newUsing: txt onClick: [:enEvent | self app auth startAuthorization].
	self addMorph: btn.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/28/2024 14:39'
}
SPOCUserLogin >> initialize [
	super initialize.
	
	self color: Color transparent;
		attachButton.
]
