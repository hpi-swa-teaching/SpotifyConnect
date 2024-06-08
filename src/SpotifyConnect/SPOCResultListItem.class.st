Class {
	#name : #SPOCResultListItem,
	#superclass : #Morph,
	#instVars : [
		'app',
		'dataModel',
		'background',
		'image',
		'primaryText',
		'secondaryText',
		'tertiaryText',
		'hasTertiaryText'
	],
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/7/2024 11:09'
}
SPOCResultListItem class >> newWith: aDataModel [
	^ (SPOCResultListItem new dataModel: aDataModel;
		buildItem;
		yourself)
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
	#'squeak_changestamp' : 'RK 6/7/2024 12:21'
}
SPOCResultListItem >> app: aSPOCApp [
	app := aSPOCApp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:07'
}
SPOCResultListItem >> background [

	^ background
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:07'
}
SPOCResultListItem >> background: aRectangleMorph [

	background := aRectangleMorph
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/5/2024 00:52'
}
SPOCResultListItem >> buildBackground [

	self background: (RectangleMorph new
		color: SPOCStyle spotifyGray;
		borderWidth: 1;
		extent: (SPOCStyle resultListWidth@SPOCStyle resultListItemHeight);
		yourself);
		addMorph: background;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/6/2024 00:53'
}
SPOCResultListItem >> buildImage [

	| image |
	image := dataModel image scaledTo: SPOCStyle resultListItemHeight - (2 * SPOCStyle defaultMargin).
	image position: self topLeft + SPOCStyle defaultMargin asPoint.
	self image: image;
		addMorph: image;
		yourself


]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/7/2024 11:08'
}
SPOCResultListItem >> buildItem [

	self buildBackground;
		buildImage;
		buildPrimaryText;
		buildSecondaryText;
		buildTertiaryText;
		vResizing: #shrinkWrap;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/6/2024 01:24'
}
SPOCResultListItem >> buildPrimaryText [

	| text |
	text := SPOCBoldText newAt: image topRight + (SPOCStyle defaultMargin@0) withText: dataModel name.
	self primaryText: text;
		addMorph: primaryText;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/5/2024 00:55'
}
SPOCResultListItem >> buildSecondaryText [

	| text content |
	(dataModel isKindOf: SPOCTrack)
		ifTrue: [content := dataModel album artistsAsString].
	(dataModel isKindOf: SPOCAlbum)
		ifTrue: [content := dataModel artistsAsString].
	(dataModel isKindOf: SPOCArtist)
		ifTrue: [content := ''].	
	text := SPOCText newAt: image bottomRight + (SPOCStyle defaultMargin@(SPOCStyle textHeight negated)) withText: content.
	self secondaryText: text;
		addMorph: secondaryText;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/7/2024 19:13'
}
SPOCResultListItem >> buildTertiaryText [

	| text content |
	hasTertiaryText ifTrue: [
	(dataModel isKindOf: SPOCTrack)
		ifTrue: [content := dataModel durationAsFormattedTime]
		ifFalse: [content := ''].
	text := SPOCText newAt: background bottomRight - (SPOCStyle resultListItemPadding@(SPOCStyle resultListItemHeight / 2)) withText: content.
	self tertiaryText: text;
		addMorph: tertiaryText;
		yourself]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/8/2024 21:50'
}
SPOCResultListItem >> changeItemTo: aDataModel [

	self image: (aDataModel image scaledTo: SPOCStyle resultListItemHeight - (2 * SPOCStyle defaultMargin)).
	self primaryText contents: (aDataModel name asText addAttribute: TextEmphasis bold).
	self secondaryText contents: (aDataModel name).
	(aDataModel isKindOf: SPOCTrack) ifTrue: [self tertiaryText contents: (aDataModel durationAsFormattedTime)]
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
	#'squeak_changestamp' : 'RK 6/7/2024 23:34'
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
	#'squeak_changestamp' : 'RK 6/7/2024 12:35'
}
SPOCResultListItem >> initialize [

	super initialize.
	self color: Color transparent;
		vResizing: #shrinkWrap;
		hasTertiaryText: true;
		yourself
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
	#'squeak_changestamp' : 'RK 6/7/2024 23:46'
}
SPOCResultListItem >> resizeTo: anExtent [

	self background extent: anExtent
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
	#'squeak_changestamp' : 'RK 6/7/2024 23:35'
}
SPOCResultListItem >> updateTertiaryText [

	(self submorphs includes: tertiaryText) ifTrue: [self removeMorph: tertiaryText]
]
