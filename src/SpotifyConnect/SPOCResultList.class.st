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
	#category : #'SpotifyConnect-UI'
}

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
	#'squeak_changestamp' : 'VE 6/10/2024 22:33'
}
SPOCResultList >> initialize [

	super initialize.
	
	self color: Color transparent;
		results: OrderedCollection new;
		items: OrderedCollection new;
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
	#'squeak_changestamp' : 'VE 7/2/2024 19:14'
}
SPOCResultList >> onItemClicked: anItem [
	
	(self isDisabled and: (anItem dataPiece isKindOf: SPOCTrack)) ifTrue: [self showPopUp. ^ self].
	anItem dataPiece onClick: self app
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
	#'squeak_changestamp' : 'VE 7/2/2024 19:08'
}
SPOCResultList >> updateItems [
	
	self items isEmpty ifFalse: [self items removeAll].
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
