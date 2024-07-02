Class {
	#name : #SPOCSwitchDevice,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'deviceItems',
		'devices',
		'itemBackground',
		'resultDisplay'
	],
	#category : #'SpotifyConnect-UI'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/17/2024 20:23'
}
SPOCSwitchDevice class >> devicesIconPath [

	^ '/assets/devices.png'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'VK 6/10/2024 19:44'
}
SPOCSwitchDevice class >> itemTextPadding [

	^ SPOCStyle devicesPanelPadding * SPOCStyle devicesPanelToItemRatio
]

{
	#category : #building,
	#'squeak_changestamp' : 'VK 6/19/2024 16:31'
}
SPOCSwitchDevice >> attachButton [

	| button |
	button := SPOCBoxedTextWithIcon newWithText: ' Devices' withIcon: self class devicesIconPath.
	self addMorph: (SPOCClickable newUsing: button onClick: [:anEvent | self buttonClicked])
	
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
	#'squeak_changestamp' : 'TL 6/24/2024 03:41'
}
SPOCSwitchDevice >> buttonClicked [

	self isVisible
		ifTrue: [self resultDisplay hide]
		ifFalse: [self currentDevices]
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'VE 7/2/2024 18:55'
}
SPOCSwitchDevice >> currentDevices [

	| apiEndpoint |
	self isDisabled ifTrue: [self showPopUp. ^ self].
	apiEndpoint := SPOCApiDevices new
		authorizer: self app auth;
		yourself.
	self devices: (apiEndpoint getCurrentDevices).
	self updateResultDisplay: self devices
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/17/2024 20:21'
}
SPOCSwitchDevice >> deviceItems [

	^ deviceItems
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/17/2024 20:21'
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
	#'squeak_changestamp' : 'TL 6/17/2024 20:13'
}
SPOCSwitchDevice >> hideResults [

	self resultDisplay hide
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 7/1/2024 14:06'
}
SPOCSwitchDevice >> initialize [

	super initialize.
	
	self color: Color transparent;
		deviceItems: OrderedCollection new;
		devices: OrderedCollection new;
		buildResultDisplay;
		attachButton;
		extendFully;
		hResizing: #spaceFill;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'VK 6/17/2024 11:19'
}
SPOCSwitchDevice >> isVisible [

	^ self resultDisplay visible
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/17/2024 20:21'
}
SPOCSwitchDevice >> itemBackground [

	^ itemBackground
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/17/2024 20:21'
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
	#'squeak_changestamp' : 'VE 7/2/2024 19:05'
}
SPOCSwitchDevice >> switchDeviceClicked: aDevice [
	
	SPOCApiSwitchDevice new
		authorizer: self app auth;
		switchDeviceTo: aDevice.
	self app updatePlaybackState.
	self hideResults
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
