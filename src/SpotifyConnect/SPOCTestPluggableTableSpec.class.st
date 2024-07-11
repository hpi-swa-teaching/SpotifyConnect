"
Tests correct layout with pluggable table spec.
"
Class {
	#name : #SPOCTestPluggableTableSpec,
	#superclass : #TestCase,
	#instVars : [
		'spec',
		'widget'
	],
	#category : #'SpotifyConnect-Tests',
	#'squeak_changestamp' : 'TL 7/11/2024 19:33'
}

{
	#category : #running,
	#'squeak_changestamp' : 'TL 7/11/2024 12:28'
}
SPOCTestPluggableTableSpec >> setUp [

	self spec: SPOCPluggableTablePanelSpec new.
	self widget: (self spec buildWith: (ToolBuilder default))
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:27'
}
SPOCTestPluggableTableSpec >> spec [

	^ spec
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:27'
}
SPOCTestPluggableTableSpec >> spec: anObject [

	spec := anObject
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:28'
}
SPOCTestPluggableTableSpec >> testBuild [
	
	self assert: self widget class = PluggablePanelMorph
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:30'
}
SPOCTestPluggableTableSpec >> testDefaultWidgetResizing [

	self assert: self widget hResizing = #rigid.
	self assert: self widget vResizing = #rigid
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:29'
}
SPOCTestPluggableTableSpec >> testFullFrame [

	| frame |
	frame := SPOCPluggableTablePanelSpec fullFrame.
	self assert: frame class = LayoutFrame.
	self assert: frame topFraction = 0.
	self assert: frame leftFraction = 0.
	self assert: frame rightFraction = 1.
	self assert: frame bottomFraction = 1
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:29'
}
SPOCTestPluggableTableSpec >> testTableLayout [
	
	self assert: self widget layoutPolicy class = TableLayout
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:35'
}
SPOCTestPluggableTableSpec >> testWidgetResizing [

	self spec: (SPOCPluggableTablePanelSpec new tableLayoutProperties: (TableLayoutProperties new hResizing: #spaceFill;
				 vResizing: #shrinkWrap;
				 yourself);
			 yourself);
		widget: (self spec buildWith: ToolBuilder default).
	self assert: self widget hResizing = #spaceFill.
	self assert: self widget vResizing = #shrinkWrap
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:27'
}
SPOCTestPluggableTableSpec >> widget [

	^ widget
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/11/2024 12:27'
}
SPOCTestPluggableTableSpec >> widget: anObject [

	widget := anObject
]
