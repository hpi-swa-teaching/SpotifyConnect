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
	#'squeak_changestamp' : 'VE 5/28/2024 20:44'
}
SPOCUIComponent >> extendFully [
	self extent: 0@0.
	self extent: self fullBounds extent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 19:48'
}
SPOCUIComponent >> initialize [
	super initialize.
]
