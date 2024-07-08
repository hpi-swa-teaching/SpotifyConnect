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
	#'squeak_changestamp' : 'VE 7/8/2024 17:14'
}
SPOCBoxedText class >> defaultContent [

	^ ''
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
	#'squeak_changestamp' : 'VE 7/8/2024 17:14'
}
SPOCBoxedText >> color: aColor [

	super color: Color transparent.
	self centerBox color: aColor.
	self leftBorderCircle color: aColor.
	self rightBorderCircle color: aColor
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
	#'squeak_changestamp' : 'VE 7/8/2024 17:14'
}
SPOCBoxedText >> contents: aString [

	self label contents: aString.
	self updateAlignments
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VK 7/7/2024 14:40'
}
SPOCBoxedText >> handlesMouseDown: anEvent [

	^ false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VK 7/7/2024 14:41'
}
SPOCBoxedText >> handlesMouseMove: anEvent [

	^ false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VK 7/7/2024 14:41'
}
SPOCBoxedText >> handlesMouseOver: anEvent [

	^ false
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
	#category : #'event handling',
	#'squeak_changestamp' : 'VK 7/7/2024 14:42'
}
SPOCBoxedText >> mouseDown: anEvent [

	^ nil
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VK 7/7/2024 14:45'
}
SPOCBoxedText >> mouseEnter: anEvent [

	^ nil
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VK 7/7/2024 14:44'
}
SPOCBoxedText >> mouseLeave: anEvent [

	^ nil
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VK 7/7/2024 14:44'
}
SPOCBoxedText >> mouseMove: anEvent [

	^ nil
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VK 7/7/2024 14:42'
}
SPOCBoxedText >> mouseUp: anEvent [

	^ nil
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
	#'squeak_changestamp' : 'VE 7/8/2024 16:49'
}
SPOCBoxedText >> updateAlignments [

	self updateExtent;
		updateCenterBoxExtent;
		updateLabelPosition;
		updateRightBorderCirclePosition
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 7/8/2024 16:49'
}
SPOCBoxedText >> updateCenterBoxExtent [

	self centerBox extent: (self label width + self class horizontalSpacing @ self class height).
	self centerBox position: self topLeft + (self class height / 2 @ 0)
	
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 7/8/2024 16:49'
}
SPOCBoxedText >> updateExtent [

	self extent: (self label width + self class horizontalSpacing + self class height @ self class height)
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 7/8/2024 16:50'
}
SPOCBoxedText >> updateLabelPosition [

	self label position: self topLeft  + (self class height + self class horizontalSpacing @ (self class height - self label height) / 2)
	
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 7/8/2024 16:48'
}
SPOCBoxedText >> updateRightBorderCirclePosition [

	self rightBorderCircle position: self topRight - (SPOCBoxedText height  @ 0)
	
	
]
