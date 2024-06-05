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
	#'squeak_changestamp' : 'RK 6/6/2024 00:21'
}
SPOCScrollablePanel class >> newWithExtent: anExtent [
	^(SPOCScrollablePanel new extent: anExtent;
		buildPanel)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/6/2024 00:26'
}
SPOCScrollablePanel >> buildPanel [
	self builder: ToolBuilder default;
		spec: (builder pluggableScrollPaneSpec new
			vScrollBarPolicy: #whenNeeded;
			hScrollBarPolicy: #never;
			yourself);
			panel: (builder build: spec).
	self panel extent: self extent.
	self panel scroller layoutPolicy: TableLayout new.
	self addMorph: panel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/6/2024 00:26'
}
SPOCScrollablePanel >> builder [
	^ builder
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/6/2024 00:26'
}
SPOCScrollablePanel >> builder: anObject [
	builder := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/6/2024 00:27'
}
SPOCScrollablePanel >> initialize [
	
	super initialize.
	
	self color: Color transparent;
		items: OrderedCollection new;
		yourself.
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
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 23:43'
}
SPOCScrollablePanel >> panel [
	^ panel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 23:43'
}
SPOCScrollablePanel >> panel: anObject [
	panel := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/6/2024 00:27'
}
SPOCScrollablePanel >> spec [
	^ spec
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/6/2024 00:27'
}
SPOCScrollablePanel >> spec: anObject [
	spec := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/5/2024 22:40'
}
SPOCScrollablePanel >> updatePanel: anOrderedCollection [
	
	self items: anOrderedCollection.
	panel scroller removeAllMorphs.
	panel scroller addAllMorphs: items
]
