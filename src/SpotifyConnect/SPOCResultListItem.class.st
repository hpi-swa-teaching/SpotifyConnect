"
An item containing information of the search results.
"
Class {
	#name : #SPOCResultListItem,
	#superclass : #Morph,
	#instVars : [
		'app',
		'dataPiece',
		'image',
		'primaryText',
		'secondaryText',
		'tertiaryText',
		'hasTertiaryText'
	],
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:30'
}

{
	#category : #constructor,
	#'squeak_changestamp' : 'RK 6/16/2024 14:35'
}
SPOCResultListItem class >> newWith: aDataPiece [

	^ SPOCResultListItem new
		dataPiece: aDataPiece;
		buildItem;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 12:21'
}
SPOCResultListItem >> app [

	^ app
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/9/2024 11:48'
}
SPOCResultListItem >> app: aSPOCApp [

	app := aSPOCApp
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 6/10/2024 22:00'
}
SPOCResultListItem >> buildBackground [

	self color: SPOCStyle spotifyGray;
		borderWidth: 1
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 6/10/2024 21:51'
}
SPOCResultListItem >> buildCenterBox [

	self addMorph: (Morph new name: 'center-box';
			 color: Color transparent;
			 layoutPolicy: TableLayout new;
			 hResizing: #spaceFill;
			 vResizing: #spaceFill;
			 listDirection: #topToBottom;
			 wrapDirection: #leftToRight;
			 listCentering: #justified;
			 wrapCentering: #justified;
			 cellPositioning: #topLeft;
			 yourself)
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/16/2024 14:31'
}
SPOCResultListItem >> buildImage [

	| image |
	image := self dataPiece image scaledTo: SPOCStyle resultListItemHeight - (2 * SPOCStyle defaultMargin).
	self image: image;
		addMorph: image

]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 6/10/2024 21:48'
}
SPOCResultListItem >> buildItem [

	self buildBackground;	
		buildTertiaryText;
		buildCenterBox;
		buildImage;
		buildSecondaryText;
		buildPrimaryText;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 7/7/2024 13:42'
}
SPOCResultListItem >> buildPrimaryText [

	self primaryText: (SPOCBoldText new contents: self dataPiece primaryText).
	self centerBox addMorph: self primaryText
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 7/7/2024 12:36'
}
SPOCResultListItem >> buildSecondaryText [

	self secondaryText: (SPOCText new contents: self dataPiece secondaryText).
	self centerBox addMorph: self secondaryText
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 7/7/2024 12:57'
}
SPOCResultListItem >> buildTertiaryText [

	self dataPiece hasTertiaryText
		ifTrue: [self tertiaryText: (SPOCText new contents: self dataPiece tertiaryText).
		self addMorph: self tertiaryText]
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 6/10/2024 21:34'
}
SPOCResultListItem >> centerBox [
	
	^ self submorphNamed: 'center-box'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 7/7/2024 12:55'
}
SPOCResultListItem >> changeItemTo: aDataPiece [
	
	| form |
	form := (aDataPiece image scaledTo: SPOCStyle resultListItemHeight - (2 * SPOCStyle defaultMargin)) form.
	self image image: form.
	self primaryText contents: (aDataPiece primaryText asText addAttribute: TextEmphasis bold).
	self secondaryText contents: (aDataPiece secondaryText).
	aDataPiece hasTertiaryText
		ifTrue: [self tertiaryText contents: aDataPiece tertiaryText]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/16/2024 14:32'
}
SPOCResultListItem >> dataPiece [

	^ dataPiece
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/16/2024 14:35'
}
SPOCResultListItem >> dataPiece: aDataPiece [

	dataPiece := aDataPiece
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:08'
}
SPOCResultListItem >> image [

	^ image
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:08'
}
SPOCResultListItem >> image: aSPOCImage [

	image := aSPOCImage
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 7/7/2024 12:59'
}
SPOCResultListItem >> initialize [

	super initialize.
	
	self color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		listCentering: #topLeft;
		wrapCentering: #topLeft;
		cellPositioning: #topLeft;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		cellInset: SPOCStyle defaultMargin
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:08'
}
SPOCResultListItem >> primaryText [

	^ primaryText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:08'
}
SPOCResultListItem >> primaryText: aSPOCText [

	primaryText := aSPOCText
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/10/2024 19:18'
}
SPOCResultListItem >> resizeTo: anExtent [

	self extent: anExtent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:08'
}
SPOCResultListItem >> secondaryText [

	^ secondaryText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:08'
}
SPOCResultListItem >> secondaryText: aSPOCText [

	secondaryText := aSPOCText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:08'
}
SPOCResultListItem >> tertiaryText [

	^ tertiaryText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:09'
}
SPOCResultListItem >> tertiaryText: aSPOCText [

	tertiaryText := aSPOCText
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 7/7/2024 13:42'
}
SPOCResultListItem >> togglePrimaryTextColor [

	(self primaryText color = SPOCStyle spotifyGreen)
		ifTrue: [self primaryText color: SPOCStyle spotifyWhite]
		ifFalse: [self primaryText color: SPOCStyle spotifyGreen]
]
