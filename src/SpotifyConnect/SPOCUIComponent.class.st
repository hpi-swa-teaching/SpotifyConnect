"
Abstract class for all UI components.
"
Class {
	#name : #SPOCUIComponent,
	#superclass : #Morph,
	#instVars : [
		'app',
		'isDisabled'
	],
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:30'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:00'
}
SPOCUIComponent >> app [

	^ app
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:00'
}
SPOCUIComponent >> app: aSPOCApp [

	app := aSPOCApp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 7/2/2024 18:09'
}
SPOCUIComponent >> disable [
	
	self isDisabled: true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 7/2/2024 18:09'
}
SPOCUIComponent >> enable [
	
	self isDisabled: false
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/12/2024 02:52'
}
SPOCUIComponent >> extendFully [

	self extent: 0 @ 0.
	self extent: self fullBounds extent
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 7/2/2024 17:53'
}
SPOCUIComponent >> initialize [

	super initialize.
	
	self hResizing: #rigid; 
		vResizing: #rigid;
		isDisabled: true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 7/2/2024 17:53'
}
SPOCUIComponent >> isDisabled [

	^ isDisabled
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 7/2/2024 17:53'
}
SPOCUIComponent >> isDisabled: aBoolean [

	isDisabled := aBoolean
]

{
	#category : #actions,
	#'squeak_changestamp' : 'VE 7/2/2024 17:55'
}
SPOCUIComponent >> needsActiveDevice [
	^ false
]

{
	#category : #actions,
	#'squeak_changestamp' : 'VE 7/2/2024 17:54'
}
SPOCUIComponent >> needsLogin [

	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 7/2/2024 18:35'
}
SPOCUIComponent >> showPopUp [

	self app showPopUpFor: self
]

{
	#category : #actions,
	#'squeak_changestamp' : 'VE 7/2/2024 18:36'
}
SPOCUIComponent >> updatePlaybackState: aState [

	self isDisabled: (((self needsLogin and: self app isUserAuthorized) or: self needsLogin not) and:
		((self needsActiveDevice and: aState class ~= SPOCApiEndpointResult) or: self needsActiveDevice not)) not
]
