Class {
	#name : #SPOCPlainText,
	#superclass : #SPOCText,
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'RK 5/18/2024 00:10'
}
SPOCPlainText class >> newAt: aPoint withText: aString [
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
SPOCPlainText >> handlesMouseDown: anEvent [
	^ false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VE 5/27/2024 21:15'
}
SPOCPlainText >> handlesMouseMove: anEvent [
	^ false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VE 5/27/2024 21:14'
}
SPOCPlainText >> handlesMouseOver: anEvent [
	^ false
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/27/2024 21:13'
}
SPOCPlainText >> initialize [
	
	super initialize
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VE 5/27/2024 21:16'
}
SPOCPlainText >> mouseDown: anEvent [
	^ nil
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VE 5/27/2024 21:16'
}
SPOCPlainText >> mouseEnter: anEvent [
	^ nil
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VE 5/27/2024 21:16'
}
SPOCPlainText >> mouseLeave: anEvent [
	^ nil
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VE 5/27/2024 21:16'
}
SPOCPlainText >> mouseMove: anEvent [
	^ nil
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VE 5/27/2024 21:16'
}
SPOCPlainText >> mouseUp: anEvent [
	^ nil
]
