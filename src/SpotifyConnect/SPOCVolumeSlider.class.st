Class {
	#name : #SPOCVolumeSlider,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'button',
		'deviceID',
		'icon',
		'slider',
		'storeVolume',
		'supportsVolume',
		'volume'
	],
	#category : #'SpotifyConnect-UI'
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
	#'squeak_changestamp' : 'TL 6/19/2024 19:44'
}
SPOCVolumeSlider >> attachButton [
	
	self icon: (SPOCIcon new
			color: Color transparent;
			iconAsset: self class speakerIconPath;
			yourself);
		button: (SPOCClickable
				newUsing: self icon
				onClick: [:anEvent | 
					self volumeClicked: [self switchSpeakerState]]);
		addMorph: (Morph new
			color: Color transparent;
			extent: 1 @ 20;
			yourself);
		addMorph: self button
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/19/2024 00:46'
}
SPOCVolumeSlider >> attachSlider [

	self slider: (SPOCSlider new
			value: self volume;
			length: 100;
			onValueChanged: [:aValue | 
				self volumeClicked: [self changeVolumeTo: aValue]];
			yourself).
	self addMorph: self slider
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
	#'squeak_changestamp' : 'VE 6/26/2024 14:54'
}
SPOCVolumeSlider >> changeVolumeTo: aVolume [
	
	self volume: aVolume.
	SPOCApiVolume new
		authorizer: self app auth;
		changeVolumeTo: aVolume on: self deviceID.
	self slider value: self volume.
	self updateSpeakerIcon
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
	#'squeak_changestamp' : 'TL 6/19/2024 00:47'
}
SPOCVolumeSlider >> initialize [

	super initialize.
	
	self color: Color transparent;
		supportsVolume: false;
		volume: 100;
		storeVolume: self volume;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		attachSlider;
		attachButton;
		extendFully
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
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/19/2024 00:18'
}
SPOCVolumeSlider >> storeVolume [

	^ storeVolume
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/19/2024 00:18'
}
SPOCVolumeSlider >> storeVolume: anObject [

	storeVolume := anObject
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
	#'squeak_changestamp' : 'VE 6/26/2024 14:54'
}
SPOCVolumeSlider >> switchSpeakerState [

	self volume = 0
		ifTrue: [self volume: self storeVolume;
			changeVolumeTo: self storeVolume]
		ifFalse: [self storeVolume: self volume;
			volume: 0;
			changeVolumeTo: self volume]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 7/2/2024 19:00'
}
SPOCVolumeSlider >> updatePlaybackState: aState [

	super updatePlaybackState: aState.
	self isDisabled
		ifFalse: [self volume = 0
					ifFalse: [self storeVolume: self volume].
			self deviceID: aState device id;
				supportsVolume: aState device supportsVolume;
				volume: aState device volume;
				updateSpeakerIcon.
			self slider updateValue: self volume]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 6/19/2024 19:44'
}
SPOCVolumeSlider >> updateSpeakerIcon [

	self volume = 0
		ifTrue: [self icon iconAsset: self class speakerMutedIconPath]
		ifFalse: [self icon iconAsset: self class speakerIconPath]
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
	#'squeak_changestamp' : 'VE 7/2/2024 19:03'
}
SPOCVolumeSlider >> volumeClicked: aBlock [

	self isDisabled ifTrue: [self showPopUp. ^ self].
	self supportsVolume
		ifTrue: aBlock
		ifFalse: [self app volumePopUp. self slider value: self volume].
	self updateSpeakerIcon.
]
