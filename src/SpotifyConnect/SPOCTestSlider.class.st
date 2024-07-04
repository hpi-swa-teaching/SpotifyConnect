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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/23/2024 17:55'
}
SPOCTestSlider >> mockMouseEventAt: aPosition [

	^ MouseEvent new setType: nil position: aPosition buttons: nil hand: nil; 
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/23/2024 17:55'
}
SPOCTestSlider >> setUp [

	slider := SPOCSlider new
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:12'
}
SPOCTestSlider >> testChangeValue [

	slider value: 100.
	self assert: slider value = 100
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:13'
}
SPOCTestSlider >> testHoverColorChange [

	| color |
	color := slider innerBar color.
	slider onHoverStart.
	self assert: color ~= slider innerBar color.
	slider onHoverEnd.
	self assert: color = slider innerBar color

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:12'
}
SPOCTestSlider >> testInitialState [

	self assert: slider value = 50
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:14'
}
SPOCTestSlider >> testInnerBarCollor [

	slider innerBarColor: Color yellow.
	self assert: slider innerBar color equals: Color yellow.
	slider innerBarHoverColor: Color blue.
	self assert: slider innerBar color equals: Color yellow.
	slider onHoverStart.
	self assert: slider innerBar color equals: Color blue
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:13'
}
SPOCTestSlider >> testLengthChange [
	
	| value |
	value := slider value.
	slider length: 200.
	self assert: value = slider value
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/23/2024 17:56'
}
SPOCTestSlider >> testMouseMove [

	| value |
	value := slider value.
	slider onMouseMove: (self mockMouseEventAt: slider position x + 10 asPoint).
	self assert: slider value ~= value
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/23/2024 17:55'
}
SPOCTestSlider >> testValueChangedEvent [

	| tmp |
	tmp := nil.
	slider onValueChanged: [:aValue | tmp := aValue].
	slider value: 100.
	slider onMouseUp: (self mockMouseEventAt: 0 asPoint).
	self assert: tmp = 0
]
