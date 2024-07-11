"
A pluggable panel spec for the tool builder that uses the table layout.
"
Class {
	#name : #SPOCPluggableTablePanelSpec,
	#superclass : #PluggablePanelSpec,
	#instVars : [
		'tableLayoutProperties'
	],
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:29'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 7/11/2024 18:26'
}
SPOCPluggableTablePanelSpec class >> fullFrame [

	^ LayoutFrame new topFraction: 0;
		leftFraction: 0;
		rightFraction: 1;
		bottomFraction: 1
]

{
	#category : #building,
	#'squeak_changestamp' : 'TL 7/8/2024 20:11'
}
SPOCPluggableTablePanelSpec >> buildWith: aBuilder [
	
	| widget hResizing vResizing |
	hResizing := self tableLayoutProperties hResizing.
	vResizing := self tableLayoutProperties vResizing.
	widget := aBuilder buildPluggablePanel: self.
	widget layoutPolicy: TableLayout new;
		layoutProperties: self tableLayoutProperties.
	self frame
		ifNil: [self frame: self class fullFrame].
	aBuilder setFrame: self frame in: widget.
	widget hResizing: hResizing;
		 vResizing: vResizing.
	^ widget
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'TL 7/11/2024 18:08'
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
