Class {
	#name : #SPOCVolumeSlider,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'deviceID',
		'icon',
		'slider',
		'supportsVolume',
		'volume'
	],
	#category : #'SpotifyConnect-UI'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/18/2024 23:57'
}
SPOCVolumeSlider class >> speakerOffIconPath [

	^ '/assets/next-white.png'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/18/2024 23:54'
}
SPOCVolumeSlider class >> speakerOnIconPath [

	^ '/assets/speaker.png'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/18/2024 23:57'
}
SPOCVolumeSlider >> attachIcon [
	
	self addMorph: (Morph new
			color: Color transparent;
			extent: 1 @ 20;
			yourself);
		icon: (SPOCIcon new
			color: Color transparent;
			iconAsset: self class speakerOnIconPath;
			yourself);
		addMorph: self icon
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/17/2024 16:51'
}
SPOCVolumeSlider >> attachSlider [

	self slider: (SPOCSlider new
			value: self volume;
			length: 100;
			yourself).
	self slider onValueChanged: [:aValue | 
		self app updatePlaybackState.
		self disabled
			ifFalse: [self supportsVolume
					ifTrue: [self changeVolumeTo: aValue.
						self app updatePlaybackState]
					ifFalse: [self app volumePopUp]]].
	self addMorph: self slider
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/17/2024 20:05'
}
SPOCVolumeSlider >> changeVolumeTo: aVolume [

	SPOCApiVolume new
		authorizer: self app auth;
		changeVolumeTo: aVolume on: self deviceID;
		yourself
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
	#'squeak_changestamp' : 'VE 6/10/2024 22:18'
}
SPOCVolumeSlider >> initialize [

	super initialize.
	
	self color: Color transparent;
		supportsVolume: false;
		volume: 100;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		attachSlider;
		attachIcon;
		extendFully
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
	#category : #updating,
	#'squeak_changestamp' : 'TL 6/18/2024 23:55'
}
SPOCVolumeSlider >> updatePlaybackState: aState [

	self disabled
		ifFalse: [self deviceID: aState device id;
				supportsVolume: aState device supportsVolume;
				volume: aState device volume.
			self slider updateValue: self volume.
			self updateSpeakerIcon]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 6/18/2024 23:54'
}
SPOCVolumeSlider >> updateSpeakerIcon [

	self volume = 0
		ifTrue: [self icon iconAsset: self class speakerOffIconPath]
		ifFalse: [self icon iconAsset: self class speakerOnIconPath]
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
