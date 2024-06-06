Class {
	#name : #SPOCSlider,
	#superclass : #Morph,
	#category : #'SpotifyConnect-Utils'
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
	#'squeak_changestamp' : 'VE 6/6/2024 20:32'
}
SPOCSlider class >> defaultBarWidth [
	
	^ 200
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
	#'squeak_changestamp' : 'VE 6/6/2024 20:37'
}
SPOCSlider class >> defaultNobSize [

	^ 16
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/6/2024 20:48'
}
SPOCSlider >> align [
	self outerBarLeftCircle position: (self position - (self outerBarLeftCircle width / 2 @ 0)).
	self innerBarLeftCircle position: (self position - (self innerBarLeftCircle width / 2 @ 0)).
	self outerBarRightCircle position: (self position + (self outerBar width - (self outerBarLeftCircle width / 2) @ 0)).
	self nob position: (self position + (self outerBar width / 2 @ (self nob height / 4 negated)))
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/6/2024 20:37'
}
SPOCSlider >> attachInnerBar [
	self addMorph: (self circleMorph name: 'inner-left-circle';
			 yourself);
		 addMorph: (Morph new extent: SPOCSlider defaultBarWidth @ SPOCSlider defaultBarHeight;
			 name: 'inner-bar';
			 yourself)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/6/2024 20:37'
}
SPOCSlider >> attachNob [
	self addMorph: (self circleMorph extent: SPOCSlider defaultNobSize asPoint;
			 name: 'nob';
			 yourself)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/6/2024 20:37'
}
SPOCSlider >> attachOuterBar [
	self addMorph: (self circleMorph name: 'outer-left-circle';
			 yourself);
		 addMorph: (self circleMorph name: 'outer-right-circle';
			 yourself);
		 addMorph: (Morph new extent: SPOCSlider defaultBarWidth @ SPOCSlider defaultBarHeight;
			 name: 'outer-bar';
			 yourself)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/6/2024 20:37'
}
SPOCSlider >> circleMorph [
	| circle |
	circle := CircleMorph new.
	circle extent: SPOCSlider defaultBarHeight asPoint;
		borderWidth: 0.
	^ circle
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/6/2024 20:49'
}
SPOCSlider >> extendFully [

	self extent: 0@0;
		extent: self fullBounds extent
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/6/2024 20:49'
}
SPOCSlider >> initialize [
	super initialize.
		
	self color: Color transparent;
		attachOuterBar;
		attachInnerBar;
		attachNob;
		align;
		updateExtent
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/6/2024 20:39'
}
SPOCSlider >> innerBar [
	
	^ self submorphNamed: 'inner-bar'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/6/2024 20:39'
}
SPOCSlider >> innerBarLeftCircle [
	
	^ self submorphNamed: 'inner-left-circle'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/6/2024 20:39'
}
SPOCSlider >> nob [

	^ self submorphNamed: 'nob'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/6/2024 20:39'
}
SPOCSlider >> outerBar [
	
	^ self submorphNamed: 'outer-bar'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/6/2024 20:40'
}
SPOCSlider >> outerBarLeftCircle [
	
	^ self submorphNamed: 'outer-left-circle'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/6/2024 20:40'
}
SPOCSlider >> outerBarRightCircle [
	
	^ self submorphNamed: 'outer-right-circle'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/6/2024 20:51'
}
SPOCSlider >> updateExtent [

	self extent: (self outerBar width + self innerBarLeftCircle width @ self nob height);
		position: (self position - (self nob height - self outerBar height)).
]
