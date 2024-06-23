Class {
	#name : #SPOCPluggableTablePanelSpec,
	#superclass : #PluggablePanelSpec,
	#instVars : [
		'tableLayoutProperties'
	],
	#category : #'SpotifyConnect-UI'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/10/2024 05:12'
}
SPOCPluggableTablePanelSpec class >> fullFrame [

	^ LayoutFrame new
		topFraction: 0;
		leftFraction: 0;
		rightFraction: 1;
		bottomFraction: 1
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 6/23/2024 18:12'
}
SPOCPluggableTablePanelSpec >> buildWith: aBuilder [
	
	| widget hResizing vResizing |
	hResizing := self tableLayoutProperties hResizing.
	vResizing := self tableLayoutProperties vResizing.
	widget := aBuilder buildPluggablePanel: self.
	widget layoutPolicy: TableLayout new;
		layoutProperties: self tableLayoutProperties.
	self frame ifNil: [self frame: SPOCPluggableTablePanelSpec fullFrame].
	aBuilder setFrame: self frame in: widget.
	widget hResizing: hResizing;
		 vResizing: vResizing.
	^ widget.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/23/2024 20:46'
}
SPOCPluggableTablePanelSpec >> initialize [
	super initialize.
	
	self tableLayoutProperties: TableLayoutProperties new;
		horizontalResizing: #shrinkWrap;
		verticalResizing: #shrinkWrap
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
