Class {
	#name : #SPOCPlainText,
	#superclass : #SPOCText,
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #constructor,
	#'squeak_changestamp' : 'TL 6/10/2024 05:16'
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
