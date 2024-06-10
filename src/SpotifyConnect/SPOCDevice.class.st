Class {
	#name : #SPOCDevice,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'isActive',
		'isPrivateSession',
		'isRestricted',
		'type',
		'volume',
		'supportsVolume'
	],
	#category : #SpotifyConnect
}

{
	#category : #testing,
	#'squeak_changestamp' : 'VK 5/27/2024 16:25'
}
SPOCDevice >> equals: aDevice [
	
	^ (self id = aDevice id) 
		& (self name = aDevice name) 
		& (self isActive = aDevice isActive)
		& (self isPrivateSession = aDevice isPrivateSession)
		& (self isRestricted = aDevice isRestricted)
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
	#'squeak_changestamp' : 'TL 6/10/2024 03:56'
}
SPOCDevice >> isActive: anObject [

	isActive := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:56'
}
SPOCDevice >> isPrivateSession [

	^ isPrivateSession
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:56'
}
SPOCDevice >> isPrivateSession: anObject [

	isPrivateSession := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:56'
}
SPOCDevice >> isRestricted [

	^ isRestricted
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:56'
}
SPOCDevice >> isRestricted: anObject [

	isRestricted := anObject
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
	#'squeak_changestamp' : 'TL 6/10/2024 03:56'
}
SPOCDevice >> supportsVolume: anObject [

	supportsVolume := anObject
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
	#'squeak_changestamp' : 'TL 6/10/2024 03:57'
}
SPOCDevice >> type: anObject [

	type := anObject
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
	#'squeak_changestamp' : 'TL 6/10/2024 03:57'
}
SPOCDevice >> volume: anObject [

	volume := anObject
]
