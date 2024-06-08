Class {
	#name : #SPOCResultList,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'title',
		'titleMorph',
		'results',
		'items',
		'scrollablePanel'
	],
	#category : #SpotifyConnect
}

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/7/2024 11:00'
}
SPOCResultList >> buildResultList [

	self buildTitle;
		buildScrollablePanel;
		extendFully
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/7/2024 11:00'
}
SPOCResultList >> buildScrollablePanel [

	self scrollablePanel: (SPOCScrollablePanel newWithExtent: SPOCStyle resultListWidth@SPOCStyle resultListHeight).
	self scrollablePanel position: (self titleMorph bottomLeft + (0@SPOCStyle defaultMargin)).
	self addMorph: scrollablePanel
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/7/2024 10:18'
}
SPOCResultList >> buildTitle [
	
	self titleMorph: (SPOCBoldText newAt: self position withText: 'Welcome!');
		addMorph: self titleMorph;
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/7/2024 23:41'
}
SPOCResultList >> initialize [

	super initialize.
	
	self color: Color transparent;
		titleMorph: (SPOCBoldText newAt: self position withText: '');
		title: '';
		results: OrderedCollection new;
		items: OrderedCollection new;
		buildResultList;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:01'
}
SPOCResultList >> items [

	^ items
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:01'
}
SPOCResultList >> items: anOrderedCollection [

	items := anOrderedCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:01'
}
SPOCResultList >> results [

	^ results
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:01'
}
SPOCResultList >> results: anOrderedCollection [

	results := anOrderedCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:01'
}
SPOCResultList >> scrollablePanel [

	^ scrollablePanel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:01'
}
SPOCResultList >> scrollablePanel: aSPOCScrollablePanel [

	scrollablePanel := aSPOCScrollablePanel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:01'
}
SPOCResultList >> title [

	^ title
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 23:37'
}
SPOCResultList >> title: aString [

	title := aString.
	self updateTitle: self title
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:01'
}
SPOCResultList >> titleMorph [

	^ titleMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:01'
}
SPOCResultList >> titleMorph: aSPOCBoldText [

	titleMorph := aSPOCBoldText
]

{
	#category : #updating,
	#'squeak_changestamp' : 'RK 6/7/2024 11:23'
}
SPOCResultList >> updateItems [
	"To do: clickAction in SPOCTrack, SPOCAlbum etc. setzen und hier benutzen"
	
	items isEmpty ifFalse: [items removeAll].
	results do: [ :result |
		| item |
		item := SPOCClickable newUsing: (SPOCResultListItem newWith: result)
			onClick: [ :evt | self app player playSong: result id].
		item vResizing: #shrinkWrap.
		items add: item]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'RK 6/5/2024 01:08'
}
SPOCResultList >> updateResults: anOrderedCollection [
	
	self results: anOrderedCollection;
		updateItems;
		updateScrollablePanel;
		yourself
]

{
	#category : #updating,
	#'squeak_changestamp' : 'RK 6/7/2024 11:02'
}
SPOCResultList >> updateScrollablePanel [

	self scrollablePanel updatePanel: items
]

{
	#category : #updating,
	#'squeak_changestamp' : 'RK 6/7/2024 23:37'
}
SPOCResultList >> updateTitle: aString [

	self titleMorph contents: (title asText addAttribute: TextEmphasis bold)
]
