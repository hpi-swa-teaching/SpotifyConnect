"
A textmorph
"
Class {
	#name : #SPOCText,
	#superclass : #TextMorph,
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:09'
}

{
	#category : #constructor,
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
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
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCText >> handlesMouseDown: anEvent [

	^ false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCText >> handlesMouseMove: anEvent [

	^ false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCText >> handlesMouseOver: anEvent [

	^ false
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 7/9/2024 10:36'
}
SPOCText >> initialize [
	
	super initialize.

	self textColor: SPOCStyle spotifyWhite;
		lock
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCText >> mouseDown: anEvent [

	^ nil
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCText >> mouseEnter: anEvent [

	^ nil
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCText >> mouseLeave: anEvent [

	^ nil
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCText >> mouseMove: anEvent [

	^ nil
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCText >> mouseUp: anEvent [

	^ nil
]
