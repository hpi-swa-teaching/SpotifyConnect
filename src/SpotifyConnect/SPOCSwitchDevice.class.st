Class {
	#name : #SPOCSwitchDevice,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'text',
		'devices',
		'button',
		'activeDevice',
		'resultDisplay',
		'deviceMorphs'
	],
	#category : #SpotifyConnect
}

{
	#category : #'class variables',
	#'squeak_changestamp' : 'VK 6/9/2024 15:19'
}
SPOCSwitchDevice class >> baseLayer [

	^ 500
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'VK 6/9/2024 18:38'
}
SPOCSwitchDevice class >> border [

	^ 30
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'VK 6/9/2024 15:22'
}
SPOCSwitchDevice class >> buttonToDeviceRatio [

	^ 2
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
	#'squeak_changestamp' : 'VK 6/9/2024 15:18'
}
SPOCSwitchDevice >> attachButton [

	self text: (SPOCBoxedText new contents: 'available Devices'; yourself).
	self button: ( SPOCClickable newUsing: text onClick: [:anEvent | self currentDevices]).
	self addMorph: self button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/9/2024 18:38'
}
SPOCSwitchDevice >> buildResultDisplay [

	self resultDisplay: (SPOCScrollablePanel newWithExtent: (2 * self buttonWidth) @ (5 * self buttonHeight)).
	self resultDisplay position: self position + (0@SPOCSwitchDevice border).
	self addMorph: self resultDisplay.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/9/2024 18:40'
}
SPOCSwitchDevice >> buildResultMorphFrom: aDevice [
	| background nameText typeText finishedMorph deviceButton border height ratio width |
	
	height := self buttonHeight.
	width := self buttonWidth.
	ratio := SPOCSwitchDevice buttonToDeviceRatio.
	border := SPOCSwitchDevice border.
	
	background := RectangleMorph new
		color: SPOCStyle spotifyGray;
		extent: (2 * width@(ratio * height));
		yourself.
	nameText := SPOCText newAt: (background topLeft + (border@0)) withText: aDevice name.
	typeText := SPOCText newAt: (background bottomLeft + (border@(SPOCStyle textHeight negated))) withText: aDevice type.
	aDevice isActive 
		ifTrue: [background color: SPOCStyle spotifyGreen.
			activeDevice := aDevice].
	finishedMorph := Morph new color: Color transparent;
		addMorph: background;
		addMorph: nameText;
		addMorph: typeText;
		vResizing: #shrinkWrap; 
		yourself.
	deviceButton := SPOCClickable newUsing: finishedMorph onClick: [:evt | self switchDeviceClicked: aDevice id].
	deviceButton vResizing: #shrinkWrap.
	^ deviceButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/3/2024 12:53'
}
SPOCSwitchDevice >> button [
	^ button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/3/2024 12:53'
}
SPOCSwitchDevice >> button: anObject [
	button := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/9/2024 15:17'
}
SPOCSwitchDevice >> buttonHeight [

	^ button extent y
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/9/2024 15:17'
}
SPOCSwitchDevice >> buttonWidth [

	^ button extent x
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/9/2024 17:59'
}
SPOCSwitchDevice >> currentDevices [

	| dict apiEndpoint |
	dict := Dictionary new.
	apiEndpoint := SPOCApiDevices new.
	apiEndpoint authorizer: self app auth.
	self devices: (apiEndpoint execute: dict).
	self updateResultDisplay: devices
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/9/2024 15:30'
}
SPOCSwitchDevice >> deviceMorphs [
	^ deviceMorphs
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/9/2024 15:30'
}
SPOCSwitchDevice >> deviceMorphs: anObject [
	deviceMorphs := anObject
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
	#'squeak_changestamp' : 'VK 6/9/2024 18:30'
}
SPOCSwitchDevice >> hideResults [
	self resultDisplay hide
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/9/2024 18:28'
}
SPOCSwitchDevice >> initialize [
	super initialize.
	
	self
		color: Color transparent;
		deviceMorphs: OrderedCollection new;
		devices: OrderedCollection new;
		attachButton;
		buildResultDisplay;
		hideResults;
		extendFully;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/3/2024 12:52'
}
SPOCSwitchDevice >> resultDisplay [
	^ resultDisplay
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/3/2024 12:52'
}
SPOCSwitchDevice >> resultDisplay: anObject [
	resultDisplay := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/9/2024 18:41'
}
SPOCSwitchDevice >> switchDeviceClicked: aDevice [
	
	| apiEndpoint dict res |
	dict := Dictionary new.
	dict at: #deviceID put: aDevice.
	apiEndpoint := SPOCApiSwitchDevice new.
	apiEndpoint authorizer: self app auth.
	res := apiEndpoint execute: dict.
	(res response = 204) ifTrue: self hideResults
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/3/2024 12:53'
}
SPOCSwitchDevice >> text [
	^ text
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/3/2024 12:53'
}
SPOCSwitchDevice >> text: anObject [
	text := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/9/2024 18:30'
}
SPOCSwitchDevice >> updateResultDisplay: anOrderedCollection [

	self deviceMorphs removeAll.
	anOrderedCollection do: [:device |
		self deviceMorphs add: (self buildResultMorphFrom: device)].
	self resultDisplay updatePanel: self deviceMorphs.
	self resultDisplay show.
	self extendFully
]
