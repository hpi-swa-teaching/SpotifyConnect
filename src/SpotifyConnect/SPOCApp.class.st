Class {
	#name : #SPOCApp,
	#superclass : #Model,
	#instVars : [
		'auth'
	],
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/28/2024 14:10'
}
SPOCApp >> buildMainPanel: aBuilder [
	^ aBuilder pluggablePanelSpec new
		model: self;
		children: #mainPanelContent;
		layout: #horizontal;
		spacing: 10;
		frame: (LayoutFrame new
			leftFraction: 0;
			topFraction: 0;
			rightFraction: 1;
			bottomFraction: 0.05);
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/28/2024 13:32'
}
SPOCApp >> buildWindow: aBuilder [
	^ aBuilder pluggableWindowSpec new 
		model: self;
		label: #windowTitle;
		children: {self buildMainPanel: aBuilder};
		yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/28/2024 13:34'
}
SPOCApp >> buildWith: aBuilder [
	^ aBuilder build: (self buildWindow: aBuilder)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 16:48'
}
SPOCApp >> initialize [
	super initialize.
	auth := SPOCAuthorizer new.
	Transcript showln: auth startAuthorization.
	"Copy url to browser and authenticate"
	"Now use access tokens with"
	"auth accessToken"
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/28/2024 13:40'
}
SPOCApp >> mainPanelContent [
	^ {SPOCBoxedText new. SPOCBoxedText new.}
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/28/2024 13:29'
}
SPOCApp >> open [
	^ ToolBuilder open: self
]
