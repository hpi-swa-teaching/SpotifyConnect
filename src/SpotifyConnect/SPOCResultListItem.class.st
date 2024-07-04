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
	#'squeak_changestamp' : 'RK 6/16/2024 14:31'
}
SPOCResultListItem >> buildPrimaryText [

	self primaryText: (SPOCBoldText new contents: self dataPiece name; yourself).
	self centerBox addMorph: self primaryText
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/16/2024 14:31'
}
SPOCResultListItem >> buildSecondaryText [

	| content |
	(self dataPiece isKindOf: SPOCTrack)
		ifTrue: [content := self dataPiece artistsAsString].
	(self dataPiece isKindOf: SPOCAlbum)
		ifTrue: [content := self dataPiece artistsAsString].
	(self dataPiece isKindOf: SPOCPlaylist)
		ifTrue: [content := self dataPiece owner].	
	self secondaryText: (SPOCText new contents: content; yourself).
	self centerBox addMorph: self secondaryText
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/16/2024 14:31'
}
SPOCResultListItem >> buildTertiaryText [

	| content |
	self hasTertiaryText
		ifTrue: [(self dataPiece isKindOf: SPOCTrack)
				ifTrue: [content := self dataPiece durationAsFormattedTime]
				ifFalse: [content := ''].
		self tertiaryText: (SPOCText new contents: content; yourself).
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
	#'squeak_changestamp' : 'TL 6/10/2024 01:55'
}
SPOCResultListItem >> changeItemTo: aDataModel [
	
	| form |
	form := (aDataModel image scaledTo: SPOCStyle resultListItemHeight - (2 * SPOCStyle defaultMargin)) form.
	self image image: form.
	self primaryText contents: (aDataModel name asText addAttribute: TextEmphasis bold).
	self secondaryText contents: (aDataModel album artistsAsString).
	(aDataModel isKindOf: SPOCTrack)
		ifTrue: [self tertiaryText contents: (aDataModel durationAsFormattedTime)]
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
	#'squeak_changestamp' : 'RK 6/7/2024 12:30'
}
SPOCResultListItem >> hasTertiaryText [

	^ hasTertiaryText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/9/2024 11:49'
}
SPOCResultListItem >> hasTertiaryText: aBoolean [

	hasTertiaryText := aBoolean.
	self updateTertiaryText
	
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
	#'squeak_changestamp' : 'VE 6/10/2024 21:47'
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
		cellInset: 10;
		hasTertiaryText: true
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
	#'squeak_changestamp' : 'RK 6/5/2024 21:03'
}
SPOCResultListItem >> toggleTextColor [
	"To do: If item gets selected, its texts should change color, e.g. to spotifyGreen"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/10/2024 01:56'
}
SPOCResultListItem >> updateTertiaryText [

	(self submorphs includes: self tertiaryText)
		ifTrue: [self removeMorph: self tertiaryText]
]
