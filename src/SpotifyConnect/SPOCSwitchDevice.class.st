Class {
	#name : #SPOCSwitchDevice,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'devices',
		'resultDisplay',
		'deviceItems',
		'itemBackground'
	],
	#category : #'SpotifyConnect-UI'
}

{
	#category : #'class variables',
	#'squeak_changestamp' : 'VK 6/10/2024 19:44'
}
SPOCSwitchDevice class >> itemTextPadding [

	^ SPOCStyle devicesPanelPadding * SPOCStyle devicesPanelToItemRatio
]

{
	#category : #building,
	#'squeak_changestamp' : 'VK 6/10/2024 19:11'
}
SPOCSwitchDevice >> attachButton [

	| button |
	button := Morph new color: Color transparent.
	button addMorph: self  buttonText;
		addMorph: (SPOCIcon new iconAsset: '/assets/devices.png');
		yourself.
	self addMorph: (SPOCClickable newUsing: button onClick: [:anEvent | self currentDevices])
	
]

{
	#category : #building,
	#'squeak_changestamp' : 'VK 6/10/2024 19:53'
}
SPOCSwitchDevice >> buildBackground [

	self itemBackground: RectangleMorph new.
	self itemBackground color: SPOCStyle spotifyGray;
		extent: (SPOCStyle devicesPanelWidth@(SPOCStyle devicesPanelHeight * SPOCStyle devicesPanelToItemRatio));
		yourself.
	^ self itemBackground
]

{
	#category : #building,
	#'squeak_changestamp' : 'VK 6/10/2024 19:54'
}
SPOCSwitchDevice >> buildNameText: aDevice [

	| text |
	text := SPOCBoldText newAt: (self itemBackground topLeft + SPOCSwitchDevice itemTextPadding) withText: aDevice name.
	aDevice isActive
		ifTrue: [text textColor: SPOCStyle spotifyGreen].
	^ text
	
]

{
	#category : #building,
	#'squeak_changestamp' : 'VK 6/10/2024 16:59'
}
SPOCSwitchDevice >> buildResultDisplay [

	self resultDisplay: (SPOCScrollablePanel newWithExtent: (SPOCStyle devicesPanelWidth@SPOCStyle devicesPanelHeight)).
	self resultDisplay position: self position + (0@SPOCStyle devicesPanelPadding).
	self addMorph: self resultDisplay.
	self hideResults
]

{
	#category : #building,
	#'squeak_changestamp' : 'VK 6/10/2024 19:47'
}
SPOCSwitchDevice >> buildResultMorphFrom: aDevice [
	
	| finishedMorph deviceButton |
	finishedMorph := Morph new color: Color transparent;
		addMorph: self buildBackground;
		addMorph: (self buildNameText: aDevice);
		addMorph: (self buildTypeText: aDevice);
		vResizing: #shrinkWrap; 
		yourself.
	deviceButton := SPOCClickable newUsing: finishedMorph onClick: [:evt | self switchDeviceClicked: aDevice id].
	deviceButton vResizing: #shrinkWrap.
	^ deviceButton
]

{
	#category : #building,
	#'squeak_changestamp' : 'VK 6/10/2024 19:54'
}
SPOCSwitchDevice >> buildTypeText: aDevice [

	| text |
	text := SPOCPlainText newAt: (self itemBackground bottomLeft + (SPOCSwitchDevice itemTextPadding @ ((SPOCSwitchDevice itemTextPadding + SPOCStyle textHeight) negated))) withText: aDevice type.
	aDevice isActive
		ifTrue: [text textColor: SPOCStyle spotifyGreen].
	^ text
	
]

{
	#category : #building,
	#'squeak_changestamp' : 'VK 6/10/2024 19:10'
}
SPOCSwitchDevice >> buttonText [

	^ (SPOCBoxedText new contents: ' Devices';
		position: SPOCStyle devicesTextPadding@0;
		yourself).
]

{
	#category : #'api-call',
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
	#'squeak_changestamp' : 'VK 6/10/2024 19:35'
}
SPOCSwitchDevice >> deviceItems [
	^ deviceItems
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/10/2024 19:35'
}
SPOCSwitchDevice >> deviceItems: anObject [
	deviceItems := anObject
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
	#category : #updating,
	#'squeak_changestamp' : 'VK 6/9/2024 18:30'
}
SPOCSwitchDevice >> hideResults [
	self resultDisplay hide
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/10/2024 19:49'
}
SPOCSwitchDevice >> initialize [

	super initialize.
	
	self color: Color transparent;
		deviceItems: OrderedCollection new;
		devices: OrderedCollection new;
		attachButton;
		buildResultDisplay;
		extendFully;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/10/2024 19:53'
}
SPOCSwitchDevice >> itemBackground [
	^ itemBackground
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/10/2024 19:53'
}
SPOCSwitchDevice >> itemBackground: anObject [
	itemBackground := anObject
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
	#category : #'api-call',
	#'squeak_changestamp' : 'VK 6/10/2024 20:05'
}
SPOCSwitchDevice >> switchDeviceClicked: aDevice [
	
	| apiEndpoint dict res |
	dict := Dictionary new.
	dict at: #deviceID put: aDevice.
	apiEndpoint := SPOCApiSwitchDevice new.
	apiEndpoint authorizer: self app auth.
	res := apiEndpoint execute: dict.
	res response code = 204 
		ifTrue: [self hideResults]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VK 6/10/2024 19:50'
}
SPOCSwitchDevice >> updateResultDisplay: anOrderedCollection [

	self deviceItems removeAll.
	anOrderedCollection do: [:device |
		self deviceItems add: (self buildResultMorphFrom: device)].
	self resultDisplay updatePanel: self deviceItems.
	self resultDisplay show
]
