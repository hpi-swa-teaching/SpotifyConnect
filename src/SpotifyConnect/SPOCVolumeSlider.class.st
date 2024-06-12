Class {
	#name : #SPOCVolumeSlider,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'deviceID',
		'slider',
		'supportsVolume',
		'volume'
	],
	#category : #'SpotifyConnect-UI'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/12/2024 03:19'
}
SPOCVolumeSlider class >> speakerIconPath [

	^ '/assets/speaker.png'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/12/2024 03:20'
}
SPOCVolumeSlider >> attachIcon [
	
	self addMorph: (Morph new
			color: Color transparent;
			extent: 1 @ 20;
			yourself);
		addMorph: (SPOCIcon new
			color: Color transparent;
			iconAsset: self class speakerIconPath;
			yourself)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/12/2024 04:06'
}
SPOCVolumeSlider >> attachSlider [

	self slider: (SPOCSlider new
			value: self volume;
			length: 100;
			yourself).
	self slider onValueChanged: [:aValue | 
		self app updatePlaybackStateFromLogin: false.
		self disabled
			ifFalse: [self supportsVolume
					ifTrue: [self changeVolumeTo: aValue.
						self app updatePlaybackStateFromLogin: false]
					ifFalse: [self app volumePopUp]]].
	self addMorph: self slider
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 04:35'
}
SPOCVolumeSlider >> changeVolumeTo: aVolume [

	| dict |
	dict := Dictionary new
		at: #volume_percent put: aVolume;
		at: #device_id put: self deviceID;
		yourself.
	SPOCApiVolume new
		authorizer: self app auth;
		execute: dict;
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
	#category : #actions,
	#'squeak_changestamp' : 'TL 6/12/2024 04:24'
}
SPOCVolumeSlider >> updatePlaybackState: aState [

	self disabled
		ifFalse: [self deviceID: aState device id;
				supportsVolume: aState device supportsVolume;
				volume: aState device volume.
			self slider updateValue: self volume]
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
