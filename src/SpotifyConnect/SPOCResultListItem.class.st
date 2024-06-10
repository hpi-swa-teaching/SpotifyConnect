Class {
	#name : #SPOCResultListItem,
	#superclass : #Morph,
	#instVars : [
		'app',
		'dataModel',
		'image',
		'primaryText',
		'secondaryText',
		'tertiaryText',
		'hasTertiaryText'
	],
	#category : #'SpotifyConnect-UI'
}

{
	#category : #constructor,
	#'squeak_changestamp' : 'TL 6/10/2024 05:12'
}
SPOCResultListItem class >> newWith: aDataModel [

	^ SPOCResultListItem new
		dataModel: aDataModel;
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
	#'squeak_changestamp' : 'VE 6/10/2024 21:43'
}
SPOCResultListItem >> buildImage [

	| image |
	image := self dataModel image scaledTo: SPOCStyle resultListItemHeight - (2 * SPOCStyle defaultMargin).
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
	#'squeak_changestamp' : 'VE 6/10/2024 21:40'
}
SPOCResultListItem >> buildPrimaryText [

	self primaryText: (SPOCBoldText new contents: self dataModel name; yourself).
	self centerBox addMorph: self primaryText
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 6/10/2024 21:37'
}
SPOCResultListItem >> buildSecondaryText [

	| content |
	(self dataModel isKindOf: SPOCTrack)
		ifTrue: [content := self dataModel album artistsAsString].
	(self dataModel isKindOf: SPOCAlbum)
		ifTrue: [content := self dataModel artistsAsString].
	(self dataModel isKindOf: SPOCArtist)
		ifTrue: [content := ' '].	
	self secondaryText: (SPOCText new contents: content; yourself).
	self centerBox addMorph: self secondaryText
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 6/10/2024 21:42'
}
SPOCResultListItem >> buildTertiaryText [

	| content |
	self hasTertiaryText
		ifTrue: [(self dataModel isKindOf: SPOCTrack)
				ifTrue: [content := self dataModel durationAsFormattedTime]
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
	#'squeak_changestamp' : 'RK 6/7/2024 11:08'
}
SPOCResultListItem >> dataModel [

	^ dataModel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:08'
}
SPOCResultListItem >> dataModel: aDataModel [

	dataModel := aDataModel
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
