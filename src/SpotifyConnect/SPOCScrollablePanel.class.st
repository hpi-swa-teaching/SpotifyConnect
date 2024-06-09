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
	#'squeak_changestamp' : 'RK 6/7/2024 11:09'
}
SPOCScrollablePanel class >> newWithExtent: anExtent [

	^(SPOCScrollablePanel new extent: anExtent;
		buildPanel)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/7/2024 11:09'
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
	#'squeak_changestamp' : 'RK 6/7/2024 11:09'
}
SPOCScrollablePanel >> builder [

	^ builder
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:10'
}
SPOCScrollablePanel >> builder: aBuilder [

	builder := aBuilder
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/7/2024 11:10'
}
SPOCScrollablePanel >> initialize [
	
	super initialize.
	self color: Color transparent;
		items: OrderedCollection new;
		yourself.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:10'
}
SPOCScrollablePanel >> items [

	^ items
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:10'
}
SPOCScrollablePanel >> items: anOrderedCollection [

	items := anOrderedCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:10'
}
SPOCScrollablePanel >> panel [

	^ panel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:10'
}
SPOCScrollablePanel >> panel: anObject [

	panel := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:10'
}
SPOCScrollablePanel >> spec [

	^ spec
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:10'
}
SPOCScrollablePanel >> spec: anObject [

	spec := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/9/2024 18:05'
}
SPOCScrollablePanel >> updatePanel: anOrderedCollection [
	
	self items: anOrderedCollection.
	panel scroller removeAllMorphs.
	panel scroller addAllMorphs: items
]
