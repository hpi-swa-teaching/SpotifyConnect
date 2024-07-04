"
A text in a bounding box morph with rounded sides.
"
Class {
	#name : #SPOCBoxedText,
	#superclass : #Morph,
	#instVars : [
		'label',
		'content',
		'contents'
	],
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:29'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/10/2024 05:10'
}
SPOCBoxedText class >> defaultContent [

	^ 'SPOCBoxedText'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/10/2024 05:10'
}
SPOCBoxedText class >> height [

	^ 32
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/10/2024 05:10'
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
	#'squeak_changestamp' : 'VE 6/6/2024 20:37'
}
SPOCBoxedText >> attachLeftBorderCircle [
	| tmp |
	tmp := self circleMorph.
	tmp name: 'left'.
	self addMorph: tmp.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/6/2024 20:37'
}
SPOCBoxedText >> attachRightBorderCircle [
	| tmp |
	tmp := self circleMorph.
	tmp name: 'right'.
	self addMorph: tmp.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/10/2024 21:55'
}
SPOCBoxedText >> attachText [

	self label: SPOCPlainText new.
	self label contents: 'SPOCBoxedText';
		color: SPOCStyle spotifyBlack.
	self addMorph: self label.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/27/2024 20:30'
}
SPOCBoxedText >> centerBox [
	^ self submorphNamed: 'center'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/6/2024 20:37'
}
SPOCBoxedText >> circleMorph [
	| circle |
	circle := CircleMorph new.
	circle extent: SPOCBoxedText height asPoint;
		borderWidth: 0.
	^ circle
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
	#'squeak_changestamp' : 'TL 6/23/2024 16:45'
}
SPOCBoxedText >> content [

	^ content
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 16:45'
}
SPOCBoxedText >> contents [

	^ self label contents
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 6/10/2024 21:54'
}
SPOCBoxedText >> contents: aString [

	self label contents: aString.
	self updateAlignments.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/10/2024 21:54'
}
SPOCBoxedText >> initialize [
	super initialize.
	
	self attachLeftBorderCircle; 
		attachRightBorderCircle; 
		attachCenterBox;
		attachText;
		contents: SPOCBoxedText defaultContent;
		color: SPOCStyle spotifyWhite
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 16:46'
}
SPOCBoxedText >> label [

	^ label
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 16:46'
}
SPOCBoxedText >> label: anObject [

	label := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 16:46'
}
SPOCBoxedText >> leftBorderCircle [

	^ self submorphNamed: 'left'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 16:46'
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
