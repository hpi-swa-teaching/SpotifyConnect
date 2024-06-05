Class {
	#name : #SPOCText,
	#superclass : #TextMorph,
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'RK 6/1/2024 15:38'
}
SPOCText class >> defaultHeight [
	^ 30
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'RK 6/5/2024 22:14'
}
SPOCText class >> newAt: aPoint withText: aString [
	^ SPOCText new
		position: aPoint;
		contents: aString;
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
	#'squeak_changestamp' : 'VE 5/27/2024 21:13'
}
SPOCText >> initialize [
	
	super initialize
]
