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
		'scrollablePanel'
	],
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:12'
}

{
	#category : #building,
	#'squeak_changestamp' : 'VE 7/8/2024 18:55'
}
SPOCResultList >> attachResultList [

	self attachScrollablePanel;
		buildTitle;
		extendFully
]

{
	#category : #building,
	#'squeak_changestamp' : 'TL 7/8/2024 20:07'
}
SPOCResultList >> attachScrollablePanel [

	self scrollablePanel: (SPOCScrollablePanel new hResizing: #spaceFill;
			vResizing: #spaceFill;
			yourself);
		addMorph: self scrollablePanel
]

{
	#category : #building,
	#'squeak_changestamp' : 'TL 7/8/2024 19:32'
}
SPOCResultList >> buildTitle [
	
	self titleMorph: (SPOCBoldText new 
			vResizing: #shrinkWrap; 
			hResizing: #spaceFill;
			yourself);
		title: 'Welcome!';
		addMorph: self spacerMorph;
		addMorph: self titleMorph
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 7/8/2024 18:55'
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
		attachResultList
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
	#'squeak_changestamp' : 'TL 7/8/2024 20:00'
}
SPOCResultList >> onItemClicked: anItem [
	
	(self isDisabled and: [anItem dataPiece class = SPOCTrack])
		ifTrue: [self showPopUp.
			^ self].
	self resetHighlightColors.
	anItem highlightPrimaryTextColor.
	anItem dataPiece onClick: self app
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 7/8/2024 18:47'
}
SPOCResultList >> resetHighlightColors [

	self items do: [:anItem | anItem wrappee resetPrimaryTextColor].
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
	#'squeak_changestamp' : 'TL 7/8/2024 19:17'
}
SPOCResultList >> size [

	^ self items size
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/8/2024 19:32'
}
SPOCResultList >> spacerMorph [

	^ Morph new color: Color transparent;
		extent: 1 @ SPOCStyle defaultMargin;
		yourself
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
	#'squeak_changestamp' : 'TL 7/8/2024 19:24'
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
		self items add: clickable].
	self app updatePlaybackState
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 7/8/2024 18:26'
}
SPOCResultList >> updatePlaybackState: aPlaybackState [
	
	super updatePlaybackState: aPlaybackState.
	self items do: [:anItem | 
		anItem wrappee resetPrimaryTextColor.
		(anItem wrappee dataPiece id = aPlaybackState track id) ifTrue: [anItem wrappee highlightPrimaryTextColor]]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 7/8/2024 20:20'
}
SPOCResultList >> updateResults: anOrderedCollection [
	
	self results: anOrderedCollection;
		updateItems;
		updateScrollablePanel
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
