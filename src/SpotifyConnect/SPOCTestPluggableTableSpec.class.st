Class {
	#name : #SPOCTestPluggableTableSpec,
	#superclass : #TestCase,
	#instVars : [
		'widget',
		'spec'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:30'
}
SPOCTestPluggableTableSpec >> setUp [

	spec := SPOCPluggableTablePanelSpec new.
	widget := spec buildWith: (ToolBuilder default).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:30'
}
SPOCTestPluggableTableSpec >> testBuild [
	
	self assert: (widget isKindOf: PluggablePanelMorph)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:36'
}
SPOCTestPluggableTableSpec >> testDefaultLayout [
	
	self assert: (spec tableLayoutProperties isKindOf: TableLayoutProperties).
	self assert: (spec horizontalResizing = #shrinkWrap). 
	self assert: (spec verticalResizing = #shrinkWrap). 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:28'
}
SPOCTestPluggableTableSpec >> testFullFrame [

	| frame |
	frame := SPOCPluggableTablePanelSpec fullFrame.
	self assert: (frame isKindOf: LayoutFrame).
	self assert: (frame topFraction = 0).
	self assert: (frame leftFraction = 0).
	self assert: (frame rightFraction = 1).
	self assert: (frame bottomFraction = 1)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/20/2024 20:31'
}
SPOCTestPluggableTableSpec >> testTableLayout [
	
	self assert: (widget layoutPolicy isKindOf: TableLayout)
]
