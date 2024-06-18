Class {
	#name : #SPOCRefresh,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'button',
		'icon'
	],
	#category : #'SpotifyConnect-UI'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/18/2024 23:30'
}
SPOCRefresh class >> refreshIconPath [

	^ '/assets/next.png'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/18/2024 23:42'
}
SPOCRefresh >> attachButton [

	self icon: (SPOCIcon new
				iconAsset: self class refreshIconPath;
			 	yourself);
		button: (SPOCClickable
				newUsing: self icon
				onClick: [:anEvent | self app updatePlaybackState]);
		addMorph: self button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/18/2024 23:20'
}
SPOCRefresh >> button [

	^ button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/18/2024 23:20'
}
SPOCRefresh >> button: anObject [

	button := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/18/2024 23:20'
}
SPOCRefresh >> icon [

	^ icon
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/18/2024 23:20'
}
SPOCRefresh >> icon: anObject [

	icon := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/18/2024 23:27'
}
SPOCRefresh >> initialize [

	super initialize.

	self color: Color transparent;
		attachButton
]
