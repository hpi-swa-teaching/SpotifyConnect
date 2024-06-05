Class {
	#name : #SPOCScrollablePanel,
	#superclass : #Morph,
	#instVars : [
		'items',
		'builder',
		'spec',
		'panel'
	],
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/5/2024 21:23'
}
SPOCScrollablePanel >> buildPanelAtPos: aPosition withExtent: anExtent [

	panel := builder build: spec.
	panel scroller layoutPolicy: TableLayout new.
	panel
		position: aPosition;
		extent: anExtent.
	self addMorph: panel
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/5/2024 22:34'
}
SPOCScrollablePanel >> initialize [
	
	super initialize.
	
	self color: Color transparent;
		items: OrderedCollection new;
		yourself.
	builder := ToolBuilder default.
	spec := builder pluggableScrollPaneSpec new
		vScrollBarPolicy: #whenNeeded;
		hScrollBarPolicy: #never;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 17:10'
}
SPOCScrollablePanel >> items [
	^ items
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 17:10'
}
SPOCScrollablePanel >> items: anOrderedCollection [
	items := anOrderedCollection
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/5/2024 21:23'
}
SPOCScrollablePanel >> updatePanel: anOrderedCollection [
	
	self items: anOrderedCollection.
	panel scroller removeAllMorphs;
		addAllMorphs: items;
		yourself
]
