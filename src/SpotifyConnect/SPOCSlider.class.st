Class {
	#name : #SPOCSlider,
	#superclass : #Morph,
	#instVars : [
		'value',
		'innerBarColor',
		'innerBarHoverColor',
		'onValueChanged'
	],
	#category : #'SpotifyConnect-UI'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 6/6/2024 20:37'
}
SPOCSlider class >> defaultBarHeight [

	^ 8
]

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 6/6/2024 21:15'
}
SPOCSlider class >> defaultBarWidth [
	
	^ SPOCSlider defaultLength - SPOCSlider defaultBarHeight
]

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 6/6/2024 20:35'
}
SPOCSlider class >> defaultColor [

	^ Color white
]

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 6/6/2024 21:14'
}
SPOCSlider class >> defaultLength [
	
	^ 200
]

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 6/6/2024 20:37'
}
SPOCSlider class >> defaultNobSize [

	^ 16
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 6/12/2024 03:32'
}
SPOCSlider >> align [

	self outerBar position: (self outerBar position + (self outerBarLeftCircle width / 2 @ (self nob height / 4))).
	self innerBar position: (self innerBar position + (self outerBarLeftCircle width / 2 @ (self nob height / 4))).
	self outerBarRightCircle position: (self outerBarRightCircle position + (self outerBar width @ (self nob height / 4))).
	self innerBarRightCircle position: (self innerBarRightCircle position + (self innerBar width @ (self nob height / 4))).
	self outerBarLeftCircle position: (self outerBarLeftCircle position + (0 @ (self nob height / 4))).
	self nob position: (self position + (self outerBar width / 2 @ 0))
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/12/2024 03:32'
}
SPOCSlider >> attachInnerBar [

	self addMorph: (self circleMorph name: 'inner-right-circle';
			eventHandler: self mouseEventHandler;
			yourself);
		addMorph: (Morph new extent: SPOCSlider defaultBarWidth @ SPOCSlider defaultBarHeight;
			 name: 'inner-bar';
			 eventHandler: self mouseEventHandler;
			 yourself)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/12/2024 03:32'
}
SPOCSlider >> attachNob [

	self addMorph: (self circleMorph extent: SPOCSlider defaultNobSize asPoint;
			 name: 'nob';
			 eventHandler: self mouseEventHandler;
			 hide;
			 yourself)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/12/2024 03:32'
}
SPOCSlider >> attachOuterBar [

	self addMorph: (self circleMorph name: 'outer-left-circle';
			 eventHandler: self mouseEventHandler;
			 yourself);
		 addMorph: (self circleMorph name: 'outer-right-circle';
			 eventHandler: self mouseEventHandler;
			 yourself);
		 addMorph: (Morph new extent: SPOCSlider defaultBarWidth @ SPOCSlider defaultBarHeight;
			 eventHandler: self mouseEventHandler;
			 name: 'outer-bar';
			 yourself)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/12/2024 03:42'
}
SPOCSlider >> circleMorph [

	^ CircleMorph new
		extent: SPOCSlider defaultBarHeight asPoint;
		borderWidth: 0;
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/12/2024 03:32'
}
SPOCSlider >> initialize [

	super initialize.
		
	self color: Color transparent;
		attachOuterBar;
		attachInnerBar;
		attachNob;
		align;
		initializeColors;
		value: 50;
		updateExtent
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/10/2024 02:32'
}
SPOCSlider >> initializeColors [
		
	self outerBarColor: SPOCStyle spotifyGray;
		nobColor: SPOCStyle spotifyWhite;
		innerBarColor: SPOCStyle spotifyWhite;
		innerBarHoverColor: SPOCStyle spotifyGreen
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/6/2024 20:39'
}
SPOCSlider >> innerBar [
	
	^ self submorphNamed: 'inner-bar'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/12/2024 03:32'
}
SPOCSlider >> innerBarColor [

	^ innerBarColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/6/2024 21:39'
}
SPOCSlider >> innerBarColor: aColor [

	innerBarColor := aColor.
	self innerBar color: self innerBarColor.
	self innerBarRightCircle color: self innerBarColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/6/2024 21:07'
}
SPOCSlider >> innerBarHoverColor [
	
	^ innerBarHoverColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/6/2024 21:07'
}
SPOCSlider >> innerBarHoverColor: aColor [

	innerBarHoverColor := aColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/6/2024 21:36'
}
SPOCSlider >> innerBarRightCircle [
	
	^ self submorphNamed: 'inner-right-circle'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/6/2024 21:14'
}
SPOCSlider >> length [
	
	^ self outerBar width + self outerBarRightCircle width
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/10/2024 22:10'
}
SPOCSlider >> length: aNumber [
	
	self outerBar width: (aNumber - self outerBarRightCircle width).
	self outerBarRightCircle position: (self topLeft + (self outerBar width @ (self nob height / 4))).
	self updateInnerBar;
		updateExtent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VE 6/6/2024 22:26'
}
SPOCSlider >> mouseEventHandler [

	^ EventHandler new
		on: #mouseEnter send: #onHoverStart to: self;
		on: #mouseLeave send: #onHoverEnd to: self;
		on: #mouseUp send: #onMouseUp: to: self;
		on: #mouseMove send: #onMouseMove: to: self;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/6/2024 20:39'
}
SPOCSlider >> nob [

	^ self submorphNamed: 'nob'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/6/2024 21:09'
}
SPOCSlider >> nobColor: aColor [
	
	self nob color: aColor
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VE 6/6/2024 21:34'
}
SPOCSlider >> onHoverEnd [

	self innerBar color: self innerBarColor.
	self updateOuterBarLeftCircleColorIfNecessary: self innerBarColor.
	self nob hide
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VE 6/6/2024 21:34'
}
SPOCSlider >> onHoverStart [
	
	self innerBar color: self innerBarHoverColor.
	self updateOuterBarLeftCircleColorIfNecessary: self innerBarHoverColor.
	self nob show
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VE 6/6/2024 22:25'
}
SPOCSlider >> onMouseMove: anEvent [
	
	| x diff |
	x := anEvent position x.
	diff := x - self position x.
	self updateValue: diff.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TL 6/12/2024 03:43'
}
SPOCSlider >> onMouseUp: anEvent [
	
	| x diff |
	x := anEvent position x.
	diff := x - self position x.
	self updateValue: diff.
	self onValueChanged ifNotNil: [self onValueChanged value: value]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/12/2024 03:33'
}
SPOCSlider >> onValueChanged [

	^ onValueChanged
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/12/2024 03:33'
}
SPOCSlider >> onValueChanged: anObject [

	onValueChanged := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/6/2024 20:39'
}
SPOCSlider >> outerBar [
	
	^ self submorphNamed: 'outer-bar'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/12/2024 03:34'
}
SPOCSlider >> outerBarColor: aColor [

	self outerBarLeftCircle color: aColor.
	self outerBarRightCircle color: aColor.
	self outerBar color: aColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/6/2024 20:40'
}
SPOCSlider >> outerBarLeftCircle [
	
	^ self submorphNamed: 'outer-left-circle'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/6/2024 20:40'
}
SPOCSlider >> outerBarRightCircle [
	
	^ self submorphNamed: 'outer-right-circle'
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 6/12/2024 03:35'
}
SPOCSlider >> threshold [

	^ self outerBarLeftCircle height / self length * 100
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 6/10/2024 22:11'
}
SPOCSlider >> updateExtent [

	self extent: (self outerBar width + (self outerBarLeftCircle width * 1.5) @ self nob height)
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 6/12/2024 03:34'
}
SPOCSlider >> updateInnerBar [
	
	| width |
	width := self value / 100 * self length - (self nob width / 4).
	self innerBar width: width.
	self innerBarRightCircle position: (self outerBarLeftCircle position + (width @ 0)).
	self nob position: (self outerBarLeftCircle position x @ self nob position y + (width @ 0)).
	self updateOuterBarLeftCircleColor;
		updateInnerBarRightCircleVisibilityIfNecessary
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 6/12/2024 03:35'
}
SPOCSlider >> updateInnerBarRightCircleVisibilityIfNecessary [
	
	self value < self threshold
		ifTrue: [self innerBarRightCircle hide]
		ifFalse: [self innerBarRightCircle show]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 6/12/2024 03:35'
}
SPOCSlider >> updateOuterBarLeftCircleColor [
	
	self innerBar width > self threshold
		ifTrue: [self outerBarLeftCircle color: self innerBar color]
		ifFalse: [self outerBarLeftCircle color: self outerBar color]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 6/12/2024 03:36'
}
SPOCSlider >> updateOuterBarLeftCircleColorIfNecessary: aColor [
	
	self innerBar width > self threshold
		ifTrue: [self outerBarLeftCircle color: aColor]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TL 6/12/2024 03:44'
}
SPOCSlider >> updateValue: aWidth [

	value := ((aWidth * 100 // self length) min: 100 max: 0).
	self value: value
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/12/2024 03:36'
}
SPOCSlider >> value [

	^ value
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/6/2024 22:19'
}
SPOCSlider >> value: anInteger [

	value := anInteger.
	self updateInnerBar
]
