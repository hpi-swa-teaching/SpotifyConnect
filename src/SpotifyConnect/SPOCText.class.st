Class {
	#name : #SPOCText,
	#superclass : #TextMorph,
	#category : #'SpotifyConnect-Utils'
}

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
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/6/2024 01:16'
}
SPOCText >> handlesMouseMove: anEvent [
	^ false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/6/2024 01:16'
}
SPOCText >> handlesMouseOver: anEvent [
	^ false
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/6/2024 01:11'
}
SPOCText >> initialize [
	
	super initialize
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/6/2024 01:16'
}
SPOCText >> mouseDown: anEvent [
	^ nil
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/6/2024 01:16'
}
SPOCText >> mouseEnter: anEvent [
	^ nil
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/6/2024 01:17'
}
SPOCText >> mouseLeave: anEvent [
	^ nil
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/6/2024 01:17'
}
SPOCText >> mouseMove: anEvent [
	^ nil
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/6/2024 01:17'
}
SPOCText >> mouseUp: anEvent [
	^ nil
]
