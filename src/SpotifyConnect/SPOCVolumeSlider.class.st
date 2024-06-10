Class {
	#name : #SPOCVolumeSlider,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'deviceID',
		'slider',
		'supportsVolume',
		'volume'
	],
	#category : #SpotifyConnect
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/10/2024 03:07'
}
SPOCVolumeSlider >> attachSlider [

	self slider: (SPOCSlider new
			value: self volume;
			length: 300;
			yourself).
	self slider onValueChanged: [:aValue | 
		self updateInstanceVariables.
		self supportsVolume
			ifTrue: [self changeVolumeTo: aValue]
			ifFalse: [self slider updateValue: self volume.
				UIManager inform: 'Your device does not support volume changes.']]
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
	#'squeak_changestamp' : 'TL 6/10/2024 03:06'
}
SPOCVolumeSlider >> initialize [

	super initialize.
	
	self color: Color transparent;
		supportsVolume: false;
		volume: 100;
		attachSlider;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		cellInset: 10;
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
	#'squeak_changestamp' : 'TL 6/10/2024 05:08'
}
SPOCVolumeSlider >> updateInstanceVariables [

	| playbackState |
	playbackState := self getPlaybackState.
	playbackState class = SPOCApiEndpointResult
		ifTrue: [playbackState response code = 204 ifTrue: [UIManager inform: 'Please play music on your device!']]
		ifFalse: [self deviceID: playbackState device id;
			volume: playbackState device volume;
			supportsVolume: playbackState device supportsVolume]
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
