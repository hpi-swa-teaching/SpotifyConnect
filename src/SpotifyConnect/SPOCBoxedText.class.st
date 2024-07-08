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
	#'squeak_changestamp' : 'TL 7/8/2024 16:31'
}
SPOCBoxedText >> attachCenterBox [

	self addMorph: (Morph new name: 'center')

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/8/2024 16:31'
}
SPOCBoxedText >> attachLeftBorderCircle [

	self addMorph: (self circleMorph name: 'left')
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/8/2024 16:32'
}
SPOCBoxedText >> attachRightBorderCircle [
	
	self addMorph: (self circleMorph name: 'right')
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/8/2024 16:33'
}
SPOCBoxedText >> attachText [

	self label: SPOCPlainText new.
	self label contents: 'SPOCBoxedText';
		color: SPOCStyle spotifyBlack.
	self addMorph: self label
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/8/2024 16:30'
}
SPOCBoxedText >> centerBox [

	^ self submorphNamed: 'center'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/8/2024 16:34'
}
SPOCBoxedText >> circleMorph [

	^ CircleMorph new extent: SPOCBoxedText height asPoint;
		borderWidth: 0;
		yourself
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 7/8/2024 16:35'
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
	#'squeak_changestamp' : 'TL 7/8/2024 16:35'
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
	#'squeak_changestamp' : 'TL 7/8/2024 16:35'
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
	#'squeak_changestamp' : 'TL 7/8/2024 16:37'
}
SPOCBoxedText >> updateAlignments [

	self extent: (self label width + SPOCBoxedText horizontalSpacing + SPOCBoxedText height @ SPOCBoxedText height).
	self centerBox extent: (self label width + SPOCBoxedText horizontalSpacing @ SPOCBoxedText height);
		position: self topLeft + (SPOCBoxedText height / 2 @ 0).
	self label position: self topLeft  + (SPOCBoxedText height + SPOCBoxedText horizontalSpacing @ (SPOCBoxedText height - self label height) / 2).
	self rightBorderCircle position: self topRight - (SPOCBoxedText height  @ 0)
	
	
]
