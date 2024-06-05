Class {
	#name : #SPOCPlainText,
	#superclass : #SPOCText,
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'RK 5/30/2024 23:00'
}
SPOCPlainText class >> newAt: aPoint withText: aString [
	^ SPOCText new
		position: aPoint;
		contents: aString;
		textColor: SPOCStyle spotifyWhite;
		yourself
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/27/2024 21:13'
}
SPOCPlainText >> initialize [
	
	super initialize
]
