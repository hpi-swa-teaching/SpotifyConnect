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
	#'squeak_changestamp' : 'TL 7/11/2024 19:16'
}
SPOCSwitchDevice class >> devicesPanelExtent [

	^ self devicesPanelWidth @ self devicesPanelHeight
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
	#'squeak_changestamp' : 'TL 7/8/2024 17:51'
}
SPOCSwitchDevice class >> itemTextPadding [

	^ self devicesPanelPadding * self devicesPanelToItemRatio
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 7/8/2024 17:14'
}
SPOCSwitchDevice class >> textHeight [

	^ 30
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 7/11/2024 17:31'
}
SPOCSwitchDevice class >> textOffset [

	^ self itemTextPadding @ ((self itemTextPadding + self textHeight) negated)
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 7/8/2024 18:56'
}
SPOCSwitchDevice >> attachBackground [

	self itemBackground: RectangleMorph new.
	self itemBackground color: SPOCStyle spotifyGray;
		extent: (self class devicesPanelWidth @ (self class devicesPanelHeight * self class devicesPanelToItemRatio)).
	^ self itemBackground
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/11/2024 17:39'
}
SPOCSwitchDevice >> attachButton [

	| text |
	text := SPOCBoxedTextWithIcon newWithText: 'Devices'
			withIcon: self class devicesIconPath.
	self addMorph: (SPOCClickable newUsing: text
			onClick: [:anEvent | self buttonClicked])
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/11/2024 19:16'
}
SPOCSwitchDevice >> attachResultDisplay [

	self resultDisplay: (SPOCScrollablePanel newWithExtent: self class devicesPanelExtent).
	self resultDisplay position: self position + (0 @ self class devicesPanelPadding).
	self addMorph: self resultDisplay.
	self resultDisplay hide
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 7/8/2024 20:12'
}
SPOCSwitchDevice >> buildNameText: aDevice [

	| text |
	text := SPOCBoldText newAt: (self itemBackground topLeft + self class itemTextPadding) withText: aDevice name.
	aDevice isActive
		ifTrue: [text textColor: SPOCStyle spotifyGreen].
	^ text
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 7/11/2024 17:27'
}
SPOCSwitchDevice >> buildResultMorphFrom: aDevice [
	
	| resultMorph |
	resultMorph := Morph new color: Color transparent;
		addMorph: self attachBackground;
		addMorph: (self buildNameText: aDevice);
		addMorph: (self buildTypeText: aDevice);
		vResizing: #shrinkWrap; 
		yourself.
	^ (SPOCClickable newUsing: resultMorph 
			onClick: [:anEvent | self switchDeviceClicked: aDevice id])
		vResizing: #shrinkWrap
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 7/11/2024 17:31'
}
SPOCSwitchDevice >> buildTypeText: aDevice [

	| text |
	text := SPOCPlainText newAt: (self itemBackground bottomLeft + self class textOffset) withText: aDevice type.
	aDevice isActive
		ifTrue: [text textColor: SPOCStyle spotifyGreen].
	^ text
	
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 7/11/2024 17:37'
}
SPOCSwitchDevice >> buttonClicked [

	self resultDisplay visible
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
	#category : #initialization,
	#'squeak_changestamp' : 'VE 7/9/2024 11:11'
}
SPOCSwitchDevice >> initialize [

	super initialize.
	
	self color: Color transparent;
		deviceItems: OrderedCollection new;
		devices: OrderedCollection new;
		attachResultDisplay;
		attachButton;
		extendFully
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
	#'squeak_changestamp' : 'TL 7/11/2024 17:36'
}
SPOCSwitchDevice >> switchDeviceClicked: aDevice [
	
	SPOCApiSwitchDevice new authorizer: self app auth;
		switchDeviceTo: aDevice.
	self app updatePlaybackState.
	self resultDisplay hide
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 7/11/2024 16:47'
}
SPOCSwitchDevice >> updateResultDisplay: anOrderedCollection [

	self deviceItems: (anOrderedCollection
			collect: [:aDevice | self buildResultMorphFrom: aDevice]).
	self resultDisplay updatePanel: self deviceItems;
		show
]
