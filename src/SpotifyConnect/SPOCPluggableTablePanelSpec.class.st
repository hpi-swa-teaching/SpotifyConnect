Class {
	#name : #SPOCPluggableTablePanelSpec,
	#superclass : #PluggablePanelSpec,
	#instVars : [
		'tableLayoutProperties'
	],
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 6/3/2024 09:51'
}
SPOCPluggableTablePanelSpec class >> fullFrame [
	^ LayoutFrame new topFraction: 0; leftFraction: 0; rightFraction: 1; bottomFraction: 1
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 6/3/2024 10:32'
}
SPOCPluggableTablePanelSpec >> buildWith: aBuilder [
	
	| widget hResizing vResizing |
	widget := aBuilder buildPluggablePanel: self.
	hResizing := self tableLayoutProperties hResizing.
	vResizing := self tableLayoutProperties vResizing.
	widget layoutPolicy: TableLayout new;
		layoutProperties: self tableLayoutProperties.
	self frame ifNil: [self frame: SPOCPluggableTablePanelSpec fullFrame].
	aBuilder setFrame: self frame in: widget.
	widget hResizing: hResizing;
		 vResizing: vResizing.
	widget submorphsDo: [:m | m class = PluggablePanelMorph ifFalse: [m hResizing: #rigid]];
		 submorphsDo: [:m | m class = PluggablePanelMorph ifFalse: [m vResizing: #rigid]].
	^ widget.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/30/2024 23:04'
}
SPOCPluggableTablePanelSpec >> initialize [
	super initialize.
	
	self tableLayoutProperties: TableLayoutProperties new
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/30/2024 22:59'
}
SPOCPluggableTablePanelSpec >> tableLayoutProperties [
	^ tableLayoutProperties
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/30/2024 22:59'
}
SPOCPluggableTablePanelSpec >> tableLayoutProperties: anObject [
	tableLayoutProperties := anObject
]
