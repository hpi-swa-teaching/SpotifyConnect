Class {
	#name : #SPOCResultListItem,
	#superclass : #Morph,
	#instVars : [
		'dataModel',
		'background',
		'image',
		'primaryText',
		'secondaryText',
		'tertiaryText'
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
	#'squeak_changestamp' : 'RK 6/5/2024 00:55'
}
SPOCResultListItem >> buildTertiaryText [

	| text content |
	(dataModel isKindOf: SPOCTrack)
		ifTrue: [content := dataModel durationAsFormattedTime]
		ifFalse: [content := ''].
	text := SPOCText newAt: background bottomRight - (SPOCStyle resultListItemPadding@(SPOCStyle resultListItemHeight / 2)) withText: content.
	self tertiaryText: text;
		addMorph: tertiaryText;
		yourself
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
	#'squeak_changestamp' : 'RK 6/7/2024 11:08'
}
SPOCResultListItem >> initialize [

	super initialize.
	self color: Color transparent;
		vResizing: #shrinkWrap;
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
