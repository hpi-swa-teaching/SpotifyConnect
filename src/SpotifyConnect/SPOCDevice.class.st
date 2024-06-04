Class {
	#name : #SPOCDevice,
	#superclass : #SPOCDataModel,
	#instVars : [
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
	#category : #accessing,
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
	#'squeak_changestamp' : 'VK 5/25/2024 19:05'
}
SPOCDevice >> isActive [
	^ isActive
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 19:05'
}
SPOCDevice >> isActive: anObject [
	isActive := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 19:05'
}
SPOCDevice >> isPrivateSession [
	^ isPrivateSession
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 19:05'
}
SPOCDevice >> isPrivateSession: anObject [
	isPrivateSession := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 19:05'
}
SPOCDevice >> isRestricted [
	^ isRestricted
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 19:05'
}
SPOCDevice >> isRestricted: anObject [
	isRestricted := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 19:07'
}
SPOCDevice >> supportsVolume [
	^ supportsVolume
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 19:07'
}
SPOCDevice >> supportsVolume: anObject [
	supportsVolume := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 19:06'
}
SPOCDevice >> type [
	^ type
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 19:06'
}
SPOCDevice >> type: anObject [
	type := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 19:06'
}
SPOCDevice >> volume [
	^ volume
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 19:06'
}
SPOCDevice >> volume: anObject [
	volume := anObject
]
