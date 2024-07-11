"
A text in a bounding box morph with rounded sides.
"
Class {
	#name : #SPOCBoxedText,
	#superclass : #Morph,
	#instVars : [
		'label'
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
	#'squeak_changestamp' : 'TL 7/11/2024 18:54'
}
SPOCBoxedText >> attachText [

	self label: SPOCPlainText new;
		contents: 'SPOCBoxedText'.
	self label color: SPOCStyle spotifyBlack.
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
	#'squeak_changestamp' : 'TL 7/8/2024 20:10'
}
SPOCBoxedText >> circleMorph [

	^ CircleMorph new extent: self class height asPoint;
		borderWidth: 0;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/8/2024 17:16'
}
SPOCBoxedText >> color: aColor [

	super color: Color transparent.
	
	self centerBox color: aColor.
	self leftBorderCircle color: aColor.
	self rightBorderCircle color: aColor
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 7/11/2024 19:19'
}
SPOCBoxedText >> computeNewLabelPosition: aNumber [

	^ self class height + self class horizontalSpacing @ (self class height - aNumber) / 2
	
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 7/8/2024 17:16'
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
	#'squeak_changestamp' : 'TL 7/8/2024 20:10'
}
SPOCBoxedText >> initialize [

	super initialize.
	
	self attachLeftBorderCircle; 
		attachRightBorderCircle; 
		attachCenterBox;
		attachText;
		contents: self class defaultContent;
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
	#'squeak_changestamp' : 'TL 7/11/2024 18:04'
}
SPOCBoxedText >> updateCenterBoxExtent [

	self centerBox extent: (self label width + self class horizontalSpacing @ self class height);
		position: self topLeft + (self class height / 2 @ 0)
	
	
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
	#'squeak_changestamp' : 'TL 7/11/2024 19:19'
}
SPOCBoxedText >> updateLabelPosition [

	self label position: self topLeft + (self computeNewLabelPosition: self label height)
	
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 7/11/2024 18:05'
}
SPOCBoxedText >> updateRightBorderCirclePosition [

	self rightBorderCircle position: self topRight - (self class height @ 0)
	
	
]
