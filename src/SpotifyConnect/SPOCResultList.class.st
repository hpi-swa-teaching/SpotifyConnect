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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/4/2024 23:35'
}
SPOCResultList class >> newWithTitle: aString [

	^ (SPOCResultList new title: aString;
		buildResultList;
		yourself)
]

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
	#'squeak_changestamp' : 'RK 6/4/2024 22:56'
}
SPOCResultList >> buildScrollablePanel [
	self scrollablePanel: (SPOCScrollablePanel new
		buildPanelAtPos: (self titleMorph bottomLeft + (0@SPOCStyle defaultMargin))
		withExtent: SPOCStyle resultListWidth@SPOCStyle resultListHeight);
		addMorph: scrollablePanel;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/4/2024 23:36'
}
SPOCResultList >> buildTitle [
	
	self titleMorph: (SPOCText newAt: self position withText: self title);
		addMorph: titleMorph;
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/4/2024 23:35'
}
SPOCResultList >> initialize [

	super initialize.
	
	self color: Color transparent.
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
	#'squeak_changestamp' : 'RK 6/5/2024 01:12'
}
SPOCResultList >> updateItems [

	items isEmpty ifFalse: [items removeAll].
	results do: [ :result | items add: (SPOCClickable newUsing: (SPOCResultListItem newWith: result) onClick: [ :evt | "playTrack: id bei SPOCTrack, show: id bei SPOCAlbum oder Artist"])]
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
	#'squeak_changestamp' : 'RK 6/5/2024 01:09'
}
SPOCResultList >> updateScrollablePanel [
	"methode von panel aufrufen: entferne items aus panel, füge items neu ein"
]
