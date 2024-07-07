"
concrete class for the resultList 
"
Class {
	#name : #SPOCResultList,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'title',
		'titleMorph',
		'results',
		'items',
		'scrollablePanel',
		'playingOffset'
	],
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:12'
}

{
	#category : #updating,
	#'squeak_changestamp' : 'RK 7/7/2024 15:36'
}
SPOCResultList >> addHighlightAt: aNumber [

	(self items at: aNumber) wrappee togglePrimaryTextColor
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 6/10/2024 18:11'
}
SPOCResultList >> buildResultList [

	self buildScrollablePanel;
		buildTitle;
		extendFully
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 6/10/2024 19:09'
}
SPOCResultList >> buildScrollablePanel [

	self scrollablePanel: (SPOCScrollablePanel new
			hResizing: #spaceFill;
			vResizing: #spaceFill);
		addMorph: self scrollablePanel
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 6/10/2024 22:34'
}
SPOCResultList >> buildTitle [
	
	self titleMorph: (SPOCBoldText new 
			vResizing: #shrinkWrap; 
			hResizing: #spaceFill;
			yourself);
		title: 'Welcome!';
		addMorph: (Morph new color: Color transparent; extent: 1@15; yourself);
		addMorph: self titleMorph
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 7/7/2024 13:51'
}
SPOCResultList >> initialize [

	super initialize.
	
	self color: Color transparent;
		results: OrderedCollection new;
		items: OrderedCollection new;
		playingOffset: -1;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		listCentering: #topLeft;
		wrapCentering: #topLeft;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		buildResultList
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
	#category : #updating,
	#'squeak_changestamp' : 'VE 7/2/2024 19:14'
}
SPOCResultList >> needsActiveDevice [
	
	^ true
]

{
	#category : #updating,
	#'squeak_changestamp' : 'RK 7/7/2024 14:06'
}
SPOCResultList >> onItemClicked: anItem [
	
	(self isDisabled and: (anItem dataPiece isKindOf: SPOCTrack)) ifTrue: [self showPopUp. ^ self].
	self updateHighlightedTrackWithItem: anItem.
	anItem dataPiece onClick: self app
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 7/7/2024 13:47'
}
SPOCResultList >> playingOffset [

	^ playingOffset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 7/7/2024 13:47'
}
SPOCResultList >> playingOffset: aNumber [

	playingOffset := aNumber
]

{
	#category : #updating,
	#'squeak_changestamp' : 'RK 7/7/2024 14:47'
}
SPOCResultList >> removeHighlight [

	(self items at: playingOffset) wrappee togglePrimaryTextColor
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
	#'squeak_changestamp' : 'RK 7/7/2024 14:16'
}
SPOCResultList >> size [

	^ items size
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
	#'squeak_changestamp' : 'RK 7/7/2024 15:41'
}
SPOCResultList >> updateHighlightedTrackWithItem: anItem [
	"This method is used when a track was clicked on"

	((self playingOffset > 0) and: (self playingOffset <= self size))
		ifTrue: [(self items at: playingOffset) wrappee togglePrimaryTextColor].
	self playingOffset: anItem dataPiece offset.
	anItem togglePrimaryTextColor
]

{
	#category : #updating,
	#'squeak_changestamp' : 'RK 7/7/2024 16:54'
}
SPOCResultList >> updateHighlightedTrackWithOffset: aNumber [
	"This method is used when the currently playing track was changed by the player"
	
	| next |
	(self app searchbar filter = 'track')
		ifTrue: [^ self].
	next := playingOffset + aNumber.
	((self playingOffset > 0) and: (self playingOffset <= self size))
		ifTrue: [self removeHighlight].
	((next > 0) and: (next <= self size))
		ifTrue: [self addHighlightAt: next].
	self playingOffset: next
]

{
	#category : #updating,
	#'squeak_changestamp' : 'RK 7/7/2024 13:56'
}
SPOCResultList >> updateItems [
	
	self items isEmpty ifFalse: [self items removeAll].
	self playingOffset: -1.
	self results do: [:aResult |
		| item clickable |
		item := SPOCResultListItem newWith: aResult.
		clickable := SPOCClickable newUsing: item onClick: [:anEvent | self onItemClicked: item].
		clickable layoutPolicy: TableLayout new;
			hResizing: #spaceFill;
			vResizing: #shrinkWrap.
		self items add: clickable]
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
	#'squeak_changestamp' : 'TL 6/10/2024 02:02'
}
SPOCResultList >> updateScrollablePanel [

	self scrollablePanel updatePanel: self items
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 6/10/2024 02:02'
}
SPOCResultList >> updateTitle: aString [

	self titleMorph contents: (self title asText addAttribute: TextEmphasis bold)
]
