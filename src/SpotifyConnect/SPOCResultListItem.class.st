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
	#'squeak_changestamp' : 'RK 6/5/2024 00:45'
}
SPOCResultListItem class >> newWith: aDataModel [
	^ SPOCResultListItem new dataModel: aDataModel.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 00:03'
}
SPOCResultListItem >> background [
	^ background
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 00:06'
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
	#'squeak_changestamp' : 'RK 6/5/2024 00:54'
}
SPOCResultListItem >> buildImage [

	| image |
	(dataModel isKindOf: SPOCTrack)
		ifTrue: [image := (dataModel album) image].
	((dataModel isKindOf: SPOCAlbum) or: (dataModel isKindOf: SPOCArtist))
		ifTrue: [image := dataModel image].
	image := image scaledTo: SPOCStyle resultListItemHeight - (2 * SPOCStyle defaultMargin);
		position: self topLeft + SPOCStyle defaultMargin asPoint;
		yourself.
	self image: image;
		addMorph: image;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/5/2024 00:52'
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
	#'squeak_changestamp' : 'RK 6/5/2024 00:55'
}
SPOCResultListItem >> buildPrimaryText [

	| text |
	text := SPOCText newAt: image topRight + (SPOCStyle defaultMargin@0) withText: dataModel name.
	text text addAttribute: TextEmphasis bold.
	"To do: Resizing damit Text nicht abgeschnitten"
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
	#'squeak_changestamp' : 'RK 6/5/2024 00:06'
}
SPOCResultListItem >> dataModel [
	^ dataModel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 00:06'
}
SPOCResultListItem >> dataModel: aDataModel [
	dataModel := aDataModel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 00:03'
}
SPOCResultListItem >> image [
	^ image
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 00:07'
}
SPOCResultListItem >> image: aSPOCImage [
	image := aSPOCImage
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/5/2024 00:05'
}
SPOCResultListItem >> initialize [

	super initialize.

	self color: Color transparent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 00:03'
}
SPOCResultListItem >> primaryText [
	^ primaryText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 00:47'
}
SPOCResultListItem >> primaryText: aSPOCText [
	primaryText := aSPOCText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 00:03'
}
SPOCResultListItem >> secondaryText [
	^ secondaryText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 00:48'
}
SPOCResultListItem >> secondaryText: aSPOCText [
	secondaryText := aSPOCText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 00:03'
}
SPOCResultListItem >> tertiaryText [
	^ tertiaryText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 00:48'
}
SPOCResultListItem >> tertiaryText: aSPOCText [
	tertiaryText := aSPOCText
]
