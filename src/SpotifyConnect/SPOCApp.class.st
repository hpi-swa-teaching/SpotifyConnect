Class {
	#name : #SPOCApp,
	#superclass : #Model,
	#instVars : [
		'auth'
	],
	#category : #SpotifyConnect
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/27/2024 16:15'
}
SPOCApp >> auth [
	^ auth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/27/2024 16:15'
}
SPOCApp >> auth: anObject [
	auth := anObject
]

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
	#'squeak_changestamp' : 'TL 5/27/2024 16:34'
}
SPOCApp >> initialize [

	| player |
	super initialize.
	
	self auth: SPOCAuthorizer new.
	auth startAuthorization.
	player := SPOCPlayer new
		app: self;
		openInWorld
	
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
