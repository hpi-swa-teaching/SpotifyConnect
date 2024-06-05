Class {
	#name : #SPOCBoldText,
	#superclass : #SPOCText,
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/6/2024 01:23'
}
SPOCBoldText class >> newAt: aPoint withText: aString [

	^ SPOCText new
		position: aPoint;
		contents: (aString asText addAttribute: TextEmphasis bold);
		textColor: SPOCStyle spotifyWhite;
		yourself
]
