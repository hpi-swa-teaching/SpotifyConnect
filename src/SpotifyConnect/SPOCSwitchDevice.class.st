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
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/10/2024 04:22'
}
SPOCSwitchDevice >> attachButton [

	self text: (SPOCBoxedText new
			contents: 'available devices';
			yourself);
		button: (SPOCClickable newUsing: self text onClick: [:anEvent | self currentDevices]);
		addMorph: self button
]

{
	#category : #building,
	#'squeak_changestamp' : 'TL 6/10/2024 04:24'
}
SPOCSwitchDevice >> buildResultDisplay [

	self resultDisplay: (SPOCScrollablePanel new
			buildPanelAtPos: (self topLeft + (0 @ 60)) withExtent: (300 @ 500);
			hide).
	self addMorph: self resultDisplay
]

{
	#category : #building,
	#'squeak_changestamp' : 'TL 6/10/2024 04:24'
}
SPOCSwitchDevice >> buildResultMorphFrom: aDevice [

	| background nameText typeText finishedMorph deviceButton border height ratio width |
	height := SPOCSearchbar searchbarHeight.
	width := SPOCSearchbar searchbarWidth.
	border := SPOCSearchbar resultBorder.
	ratio := SPOCSearchbar searchbarToResultRatio.	
	background := RectangleMorph new
		color: SPOCStyle spotifyGray;
		extent: (width +  height @ (ratio * height));
		morphicLayerNumber: SPOCSearchbar baseLayer.
	nameText := SPOCText newAt: (background topLeft + (border @ 0)) withText: aDevice name.
	typeText := SPOCText newAt: (background bottomLeft + (border @ (SPOCText defaultHeight negated))) withText: aDevice type.
	aDevice isActive 
		ifTrue: [background color: SPOCStyle spotifyGreen.
			self activeDevice: aDevice].
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
	#'squeak_changestamp' : 'TL 6/10/2024 04:23'
}
SPOCSwitchDevice >> button [

	^ button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:23'
}
SPOCSwitchDevice >> button: anObject [

	button := anObject
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 05:09'
}
SPOCSwitchDevice >> currentDevices [

	| apiEndpoint |
	apiEndpoint := SPOCApiDevices new
		authorizer: self app auth;
		yourself.
	self devices: (apiEndpoint execute: (Dictionary new)).
	self updateResultDisplay: self devices
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:23'
}
SPOCSwitchDevice >> deviceMorphs [

	^ devicesMorphs
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:23'
}
SPOCSwitchDevice >> deviceMorphs: anObject [

	devicesMorphs := anObject
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
	#'squeak_changestamp' : 'TL 6/10/2024 04:27'
}
SPOCSwitchDevice >> hideResults [

	self resultList hide
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/10/2024 04:25'
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
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 04:27'
}
SPOCSwitchDevice >> switchDeviceClicked: aDevice [
	
	| dict |
	dict := Dictionary new
		at: #deviceID put: aDevice;
		yourself.
	SPOCApiSwitchDevice new
		authorizer: self app auth;
		execute: dict;
		yourself.
	(Delay forMilliseconds: 1000) wait.
	self currentDevices
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:23'
}
SPOCSwitchDevice >> text [

	^ text
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:23'
}
SPOCSwitchDevice >> text: anObject [

	text := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/10/2024 04:27'
}
SPOCSwitchDevice >> updateResultDisplay: anOrderedCollection [
	
	anOrderedCollection
		ifNil: [self hideResults.
			^ self].
	self resultDisplay items: anOrderedCollection;
		buildItemMorphsWith: [:value | self buildResultMorphFrom: value];
		updatePanel;
		show;
		yourself.
	self extendFully
]
