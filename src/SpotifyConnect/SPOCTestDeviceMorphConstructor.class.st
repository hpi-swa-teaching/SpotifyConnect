"
Tests decive mophs.
"
Class {
	#name : #SPOCTestDeviceMorphConstructor,
	#superclass : #TestCase,
	#instVars : [
		'device',
		'deviceMorph'
	],
	#category : #'SpotifyConnect-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:26'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 14:28'
}
SPOCTestDeviceMorphConstructor >> device [

	^ device
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 14:28'
}
SPOCTestDeviceMorphConstructor >> device: anObject [

	device := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 14:28'
}
SPOCTestDeviceMorphConstructor >> deviceMorph [

	^ deviceMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 14:28'
}
SPOCTestDeviceMorphConstructor >> deviceMorph: anObject [

	deviceMorph := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 7/11/2024 12:33'
}
SPOCTestDeviceMorphConstructor >> setUp [

	self device: (SPOCDevice new type: 'Smart Fridge';
			name: 'Samsung Fridge';
			isActive: true;
			yourself);
		deviceMorph: (SPOCSwitchDevice new buildResultMorphFrom: self device)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:31'
}
SPOCTestDeviceMorphConstructor >> testMorphClass [

	self assert: self deviceMorph class = SPOCClickable
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:32'
}
SPOCTestDeviceMorphConstructor >> testSubMorphs [

	| background finishedMorph nameText typeText |
	finishedMorph := self deviceMorph submorphs first.
	typeText := finishedMorph submorphs first.
	nameText := finishedMorph submorphs at: 2.
	background := finishedMorph submorphs at: 3.
	self assert: typeText text = 'Smart Fridge'.
	self assert: nameText text = 'Samsung Fridge'.
	self assert: nameText textColor = SPOCStyle spotifyGreen.
	self assert: background color = SPOCStyle spotifyGray
]
