"
A textmorph with bold text
"
Class {
	#name : #SPOCBoldText,
	#superclass : #SPOCText,
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:09'
}

{
	#category : #constructor,
	#'squeak_changestamp' : 'VE 6/10/2024 18:09'
}
SPOCBoldText class >> newAt: aPoint withText: aString [

	^ SPOCText new
		position: aPoint;
		contents: (aString asText addAttribute: TextEmphasis bold);
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/10/2024 21:53'
}
SPOCBoldText >> contents: aString [

	super contents: (aString asText addAttribute: TextEmphasis bold)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 7/8/2024 20:04'
}
SPOCBoldText >> initialize [

	super initialize
	
]
