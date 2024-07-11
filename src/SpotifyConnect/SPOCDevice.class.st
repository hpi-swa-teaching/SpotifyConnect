"
I represent a device that Spotify can connect to.
"
Class {
	#name : #SPOCDevice,
	#superclass : #Object,
	#instVars : [
		'id',
		'isActive',
		'name',
		'supportsVolume',
		'type',
		'volume'
	],
	#category : #SpotifyConnect,
	#'squeak_changestamp' : 'TL 7/11/2024 19:34'
}

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/11/2024 11:54'
}
SPOCDevice >> equals: aDevice [
	
	^ (self id = aDevice id) 
		& (self name = aDevice name) 
		& (self isActive = aDevice isActive)
		& (self supportsVolume = aDevice supportsVolume)
		& (self type = aDevice type)
		& (self volume = aDevice volume)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:56'
}
SPOCDevice >> id [

	^ id
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:56'
}
SPOCDevice >> id: aString [

	id := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:56'
}
SPOCDevice >> isActive [

	^ isActive
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/7/2024 02:34'
}
SPOCDevice >> isActive: aBoolean [

	isActive := aBoolean
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:56'
}
SPOCDevice >> name [

	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:56'
}
SPOCDevice >> name: aString [

	name := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:56'
}
SPOCDevice >> supportsVolume [

	^ supportsVolume
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/7/2024 02:35'
}
SPOCDevice >> supportsVolume: aBoolean [

	supportsVolume := aBoolean
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:57'
}
SPOCDevice >> type [

	^ type
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/7/2024 02:35'
}
SPOCDevice >> type: aString [

	type := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:57'
}
SPOCDevice >> volume [

	^ volume
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/7/2024 02:35'
}
SPOCDevice >> volume: aNumber [

	volume := aNumber
]
