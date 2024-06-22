Class {
	#name : #SPOCTestDeviceMorphConstructor,
	#superclass : #TestCase,
	#instVars : [
		'device',
		'deviceMorph'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'VK 6/22/2024 16:43'
}
SPOCTestDeviceMorphConstructor >> setUp [

	| switchDevice |
	switchDevice := SPOCSwitchDevice new.
	device := SPOCDevice new type: 'Smart Fridge';
		name: 'Samsung Fridge';
		isActive: true;
		yourself.
	deviceMorph := switchDevice buildResultMorphFrom: device.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'VK 6/22/2024 16:44'
}
SPOCTestDeviceMorphConstructor >> testMorphClass [

	self assert: (deviceMorph class = SPOCClickable)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'VK 6/22/2024 16:58'
}
SPOCTestDeviceMorphConstructor >> testSubMorphs [

	| finishedMorph background nameText typeText |
	finishedMorph := deviceMorph submorphs first.
	typeText := finishedMorph submorphs first.
	nameText := finishedMorph submorphs at: 2.
	background := finishedMorph submorphs at: 3.
	self assert: (background color = SPOCStyle spotifyGray).
	self assert: (nameText text = 'Samsung Fridge').
	self assert: (typeText text = 'Smart Fridge').
	self assert: (nameText textColor = SPOCStyle spotifyGreen)
]
