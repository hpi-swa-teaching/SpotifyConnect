Class {
	#name : #SPOCBoxedText,
	#superclass : #Morph,
	#instVars : [
		'label',
		'content',
		'anObject',
		'contents'
	],
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/28/2024 13:28'
}
SPOCBoxedText class >> defaultContent [
	^ 'SPOCBoxedText'
]

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
	#'squeak_changestamp' : 'VE 5/27/2024 21:18'
}
SPOCBoxedText >> attachText [
	self label: SPOCPlainText new.
	self label contents: 'SPOCBoxedText'.
	self addMorph: self label.
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
	#category : #updating,
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
	#'squeak_changestamp' : 'VE 5/28/2024 13:27'
}
SPOCBoxedText >> contents [
	^ contents
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 5/28/2024 13:27'
}
SPOCBoxedText >> contents: aString [
	self label contents: aString.
	self updateAlignments.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/28/2024 13:28'
}
SPOCBoxedText >> initialize [
	super initialize.
	
	self attachLeftBorderCircle; 
		attachRightBorderCircle; 
		attachCenterBox;
		attachText;
		contents: SPOCBoxedText defaultContent;
		color: SPOCStyle spotifyWhite.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/27/2024 21:01'
}
SPOCBoxedText >> label [
	^ label
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/27/2024 21:01'
}
SPOCBoxedText >> label: anObject [
	label := anObject
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
	#category : #updating,
	#'squeak_changestamp' : 'VE 5/27/2024 21:11'
}
SPOCBoxedText >> updateAlignments [
	self extent: (self label width + SPOCBoxedText horizontalSpacing + SPOCBoxedText height @ SPOCBoxedText height).
	self centerBox extent: (self label width + SPOCBoxedText horizontalSpacing @ SPOCBoxedText height).
	self centerBox position: self topLeft + (SPOCBoxedText height / 2 @ 0).
	self label position: self topLeft  + (SPOCBoxedText height + SPOCBoxedText horizontalSpacing @ (SPOCBoxedText height - self label height) / 2).
	self rightBorderCircle position: self topRight - (SPOCBoxedText height  @ 0).
	
	
]
