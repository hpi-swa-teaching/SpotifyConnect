"
concrete class for the volume slider
"
Class {
	#name : #SPOCVolumeSlider,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'button',
		'deviceID',
		'icon',
		'isMuted',
		'slider',
		'supportsVolume',
		'volume'
	],
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:14'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/19/2024 19:44'
}
SPOCVolumeSlider class >> speakerIconPath [

	^ '/assets/speaker.png'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/19/2024 19:44'
}
SPOCVolumeSlider class >> speakerMutedIconPath [

	^ '/assets/speaker-muted.png'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/8/2024 19:39'
}
SPOCVolumeSlider >> attachButton [
	
	self icon: (SPOCIcon new color: Color transparent;
			iconAsset: self class speakerIconPath;
			yourself);
		button: (SPOCClickable newUsing: self icon
				onClick: [:anEvent | self volumeClicked: [self switchMuteState]]);
		addMorph: self spacerMorph;
		addMorph: self button
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/8/2024 18:59'
}
SPOCVolumeSlider >> attachSlider [

	self slider: (SPOCSlider new value: self volume;
			length: 100;
			onValueChanged: [:aValue | self volumeClicked: [self changeVolumeTo: aValue]];
			yourself);
		addMorph: self slider
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/19/2024 00:19'
}
SPOCVolumeSlider >> button [

	^ button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/19/2024 00:19'
}
SPOCVolumeSlider >> button: anObject [

	button := anObject
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/8/2024 18:52'
}
SPOCVolumeSlider >> changeVolumeTo: aVolume [
	
	SPOCApiVolume new authorizer: self app auth;
		changeVolumeTo: aVolume on: self deviceID.
	aVolume = 0
		ifTrue: [self mute]
		ifFalse: [self unmute: aVolume].
	self slider value: aVolume
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:19'
}
SPOCVolumeSlider >> deviceID [

	^ deviceID
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:19'
}
SPOCVolumeSlider >> deviceID: anObject [

	deviceID := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/18/2024 23:56'
}
SPOCVolumeSlider >> icon [

	^ icon
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/18/2024 23:56'
}
SPOCVolumeSlider >> icon: anObject [

	icon := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/8/2024 19:39'
}
SPOCVolumeSlider >> initialize [

	super initialize.
	
	self color: Color transparent;
		supportsVolume: false;
		volume: 100;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		attachSlider;
		attachButton;
		extendFully
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/8/2024 18:12'
}
SPOCVolumeSlider >> isMuted [

	^ isMuted
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/8/2024 18:12'
}
SPOCVolumeSlider >> isMuted: anObject [

	isMuted := anObject
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 7/8/2024 18:22'
}
SPOCVolumeSlider >> mute [

	self icon iconAsset: self class speakerMutedIconPath.
	self isMuted: true
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 7/2/2024 19:12'
}
SPOCVolumeSlider >> needsActiveDevice [
	
	^ true
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 7/2/2024 19:12'
}
SPOCVolumeSlider >> needsLogin [
	
	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:19'
}
SPOCVolumeSlider >> slider [

	^ slider
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:19'
}
SPOCVolumeSlider >> slider: anObject [

	slider := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/8/2024 17:39'
}
SPOCVolumeSlider >> spacerMorph [

	^ Morph new color: Color transparent;
		extent: 1 @ SPOCStyle defaultMargin;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:19'
}
SPOCVolumeSlider >> supportsVolume [

	^ supportsVolume
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:19'
}
SPOCVolumeSlider >> supportsVolume: anObject [

	supportsVolume := anObject
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 7/8/2024 18:57'
}
SPOCVolumeSlider >> switchMuteState [

	self isMuted
		ifTrue: [self changeVolumeTo: self volume]
		ifFalse: [self changeVolumeTo: 0]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 7/8/2024 18:50'
}
SPOCVolumeSlider >> unmute: aVolume [

	self icon iconAsset: self class speakerIconPath.
	self isMuted: false;
		volume: aVolume
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 7/8/2024 19:59'
}
SPOCVolumeSlider >> updatePlaybackState: aState [

	| newVolume |
	super updatePlaybackState: aState.
	self isDisabled
		ifTrue: [^ self].
	newVolume := aState device volume.
	newVolume = 0
		ifTrue: [self mute]
		ifFalse: [self unmute: newVolume].
	self deviceID: aState device id;
		supportsVolume: aState device supportsVolume.
	self slider updateValue: newVolume
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:18'
}
SPOCVolumeSlider >> volume [

	^ volume
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:18'
}
SPOCVolumeSlider >> volume: anObject [

	volume := anObject
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 7/8/2024 18:30'
}
SPOCVolumeSlider >> volumeClicked: aBlock [

	self isDisabled
		ifTrue: [self showPopUp.
			^ self].
	self supportsVolume
		ifTrue: aBlock
		ifFalse: [self app volumePopUp.
			self slider value: self volume]
]
