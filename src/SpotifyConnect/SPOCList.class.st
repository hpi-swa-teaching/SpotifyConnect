Class {
	#name : #SPOCList,
	#superclass : #ImageMorph,
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
	#category : #initialization,
	#'squeak_changestamp' : 'VK 5/27/2024 17:31'
}
SPOCList >> buildItemMorphsWith: aBlock [

	itemMorphs isEmpty ifFalse: [itemMorphs removeAll].
	items do: [ :item |
		itemMorphs add: (aBlock value: item)].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 5/27/2024 17:35'
}
SPOCList >> buildPanelAtPos: aPosition withExtent: anExtent [

	panel := builder build: spec.
	panel scroller
		layoutPolicy: TableLayout new;
		addAllMorphs: itemMorphs.
	panel
		position: aPosition;
		extent: anExtent;
		openInWorld
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 5/27/2024 18:07'
}
SPOCList >> initialize [
	
	builder := ToolBuilder default.
	spec := builder pluggableScrollPaneSpec new
		vScrollBarPolicy: #whenNeeded;
		hScrollBarPolicy: #whenNeeded;
		yourself.
	itemMorphs := OrderedCollection new
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 17:10'
}
SPOCList >> items [
	^ items
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 17:10'
}
SPOCList >> items: anOrderedCollection [
	items := anOrderedCollection
]
