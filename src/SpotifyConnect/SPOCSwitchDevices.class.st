Class {
	#name : #SPOCSwitchDevices,
	#superclass : #RectangleMorph,
	#instVars : [
		'devices',
		'devicesMorphs',
		'button',
		'activeDevice'
	],
	#category : #SpotifyConnect
}

{
	#category : #'class variables',
	#'squeak_changestamp' : 'VK 5/25/2024 20:29'
}
SPOCSwitchDevices class >> baseLayer [
	^500
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'VK 5/25/2024 20:28'
}
SPOCSwitchDevices class >> buttonHeight [
	^50
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'VK 5/25/2024 20:26'
}
SPOCSwitchDevices class >> buttonPosition [
	^ 100@500
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'VK 5/25/2024 20:28'
}
SPOCSwitchDevices class >> buttonWidth [
	^200
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 11:45'
}
SPOCSwitchDevices >> activeDevice [
	^ activeDevice
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 11:45'
}
SPOCSwitchDevices >> activeDevice: anObject [
	activeDevice := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 13:42'
}
SPOCSwitchDevices >> buildButton [

	button := SimpleButtonMorph new.
    	button color: SPOCStyle spotifyGreen.
    	button extent: (SPOCSwitchDevices buttonWidth @ SPOCSwitchDevices buttonHeight).
    	button position: SPOCSwitchDevices buttonPosition.
    	button morphicLayerNumber: SPOCSwitchDevices baseLayer.
    	button label: 'show devices'.
    	button target: self.
    	button actionSelector: #currentDevices.
    	button openInWorld.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 14:14'
}
SPOCSwitchDevices >> buildResultMorphFrom: aDevice [
	|  deviceButton |
	
	deviceButton := SimpleButtonMorph new
		color: SPOCStyle spotifyGray;
		morphicLayerNumber: SPOCSwitchDevices baseLayer;
		label: 'Name: ', aDevice name, ' || Type: ', aDevice type;
		extent: ((SPOCSwitchDevices buttonWidth * 2)@SPOCSwitchDevices buttonHeight);
    		target: self;
    		actionSelector: #switchDeviceClicked.
		"TODO: switchDeviceClicked method"
	aDevice isActive 
		ifTrue: [deviceButton color: SPOCStyle spotifyGreen.
			activeDevice := aDevice].
	^ Morph new
		addMorph: deviceButton;
		vResizing: #shrinkWrap; 
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 5/25/2024 21:00'
}
SPOCSwitchDevices >> currentDevices [
	| dict apiEndpoint |
	
	dict := Dictionary new.
	apiEndpoint := SPOCApiDevices new.
	apiEndpoint authorizer: (Smalltalk at: #auth).
	self devices: (apiEndpoint execute: dict).
	self displayDevices: devices
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 20:03'
}
SPOCSwitchDevices >> devices [
	^ devices
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 20:03'
}
SPOCSwitchDevices >> devices: anObject [
	devices := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 20:03'
}
SPOCSwitchDevices >> devicesMorphs [
	^ devicesMorphs
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 20:03'
}
SPOCSwitchDevices >> devicesMorphs: anObject [
	devicesMorphs := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 5/27/2024 13:15'
}
SPOCSwitchDevices >> displayDevices: anOrderedCollection [
	| builder spec panel |
	
	self devicesMorphs isEmpty ifFalse: [self devicesMorphs removeAll].
	anOrderedCollection do: [ :device |
		self devicesMorphs add: (self buildResultMorphFrom: device)].
	
	builder := ToolBuilder default.
	spec := builder pluggableScrollPaneSpec new
		vScrollBarPolicy: #whenNeeded;
		hScrollBarPolicy: #whenNeeded;
		yourself.
	panel := builder build: spec.
	panel scroller
		layoutPolicy: TableLayout new;
		addAllMorphs: devicesMorphs.
		
	panel
		position: button bottomLeft;
		extent: (SPOCSwitchDevices buttonWidth * 2)@(SPOCSwitchDevices buttonHeight * 4);
		openInWorld
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 5/25/2024 20:30'
}
SPOCSwitchDevices >> initialize [
	super initialize.
	
	self
		devicesMorphs: OrderedCollection new;
		devices: OrderedCollection new;
		buildButton;
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 5/27/2024 14:14'
}
SPOCSwitchDevices >> switchDeviceClicked [
	"TODO"
]
