Class {
	#name : #SPOCScrollablePanel,
	#superclass : #Morph,
	#instVars : [
		'items',
		'builder',
		'spec',
		'panel',
		'itemMorphs'
	],
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/1/2024 14:08'
}
SPOCScrollablePanel >> buildItemMorphsWith: aBlock [

	itemMorphs isEmpty ifFalse: [itemMorphs removeAll].
	items do: [ :item | itemMorphs add: (aBlock value: item)]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/1/2024 10:43'
}
SPOCScrollablePanel >> buildPanelAtPos: aPosition withExtent: anExtent [

	panel := builder build: spec.
	panel scroller
		layoutPolicy: TableLayout new;
		addAllMorphs: itemMorphs.
	panel
		position: aPosition;
		extent: anExtent.
	self addMorph: panel
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 5/31/2024 00:39'
}
SPOCScrollablePanel >> initialize [
	
	super initialize.
	
	self color: Color transparent.
	builder := ToolBuilder default.
	spec := builder pluggableScrollPaneSpec new
		vScrollBarPolicy: #whenNeeded;
		hScrollBarPolicy: #never;
		yourself.
	itemMorphs := OrderedCollection new
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
	#'squeak_changestamp' : 'RK 6/1/2024 15:25'
}
SPOCScrollablePanel >> updatePanel [
	panel scroller removeAllMorphs;
		addAllMorphs: itemMorphs
]
