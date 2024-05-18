Class {
	#name : #SPOCSearchbar,
	#superclass : #Morph,
	#instVars : [
		'inputField'
	],
	#category : #SpotifyConnect
}

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 5/18/2024 00:03'
}
SPOCSearchbar class >> baseLayer [
	^ 30
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 5/17/2024 10:59'
}
SPOCSearchbar class >> searchbarExtent [
	^ 500@50
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 5/17/2024 11:16'
}
SPOCSearchbar class >> searchbarPosition [
	^ 50@50
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/18/2024 00:55'
}
SPOCSearchbar >> buildComponents [
	| rectMorph |
	
	rectMorph := RectangleMorph new
		color: SPOCStyle spotifyGray;
		extent: SPOCSearchbar searchbarExtent;
		position: SPOCSearchbar searchbarPosition;
		morphicLayerNumber: SPOCSearchbar baseLayer.
	self inputField: (SPOCTextInput newAt: (SPOCSearchbar searchbarPosition + (10@10)) withText: 'Was möchtest du wiedergeben?');
		addMorph: rectMorph;
		addMorph: self inputField;
		openInWorld.
	Transcript showln: (self inputField) class
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 5/17/2024 11:06'
}
SPOCSearchbar >> initialize [
	super initialize.
	
	self buildComponents
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/17/2024 11:15'
}
SPOCSearchbar >> inputField [
	^ inputField
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/18/2024 00:51'
}
SPOCSearchbar >> inputField: aSPOCTextInput [
	inputField := aSPOCTextInput
]
