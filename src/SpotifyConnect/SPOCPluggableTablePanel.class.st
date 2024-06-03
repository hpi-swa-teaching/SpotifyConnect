Class {
	#name : #SPOCPluggableTablePanel,
	#superclass : #PluggablePanelSpec,
	#instVars : [
		'tableLayoutProperties'
	],
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 5/30/2024 23:56'
}
SPOCPluggableTablePanel class >> fullFrame [
	^ LayoutFrame new topFraction: 0; leftFraction: 0; rightFraction: 1; bottomFraction: 1
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 5/30/2024 23:57'
}
SPOCPluggableTablePanel >> buildWith: aBuilder [
	
	| widget |
	widget := aBuilder buildPluggablePanel: self.
	widget layoutPolicy: TableLayout new;
		layoutProperties: self tableLayoutProperties.
	self frame: SPOCPluggableTablePanel fullFrame.
	aBuilder setFrame: self frame in: widget.
	widget submorphsDo: [:m | m class = PluggablePanelMorph ifFalse: [m hResizing: #rigid]].
	widget submorphsDo: [:m | m class = PluggablePanelMorph ifFalse: [m vResizing: #rigid]].
	^ widget.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/30/2024 23:04'
}
SPOCPluggableTablePanel >> initialize [
	super initialize.
	
	self tableLayoutProperties: TableLayoutProperties new
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/30/2024 22:59'
}
SPOCPluggableTablePanel >> tableLayoutProperties [
	^ tableLayoutProperties
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/30/2024 22:59'
}
SPOCPluggableTablePanel >> tableLayoutProperties: anObject [
	tableLayoutProperties := anObject
]
