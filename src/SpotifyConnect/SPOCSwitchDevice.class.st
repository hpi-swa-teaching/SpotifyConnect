"
concrete class for the device switching button
"
Class {
	#name : #SPOCSwitchDevice,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'deviceItems',
		'devices',
		'itemBackground',
		'resultDisplay'
	],
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:14'
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
	#'squeak_changestamp' : 'TL 7/8/2024 17:00'
}
SPOCSwitchDevice class >> devicesPanelHeight [

	^ 200
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 7/8/2024 17:00'
}
SPOCSwitchDevice class >> devicesPanelPadding [

	^ 35
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 7/8/2024 17:01'
}
SPOCSwitchDevice class >> devicesPanelToItemRatio [

	^ 0.4
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 7/8/2024 17:01'
}
SPOCSwitchDevice class >> devicesPanelWidth [

	^ 300
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 7/8/2024 17:04'
}
SPOCSwitchDevice class >> itemTextPadding [

	^ self class devicesPanelPadding * self class devicesPanelToItemRatio
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 7/8/2024 17:14'
}
SPOCSwitchDevice class >> textHeight [

	^ 30
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 7/8/2024 17:24'
}
SPOCSwitchDevice >> attachButton [

	| text |
	text := SPOCBoxedTextWithIcon newWithText: 'Devices' withIcon: self class devicesIconPath.
	self addMorph: (SPOCClickable newUsing: text onClick: [:anEvent | self buttonClicked])
	
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 7/8/2024 17:54'
}
SPOCSwitchDevice >> attachResultDisplay [

	self resultDisplay: (SPOCScrollablePanel newWithExtent: (self class devicesPanelWidth @ self class devicesPanelHeight)).
	self resultDisplay position: self position + (0 @ self class devicesPanelPadding).
	self addMorph: self resultDisplay.
	self hideResults
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 7/8/2024 17:25'
}
SPOCSwitchDevice >> buildBackground [

	self itemBackground: RectangleMorph new.
	self itemBackground color: SPOCStyle spotifyGray;
		extent: (self class devicesPanelWidth @ (self class devicesPanelHeight * self class devicesPanelToItemRatio)).
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
	#'squeak_changestamp' : 'VE 7/8/2024 17:26'
}
SPOCSwitchDevice >> buildResultMorphFrom: aDevice [
	
	| resultMorph deviceButton |
	resultMorph := Morph new color: Color transparent;
		addMorph: self buildBackground;
		addMorph: (self buildNameText: aDevice);
		addMorph: (self buildTypeText: aDevice);
		vResizing: #shrinkWrap; 
		yourself.
	deviceButton := SPOCClickable newUsing: resultMorph onClick: [:evt | self switchDeviceClicked: aDevice id].
	deviceButton vResizing: #shrinkWrap.
	^ deviceButton
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 7/8/2024 17:31'
}
SPOCSwitchDevice >> buildTypeText: aDevice [

	| text textOffset |
	textOffset := (self class itemTextPadding @ ((self class itemTextPadding + self class textHeight) negated)).
	text := SPOCPlainText newAt: (self itemBackground bottomLeft + textOffset) withText: aDevice type.
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
	#'squeak_changestamp' : 'VE 7/8/2024 17:53'
}
SPOCSwitchDevice >> currentDevices [

	| apiEndpoint |
	self isDisabled ifTrue: [self showPopUp. ^ self].
	apiEndpoint := SPOCApiDevices new authorizer: self app auth.
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
	#'squeak_changestamp' : 'VE 7/8/2024 17:55'
}
SPOCSwitchDevice >> initialize [

	super initialize.
	
	self color: Color transparent;
		deviceItems: OrderedCollection new;
		devices: OrderedCollection new;
		attachResultDisplay;
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
