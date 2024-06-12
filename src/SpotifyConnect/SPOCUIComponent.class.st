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
	#category : #'pop-ups',
	#'squeak_changestamp' : 'TL 6/10/2024 18:22'
}
SPOCUIComponent >> devicePopUp [

	UIManager inform: 'Please open your Spotify App and play music to activate your device!'
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
	#'squeak_changestamp' : 'TL 6/10/2024 17:59'
}
SPOCUIComponent >> disabled: anObject [

	disabled := anObject
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
	#category : #'pop-ups',
	#'squeak_changestamp' : 'TL 6/10/2024 18:21'
}
SPOCUIComponent >> loginPopUp [

	UIManager inform: 'Please log in!'
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 6/10/2024 18:29'
}
SPOCUIComponent >> updatePlaybackState: aState [

	^ self subclassResponsibility
]
