"
A scrollable panel holding items to display.
"
Class {
	#name : #SPOCScrollablePanel,
	#superclass : #Morph,
	#instVars : [
		'builder',
		'items',
		'spec',
		'panel'
	],
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:30'
}

{
	#category : #constructor,
	#'squeak_changestamp' : 'VE 6/10/2024 17:29'
}
SPOCScrollablePanel class >> newWithExtent: anExtent [
	
	| inst |
	inst := self new.
	inst extent: anExtent.
	inst panel extent: anExtent.
	^ inst
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 7/8/2024 19:25'
}
SPOCScrollablePanel >> buildPanel [

	self builder: ToolBuilder default;
		spec: (self builder pluggableScrollPaneSpec new
			vScrollBarPolicy: #whenNeeded;
			hScrollBarPolicy: #never;
			horizontalResizing: #spaceFill;
			verticalResizing: #spaceFill;
			yourself);
		panel: (self builder build: self spec).
	self panel scroller layoutPolicy: TableLayout new.
	self panel color: SPOCStyle spotifyBlack.
	self addMorph: self panel
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
	#'squeak_changestamp' : 'VE 6/10/2024 19:11'
}
SPOCScrollablePanel >> initialize [
	
	super initialize.
	
	self color: Color transparent;
		layoutPolicy: TableLayout new;
		items: OrderedCollection new;
		buildPanel
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
	#'squeak_changestamp' : 'TL 7/11/2024 14:28'
}
SPOCScrollablePanel >> updatePanel: anOrderedCollection [
	
	self items: anOrderedCollection.
	self panel scroller removeAllMorphs;
		addAllMorphs: self items
]
