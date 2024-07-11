"
Test correct text morph handling.
"
Class {
	#name : #SPOCTestText,
	#superclass : #TestCase,
	#instVars : [
		'text'
	],
	#category : #'SpotifyConnect-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:27'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 7/11/2024 12:17'
}
SPOCTestText >> setUp [

	self text: SPOCText new
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:19'
}
SPOCTestText >> testConstructor [
	
	| text |
	text := SPOCText newAt: 0 asPoint withText: 'Hello World'.
	self assert: text class = SPOCText.
	self assert: text position equals: 0 asPoint.
	self assert: text contents equals: 'Hello World'
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 16:52'
}
SPOCTestText >> testMouseEventHandling [
	
	self assert: (self text handlesMouseOver: nil) not.
	self assert: (self text handlesMouseMove: nil) not.
	self assert: (self text handlesMouseDown: nil) not.
	self assert: (self text mouseDown: nil) isNil.
	self assert: (self text mouseEnter: nil) isNil.
	self assert: (self text mouseLeave: nil) isNil.
	self assert: (self text mouseMove: nil) isNil.
	self assert: (self text mouseUp: nil) isNil
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:17'
}
SPOCTestText >> text [

	^ text
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:17'
}
SPOCTestText >> text: anObject [

	text := anObject
]
