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
	#category : #running,
	#'squeak_changestamp' : 'TL 7/11/2024 12:17'
}
SPOCTestText >> setUp [

	self text: SPOCText new
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 18:03'
}
SPOCTestText >> testConstructor [
	
	| txt |
	txt := SPOCText newAt: 0 asPoint withText: 'Hello World'.
	self assert: txt class = SPOCText.
	self assert: txt position equals: 0 asPoint.
	self assert: txt contents equals: 'Hello World'
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
