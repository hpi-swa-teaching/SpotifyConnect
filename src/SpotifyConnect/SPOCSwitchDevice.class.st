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
	#'squeak_changestamp' : 'RK 6/9/2024 17:54'
}
SPOCSwitchDevice >> buildResultDisplay [

	self resultDisplay: (SPOCScrollablePanel newWithExtent: (2 * self buttonWidth) @ (5 * self buttonHeight)).
	self resultDisplay position: self position + (0@30).
	self addMorph: self resultDisplay.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/9/2024 18:07'
}
SPOCSwitchDevice >> buildResultMorphFrom: aDevice [
	| background nameText typeText finishedMorph deviceButton height ratio width |
	
	height := self buttonHeight.
	width := self buttonWidth.
	ratio := SPOCSwitchDevice buttonToDeviceRatio.
	
	background := RectangleMorph new
		color: SPOCStyle spotifyGray;
		extent: (width +  height@(ratio * height));
		yourself.
	nameText := SPOCText newAt: (background topLeft) withText: aDevice name.
	typeText := SPOCText newAt: (background bottomLeft + (0@(SPOCStyle textHeight negated))) withText: aDevice type.
	nameText color: Color transparent.
	typeText color: Color transparent.
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
	#'squeak_changestamp' : 'RK 6/4/2024 12:02'
}
SPOCSwitchDevice >> hideResults [
	self resultList hide
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/3/2024 13:00'
}
SPOCSwitchDevice >> initialize [
	super initialize.
	
	self
		color: Color transparent;
		deviceMorphs: OrderedCollection new;
		devices: OrderedCollection new;
		attachButton;
		buildResultDisplay;
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
	#'squeak_changestamp' : 'VK 6/9/2024 15:16'
}
SPOCSwitchDevice >> switchDeviceClicked: aDevice [
	
	| apiEndpoint dict res |
	dict := Dictionary new.
	dict at: #deviceID put: aDevice.
	apiEndpoint := SPOCApiSwitchDevice new.
	apiEndpoint authorizer: self app auth.
	res := apiEndpoint execute: dict.
	(res code = 204) ifTrue: self hideResults
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
	#'squeak_changestamp' : 'RK 6/9/2024 18:05'
}
SPOCSwitchDevice >> updateResultDisplay: anOrderedCollection [

	self deviceMorphs removeAll.
	anOrderedCollection do: [:device |
		self deviceMorphs add: (self buildResultMorphFrom: device)].
	self resultDisplay updatePanel: self deviceMorphs.
	self extendFully
]
