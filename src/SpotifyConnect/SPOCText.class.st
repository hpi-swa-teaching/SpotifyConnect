Class {
	#name : #SPOCText,
	#superclass : #Morph,
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'RK 5/18/2024 00:10'
}
SPOCText class >> newAt: aPoint withText: aString [
	^ SPOCText new
		position: aPoint;
		contents: aString;
		backgroundColor: SPOCStyle spotifyGray;
		textColor: SPOCStyle spotifyWhite;
		yourself
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 5/21/2024 23:40'
}
SPOCText >> handlesMouseDown: anEvent [
	^ false
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 5/21/2024 23:38'
}
SPOCText >> initialize [
	
	super initialize.
	
	self morphicLayerNumber: 1
]
