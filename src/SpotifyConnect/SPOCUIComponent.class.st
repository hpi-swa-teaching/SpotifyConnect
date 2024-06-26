Class {
	#name : #SPOCUIComponent,
	#superclass : #Morph,
	#instVars : [
		'app',
		'disabled'
	],
	#category : #'SpotifyConnect-UI'
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
	#'squeak_changestamp' : 'TL 6/10/2024 17:59'
}
SPOCUIComponent >> disabled [

	^ disabled
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/16/2024 18:05'
}
SPOCUIComponent >> disabled: aBoolean [

	disabled := aBoolean
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
	#'squeak_changestamp' : 'TL 6/12/2024 03:08'
}
SPOCUIComponent >> initialize [

	super initialize.
	
	self hResizing: #rigid; 
		vResizing: #rigid;
		disabled: true
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 6/10/2024 18:29'
}
SPOCUIComponent >> updatePlaybackState: aState [

	^ self subclassResponsibility
]
