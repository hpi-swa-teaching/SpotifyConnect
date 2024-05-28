Class {
	#name : #SPOCUIComponent,
	#superclass : #Morph,
	#instVars : [
		'app'
	],
	#category : #SpotifyConnect
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/27/2024 16:28'
}
SPOCUIComponent >> app [
	^ app
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/27/2024 16:28'
}
SPOCUIComponent >> app: anObject [
	app := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 14:14'
}
SPOCUIComponent >> attachButton [
	| txt |
	txt := SPOCBoxedText new contents: 'Login'; yourself.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 14:13'
}
SPOCUIComponent >> initialize [
	super initialize.
	
	self attachButton.
]
