"
A textmorph with plain text.
"
Class {
	#name : #SPOCPlainText,
	#superclass : #SPOCText,
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'TL 7/11/2024 19:31'
}

{
	#category : #constructor,
	#'squeak_changestamp' : 'TL 7/11/2024 18:31'
}
SPOCPlainText class >> newAt: aPoint withText: aString [

	^ SPOCText new position: aPoint;
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
