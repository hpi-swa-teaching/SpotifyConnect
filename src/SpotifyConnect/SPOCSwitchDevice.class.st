Class {
	#name : #SPOCSwitchDevice,
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
SPOCSwitchDevice class >> baseLayer [
	^500
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'VK 5/25/2024 20:28'
}
SPOCSwitchDevice class >> buttonHeight [
	^50
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'VK 5/25/2024 20:26'
}
SPOCSwitchDevice class >> buttonPosition [
	^ 100@500
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'VK 5/25/2024 20:28'
}
SPOCSwitchDevice class >> buttonWidth [
	^200
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 11:45'
}
SPOCSwitchDevice >> activeDevice [
	^ activeDevice
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 11:45'
}
SPOCSwitchDevice >> activeDevice: anObject [
	activeDevice := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 17:54'
}
SPOCSwitchDevice >> buildButton [

	button := SimpleButtonMorph new.
    	button color: SPOCStyle spotifyGreen.
    	button extent: (SPOCSwitchDevice buttonWidth @ SPOCSwitchDevice buttonHeight).
    	button position: SPOCSwitchDevice buttonPosition.
    	button morphicLayerNumber: SPOCSwitchDevice baseLayer.
    	button label: 'show devices'.
    	button target: self.
    	button actionSelector: #currentDevices.
    	button openInWorld.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 17:54'
}
SPOCSwitchDevice >> buildResultMorphFrom: aDevice [
	|  deviceButton |
	
	deviceButton := SimpleButtonMorph new
		color: SPOCStyle spotifyGray;
		morphicLayerNumber: SPOCSwitchDevice baseLayer;
		label: 'Name: ', aDevice name, ' || Type: ', aDevice type;
		extent: ((SPOCSwitchDevice buttonWidth * 2)@SPOCSwitchDevice buttonHeight);
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
	#'squeak_changestamp' : 'VK 5/27/2024 18:09'
}
SPOCSwitchDevice >> currentDevices [
	| dict apiEndpoint |
	
	dict := Dictionary new.
	apiEndpoint := SPOCApiDevices new.
	apiEndpoint authorizer: (Smalltalk at: #auth).
	self devices: (apiEndpoint execute: dict).
	self displayResults: devices
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 17:55'
}
SPOCSwitchDevice >> deviceMorphs [
	^ devicesMorphs
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 17:55'
}
SPOCSwitchDevice >> deviceMorphs: anObject [
	devicesMorphs := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 20:03'
}
SPOCSwitchDevice >> devices [
	^ devices
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 20:03'
}
SPOCSwitchDevice >> devices: anObject [
	devices := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 5/27/2024 18:09'
}
SPOCSwitchDevice >> displayResults: anOrderedCollection [
	| deviceList |
	
	deviceList := SPOCList new.
	deviceList items: anOrderedCollection.
	deviceList buildItemMorphsWith: [ :value | self buildResultMorphFrom: value].
	deviceList buildPanelAtPos: button bottomLeft withExtent: (SPOCSwitchDevice buttonWidth * 2)@(SPOCSwitchDevice buttonHeight * 4)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 5/27/2024 17:55'
}
SPOCSwitchDevice >> initialize [
	super initialize.
	
	self
		deviceMorphs: OrderedCollection new;
		devices: OrderedCollection new;
		buildButton;
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 5/27/2024 14:14'
}
SPOCSwitchDevice >> switchDeviceClicked [
	"TODO"
]
