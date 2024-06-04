Class {
	#name : #SPOCResultList,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'title',
		'items',
		'scrollablePanel'
	],
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/4/2024 12:18'
}
SPOCResultList class >> newWithTitle: aString [
	^ SPOCResultList new title: aString
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/4/2024 14:52'
}
SPOCResultList >> buildResultItem: aResult [

	"nimmt result und gibt morph mit allen displayed infos zurück"
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/4/2024 14:39'
}
SPOCResultList >> buildResultList [
	self buildTitle;
		buildScrollablePanel;
		extendFully;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/4/2024 14:39'
}
SPOCResultList >> buildScrollablePanel [
	"Scrollable Panel initialisieren"
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/4/2024 14:38'
}
SPOCResultList >> buildTitle [
	"Titel displayen"
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/4/2024 14:13'
}
SPOCResultList >> initialize [
	super initialize.
	
	self color: Color transparent;
		buildResultList;
		extendFully;
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
	#category : #updating,
	#'squeak_changestamp' : 'RK 6/4/2024 14:47'
}
SPOCResultList >> updateItems: anOrderedCollection [

	self items: anOrderedCollection
]

{
	#category : #updating,
	#'squeak_changestamp' : 'RK 6/4/2024 14:50'
}
SPOCResultList >> updateResults: anOrderedCollection [

	"results zu result items bauen, items updaten, panel updaten"
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'RK 6/4/2024 12:24'
}
SPOCResultList >> updateScrollablePanel [
	"build neue items, entferne items aus panel, füge items neu ein"
]
