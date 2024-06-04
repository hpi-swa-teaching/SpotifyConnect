Class {
	#name : #SPOCSwitchDevice,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'text',
		'devices',
		'devicesMorphs',
		'button',
		'activeDevice',
		'resultDisplay'
	],
	#category : #SpotifyConnect
}

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
	#'squeak_changestamp' : 'VK 6/3/2024 12:47'
}
SPOCSwitchDevice >> attachButton [

	self text: (SPOCBoxedText new contents: 'available Devices'; yourself);
		button: ( SPOCClickable newUsing: text onClick: [:anEvent | self currentDevices]);
		addMorph: self button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/3/2024 13:56'
}
SPOCSwitchDevice >> buildResultDisplay [

	resultDisplay := SPOCScrollablePanel new
		buildPanelAtPos: (self topLeft + (0@60)) withExtent: (300@500);
		hide.
	self addMorph: resultDisplay;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/3/2024 13:54'
}
SPOCSwitchDevice >> buildResultMorphFrom: aDevice [
	| background nameText typeText finishedMorph deviceButton border height ratio width |
	
	height := SPOCSearchbar searchbarHeight.
	width := SPOCSearchbar searchbarWidth.
	border := SPOCSearchbar resultBorder.
	ratio := SPOCSearchbar searchbarToResultRatio.
	
	background := RectangleMorph new
		color: SPOCStyle spotifyGray;
		extent: (width +  height@(ratio * height));
		morphicLayerNumber: SPOCSearchbar baseLayer.
	nameText := SPOCText newAt: (background topLeft + (border@0)) withText: aDevice name.
	typeText := SPOCText newAt: (background bottomLeft + (border@(SPOCText defaultHeight negated))) withText: aDevice type.
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
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/3/2024 13:04'
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
	#'squeak_changestamp' : 'VK 6/3/2024 12:58'
}
SPOCSwitchDevice >> hideResults [
	self resultDisplay hide
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
	#'squeak_changestamp' : 'VK 6/3/2024 14:30'
}
SPOCSwitchDevice >> switchDeviceClicked: aDevice [
	
	| apiEndpoint dict |
	dict := Dictionary new.
	dict at: #deviceID put: aDevice.
	apiEndpoint := SPOCApiSwitchDevice new.
	apiEndpoint authorizer: self app auth.
	apiEndpoint execute: dict.
	self currentDevices
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
	#'squeak_changestamp' : 'VK 6/3/2024 14:29'
}
SPOCSwitchDevice >> updateResultDisplay: anOrderedCollection [
	
	anOrderedCollection ifNil: [self hideResults.
		^ self].
	resultDisplay items: anOrderedCollection;
		buildItemMorphsWith: [:value | self buildResultMorphFrom: value];
		updatePanel;
		show;
		yourself.
	self extendFully
]
