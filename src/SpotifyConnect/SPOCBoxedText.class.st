Class {
	#name : #SPOCBoxedText,
	#superclass : #Morph,
	#instVars : [
		'text',
		'content'
	],
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/27/2024 20:09'
}
SPOCBoxedText class >> height [
	^ 32
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/27/2024 20:29'
}
SPOCBoxedText class >> horizontalSpacing [
	^ 10
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/27/2024 20:32'
}
SPOCBoxedText >> attachCenterBox [
	| tmp |
	tmp := Morph new.
	tmp name: 'center'.
	self addMorph: tmp

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/27/2024 20:32'
}
SPOCBoxedText >> attachLeftBorderCircle [
	| tmp |
	tmp := self borderCircleMorph.
	tmp name: 'left'.
	self addMorph: tmp.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/27/2024 20:32'
}
SPOCBoxedText >> attachRightBorderCircle [
	| tmp |
	tmp := self borderCircleMorph.
	tmp name: 'right'.
	self addMorph: tmp.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/27/2024 20:47'
}
SPOCBoxedText >> attachText [
	self text: TextMorph new.
	self text contents: 'SPOCBoxedText'.
	self addMorph: self text.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/27/2024 20:21'
}
SPOCBoxedText >> borderCircleMorph [
	| circle |
	circle := CircleMorph new.
	circle extent: SPOCBoxedText height asPoint;
		borderWidth: 0.
	^ circle
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/27/2024 20:30'
}
SPOCBoxedText >> centerBox [
	^ self submorphNamed: 'center'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/27/2024 20:33'
}
SPOCBoxedText >> color: aColor [
	super color: Color transparent.
	self centerBox color: aColor.
	self leftBorderCircle color: aColor.
	self rightBorderCircle color: aColor.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/27/2024 20:02'
}
SPOCBoxedText >> content [
	^ content
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/27/2024 20:14'
}
SPOCBoxedText >> content: aString [
	self text contents: aString.
	self updateAlignments.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/27/2024 20:34'
}
SPOCBoxedText >> initialize [
	super initialize.
	
	self attachLeftBorderCircle; 
		attachRightBorderCircle; 
		attachCenterBox;
		attachText;
		color: SPOCStyle spotifyWhite.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/27/2024 20:15'
}
SPOCBoxedText >> leftBorderCircle [
	^ self submorphNamed: 'left'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/27/2024 20:15'
}
SPOCBoxedText >> rightBorderCircle [
	^ self submorphNamed: 'right'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/27/2024 20:35'
}
SPOCBoxedText >> text [
	^ text
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/27/2024 20:03'
}
SPOCBoxedText >> text: anObject [
	text := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/27/2024 20:46'
}
SPOCBoxedText >> updateAlignments [
	self extent: (self text width + SPOCBoxedText horizontalSpacing + SPOCBoxedText height @ SPOCBoxedText height).
	self centerBox extent: (self text width + SPOCBoxedText horizontalSpacing @ SPOCBoxedText height).
	self centerBox position: self topLeft + (SPOCBoxedText height / 2 @ 0).
	self text position: self topLeft  + (SPOCBoxedText height + SPOCBoxedText horizontalSpacing @ (SPOCBoxedText height - self text height) / 2).
	self rightBorderCircle position: self topRight - (SPOCBoxedText height  @ 0).
	
	
]
