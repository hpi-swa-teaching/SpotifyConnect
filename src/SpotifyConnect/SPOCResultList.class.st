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
	#'squeak_changestamp' : 'RK 6/4/2024 23:25'
}
SPOCResultList >> buildResultList [
	self buildTitle;
		buildScrollablePanel;
		extendFully
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/6/2024 00:23'
}
SPOCResultList >> buildScrollablePanel [
	self scrollablePanel: (SPOCScrollablePanel newWithExtent: SPOCStyle resultListWidth@SPOCStyle resultListHeight).
	scrollablePanel position: (self titleMorph bottomLeft + (0@SPOCStyle defaultMargin)).
	self addMorph: scrollablePanel
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/6/2024 01:45'
}
SPOCResultList >> buildTitle [
	
	self titleMorph: (SPOCBoldText newAt: self position withText: 'Your Results');
		addMorph: self titleMorph;
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/5/2024 22:30'
}
SPOCResultList >> initialize [

	super initialize.
	
	self color: Color transparent;
		title: '';
		results: OrderedCollection new;
		items: OrderedCollection new;
		buildResultList;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/4/2024 12:19'
}
SPOCResultList >> items [
	^ items
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/4/2024 12:20'
}
SPOCResultList >> items: anOrderedCollection [
	items := anOrderedCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 01:03'
}
SPOCResultList >> results [
	^ results
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 01:03'
}
SPOCResultList >> results: anObject [
	results := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/4/2024 12:19'
}
SPOCResultList >> scrollablePanel [
	^ scrollablePanel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/4/2024 12:20'
}
SPOCResultList >> scrollablePanel: aSPOCScrollablePanel [
	scrollablePanel := aSPOCScrollablePanel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/4/2024 12:18'
}
SPOCResultList >> title [
	^ title
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/4/2024 12:20'
}
SPOCResultList >> title: aString [
	title := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/4/2024 22:44'
}
SPOCResultList >> titleMorph [
	^ titleMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/4/2024 22:44'
}
SPOCResultList >> titleMorph: anObject [
	titleMorph := anObject
]

{
	#category : #updating,
	#'squeak_changestamp' : 'RK 6/6/2024 00:37'
}
SPOCResultList >> updateItems [

	items isEmpty ifFalse: [items removeAll].
	results do: [ :result |
		| item |
		item := SPOCClickable newUsing: (SPOCResultListItem newWith: result)
			onClick: [ :evt | "playTrack: id bei SPOCTrack, show: id bei SPOCAlbum oder Artist"].
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
	#'squeak_changestamp' : 'RK 6/6/2024 00:10'
}
SPOCResultList >> updateScrollablePanel [
	self scrollablePanel updatePanel: items
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/6/2024 01:43'
}
SPOCResultList >> updateTitle: aString [

	self title: aString.
	self titleMorph: (SPOCBoldText newAt: self position withText: self title)
]
