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
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:22'
}
SPOCSwitchDevice >> activeDevice [

	^ activeDevice
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:22'
}
SPOCSwitchDevice >> activeDevice: anObject [

	activeDevice := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/10/2024 12:01'
}
SPOCSwitchDevice >> attachButton [

	| text icon button |
	text := (SPOCBoxedText new contents: ' available Devices';
		position: SPOCStyle devicesTextPadding@0;
		yourself).
	icon := SPOCIcon new iconAsset: '/assets/devices.png'.
	button := Morph new color: Color transparent.
	button addMorph: text;
		addMorph: icon;
		yourself.
	self addMorph: (SPOCClickable newUsing: button onClick: [:anEvent | self currentDevices])
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/10/2024 12:24'
}
SPOCSwitchDevice >> buildResultDisplay [

	self resultDisplay: (SPOCScrollablePanel newWithExtent: (SPOCStyle devicesPanelWidth@SPOCStyle devicesPanelHeight)).
	self resultDisplay position: self position + (0@SPOCStyle devicesPanelPadding).
	self addMorph: self resultDisplay.
	self hideResults.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/10/2024 11:44'
}
SPOCSwitchDevice >> buildResultMorphFrom: aDevice [
	| background nameText typeText finishedMorph deviceButton border ratio height width |
	
	height := SPOCStyle devicesPanelHeight.
	width := SPOCStyle devicesPanelWidth.
	border := SPOCStyle devicesPanelPadding.
	ratio := SPOCStyle devicesPanelToItemRatio.
	background := RectangleMorph new
		color: SPOCStyle spotifyGray;
		extent: (width@(height * ratio));
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
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/10/2024 12:10'
}
SPOCSwitchDevice >> currentDevices [

	| dict apiEndpoint |
	dict := Dictionary new.
	apiEndpoint := SPOCApiDevices new.
	apiEndpoint authorizer: self app auth.
	self devices: (apiEndpoint execute: dict).
	self updateResultDisplay: self devices
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
	#'squeak_changestamp' : 'TL 6/10/2024 04:23'
}
SPOCSwitchDevice >> devices [

	^ devices
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:23'
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
	#'squeak_changestamp' : 'VK 6/10/2024 14:05'
}
SPOCSwitchDevice >> initialize [

	super initialize.
	
	self color: Color transparent;
		deviceMorphs: OrderedCollection new;
		devices: OrderedCollection new;
		attachButton;
		buildResultDisplay;
		extendFully;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:23'
}
SPOCSwitchDevice >> resultDisplay [

	^ resultDisplay
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:23'
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
