Class {
	#name : #SPOCBoldText,
	#superclass : #SPOCText,
	#category : #'SpotifyConnect-UI'
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
	#'squeak_changestamp' : 'VE 6/10/2024 21:53'
}
SPOCBoldText >> initialize [
	super initialize.
	
]
