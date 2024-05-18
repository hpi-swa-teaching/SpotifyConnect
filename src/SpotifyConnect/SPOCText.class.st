Class {
	#name : #SPOCText,
	#superclass : #TextMorph,
	#category : #SpotifyConnect
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
	#category : #initialization,
	#'squeak_changestamp' : 'RK 5/18/2024 00:08'
}
SPOCText >> initialize [
	
	super initialize.
	
	self morphicLayerNumber: 1
]
