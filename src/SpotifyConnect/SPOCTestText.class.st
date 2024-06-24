Class {
	#name : #SPOCTestText,
	#superclass : #TestCase,
	#instVars : [
		'text'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:36'
}
SPOCTestText >> setUp [
	text := SPOCText new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:41'
}
SPOCTestText >> testConstructor [
	
	| txt |
	txt := SPOCText newAt: 0 asPoint withText: 'Hello World'.
	self assert: (txt isKindOf: SPOCText).
	self assert: txt position equals: 0 asPoint.
	self assert: txt contents equals: 'Hello World'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:40'
}
SPOCTestText >> testMouseEventHandling [
	
	self assert: ((text handlesMouseOver: nil) = false).
	self assert: ((text handlesMouseMove: nil) = false).
	self assert: ((text handlesMouseDown: nil) = false).
	self assert: ((text mouseDown: nil) = nil).
	self assert: ((text mouseEnter: nil) = nil).
	self assert: ((text mouseLeave: nil) = nil).
	self assert: ((text mouseMove: nil) = nil).
	self assert: ((text mouseUp: nil) = nil).
]
