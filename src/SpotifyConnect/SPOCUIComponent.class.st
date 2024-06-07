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
	#'squeak_changestamp' : 'RK 6/7/2024 11:00'
}
SPOCUIComponent >> extendFully [

	self extent: 0@0.
	self extent: self fullBounds extent
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/7/2024 11:00'
}
SPOCUIComponent >> initialize [

	super initialize.
]
