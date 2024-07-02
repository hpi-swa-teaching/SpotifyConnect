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
	#'squeak_changestamp' : 'TL 6/19/2024 19:06'
}
SPOCRefresh class >> refreshIconPath [

	^ '/assets/refresh.png'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 7/2/2024 18:46'
}
SPOCRefresh >> attachButton [

	self icon: (SPOCIcon new
				iconAsset: self class refreshIconPath;
			 	yourself);
		button: (SPOCClickable
				newUsing: self icon
				onClick: [:anEvent | self refresh]);
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

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 7/2/2024 18:44'
}
SPOCRefresh >> needsActiveDevice [
	
	^ false
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 7/2/2024 18:44'
}
SPOCRefresh >> needsLogin [
	
	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 7/2/2024 18:57'
}
SPOCRefresh >> refresh [

	self isDisabled
		ifTrue: [self showPopUp]
		ifFalse: [self app updatePlaybackState]
]
