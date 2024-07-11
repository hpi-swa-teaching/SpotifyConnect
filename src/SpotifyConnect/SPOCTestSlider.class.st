"
Test the slider and its actions.
"
Class {
	#name : #SPOCTestSlider,
	#superclass : #TestCase,
	#instVars : [
		'slider'
	],
	#category : #'SpotifyConnect-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:27'
}

{
	#category : #testing,
	#'squeak_changestamp' : 'VE 6/23/2024 17:55'
}
SPOCTestSlider >> mockMouseEventAt: aPosition [

	^ MouseEvent new setType: nil position: aPosition buttons: nil hand: nil; 
		yourself
]

{
	#category : #running,
	#'squeak_changestamp' : 'TL 7/11/2024 12:16'
}
SPOCTestSlider >> setUp [

	self slider: SPOCSlider new
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:16'
}
SPOCTestSlider >> slider [

	^ slider
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:16'
}
SPOCTestSlider >> slider: anObject [

	slider := anObject
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:21'
}
SPOCTestSlider >> testChangeValue [

	self slider value: 100.
	self assert: self slider value = 100
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:21'
}
SPOCTestSlider >> testHoverColorChange [

	| color |
	color := self slider innerBar color.
	self slider onHoverStart.
	self assert: color ~= self slider innerBar color.
	self slider onHoverEnd.
	self assert: color = self slider innerBar color

]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:22'
}
SPOCTestSlider >> testInitialState [

	self assert: self slider value = 50
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:23'
}
SPOCTestSlider >> testInnerBarCollor [

	self slider innerBarColor: Color yellow.
	self assert: self slider innerBar color equals: Color yellow.
	self slider innerBarHoverColor: Color blue.
	self assert: self slider innerBar color equals: Color yellow.
	self slider onHoverStart.
	self assert: self slider innerBar color equals: Color blue
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:23'
}
SPOCTestSlider >> testLengthChange [
	
	| value |
	value := self slider value.
	self slider length: 200.
	self assert: value = self slider value
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:23'
}
SPOCTestSlider >> testMouseMove [

	| value |
	value := self slider value.
	self slider onMouseMove: (self mockMouseEventAt: self slider position x + 10 asPoint).
	self assert: self slider value ~= value
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:25'
}
SPOCTestSlider >> testValueChangedEvent [

	| value |
	value := nil.
	self slider onValueChanged: [:aValue | value := aValue];
		value: 100;
		onMouseUp: (self mockMouseEventAt: 0 asPoint).
	self assert: value = 0
]
