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
	#'squeak_changestamp' : 'VE 7/8/2024 18:56'
}
SPOCResultListItem class >> newWith: aDataPiece [

	^ SPOCResultListItem new
		dataPiece: aDataPiece;
		attachItem;
		yourself
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 7/8/2024 17:18'
}
SPOCResultListItem class >> resultListItemHeight [

	^ 96
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
	#'squeak_changestamp' : 'VE 7/8/2024 18:56'
}
SPOCResultListItem >> attachBackground [

	self color: SPOCStyle spotifyGray;
		borderWidth: 1
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 7/8/2024 18:57'
}
SPOCResultListItem >> attachCenterBox [

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
	#'squeak_changestamp' : 'TL 7/8/2024 19:33'
}
SPOCResultListItem >> attachImage [

	self image: (self dataPiece image scaledTo: self class resultListItemHeight - (2 * SPOCStyle defaultMargin));
		addMorph: self image

]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 7/8/2024 18:57'
}
SPOCResultListItem >> attachItem [

	self attachBackground;	
		attachTertiaryText;
		attachCenterBox;
		attachImage;
		attachSecondaryText;
		attachPrimaryText;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 7/8/2024 18:56'
}
SPOCResultListItem >> attachPrimaryText [

	self primaryText: (SPOCBoldText new contents: self dataPiece primaryText).
	self centerBox addMorph: self primaryText
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 7/8/2024 18:56'
}
SPOCResultListItem >> attachSecondaryText [

	self secondaryText: (SPOCText new contents: self dataPiece secondaryText).
	self centerBox addMorph: self secondaryText
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 7/8/2024 18:58'
}
SPOCResultListItem >> attachTertiaryText [

	self dataPiece hasTertiaryText
		ifTrue: [self tertiaryText: (SPOCText new contents: self dataPiece tertiaryText);
			addMorph: self tertiaryText]
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
	#'squeak_changestamp' : 'VE 7/8/2024 18:58'
}
SPOCResultListItem >> changeItemTo: aDataPiece [
	
	self image image: ((aDataPiece image scaledTo: self class resultListItemHeight - (2 * SPOCStyle defaultMargin)) form).
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 7/8/2024 18:26'
}
SPOCResultListItem >> highlightPrimaryTextColor [

	self primaryText color: SPOCStyle spotifyGreen
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
	#'squeak_changestamp' : 'VE 7/8/2024 18:07'
}
SPOCResultListItem >> resetPrimaryTextColor [

	self primaryText color: SPOCStyle spotifyWhite
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
