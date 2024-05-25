Class {
	#name : #SPOCSwitchDevices,
	#superclass : #RectangleMorph,
	#instVars : [
		'devices',
		'devicesMorphs',
		'button'
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
	#'squeak_changestamp' : 'VK 5/25/2024 20:45'
}
SPOCSwitchDevices >> buildButton [

	button := SimpleButtonMorph new.
    	button color: SPOCStyle spotifyGray.
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
	#'squeak_changestamp' : 'VK 5/25/2024 21:18'
}
SPOCSwitchDevices >> buildResultMorphFrom: aDevice [
	|  background deviceText  typeText |
	
	background := RectangleMorph new
		color: SPOCStyle spotifyGray;
		extent: (SPOCSwitchDevices buttonWidth@(2 *  SPOCSwitchDevices buttonHeight));
		morphicLayerNumber: SPOCSwitchDevices baseLayer.
	deviceText := SPOCText newAt: (background topLeft + ((SPOCSwitchDevices buttonHeight * 0.25)@0)) withText: aDevice name.
	typeText := SPOCText newAt: ((background bottomLeft + background topLeft) / 2 +  ((SPOCSwitchDevices buttonHeight * 0.25)@(self height negated * 0.5))) withText: (aDevice  type).
	^ Morph new
		addMorph: background;
		addMorph: deviceText;
		addMorph: typeText;
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
	#'squeak_changestamp' : 'VK 5/25/2024 21:08'
}
SPOCSwitchDevices >> displayDevices: anOrderedCollection [
	| builder spec panel |
	
	self devicesMorphs isEmpty ifFalse: [self devicesMorphs removeAll].
	anOrderedCollection do: [ :device |
		self devicesMorphs add: (self buildResultMorphFrom: device)].
	"To do: Implement action handling on trackMorphs
	self trackMorphs do: [ :trackMorph |
		trackMorph on: #mouseDown send: #chosen to: [trackMorph playTrack]]."
	
	builder := ToolBuilder default.
	spec := builder pluggableScrollPaneSpec new
		vScrollBarPolicy: #whenNeeded;
		hScrollBarPolicy: #never;
		yourself.
	panel := builder build: spec.
	panel scroller
		layoutPolicy: TableLayout new;
		addAllMorphs: devicesMorphs.
		
	panel
		position: button bottomLeft;
		extent: (SPOCSwitchDevices buttonWidth)@(SPOCSwitchDevices buttonHeight * 4);
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
