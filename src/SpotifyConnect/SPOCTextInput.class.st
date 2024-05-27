Class {
	#name : #SPOCTextInput,
	#superclass : #SPOCText,
	#instVars : [
		'lastEvt'
	],
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/18/2024 14:34'
}
SPOCTextInput class >> newAt: aPoint withText: aString [
	^ SPOCTextInput new
		position: aPoint;
		contents: aString;
		backgroundColor: SPOCStyle spotifyGray;
		textColor: SPOCStyle spotifyWhite;
		yourself
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 5/21/2024 20:16'
}
SPOCTextInput >> handleEnterPressed [
	
	(lastEvt hand keyboardFocus ~~ self) ifTrue: [
			self owner searchTracks: text.
			lastEvt hand releaseKeyboardFocus: self]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 5/18/2024 00:46'
}
SPOCTextInput >> handlesKeyboard: anEvent [
	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 5/21/2024 23:40'
}
SPOCTextInput >> handlesMouseDown: anEvent [
	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 5/21/2024 23:38'
}
SPOCTextInput >> initialize [
	
	super initialize.
	
	self setProperty: #crAction toValue: [ self handleEnterPressed ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/18/2024 19:29'
}
SPOCTextInput >> keyStroke: evt [

	lastEvt := evt.
	super keyStroke: evt
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/18/2024 19:22'
}
SPOCTextInput >> lastEvt [
	^ lastEvt
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/18/2024 19:22'
}
SPOCTextInput >> lastEvt: anEvent [
	lastEvt := anEvent
]
