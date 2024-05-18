Class {
	#name : #SPOCTextInput,
	#superclass : #SPOCText,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/18/2024 00:56'
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/18/2024 01:05'
}
SPOCTextInput >> handleEnterPressed [
	Transcript showln: 'Enter gedrückt'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/18/2024 00:46'
}
SPOCTextInput >> handlesKeyboard: anEvent [
	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/18/2024 01:03'
}
SPOCTextInput >> keyStroke: anEvent [
	
	super keyStroke: anEvent.
	
	anEvent keyCharacter = Character cr ifTrue: [self handleEnterPressed]
]
