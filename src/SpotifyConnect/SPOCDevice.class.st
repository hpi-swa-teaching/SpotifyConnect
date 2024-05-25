Class {
	#name : #SPOCDevice,
	#superclass : #Object,
	#instVars : [
		'id',
		'isActive',
		'isPrivateSession',
		'isRestricted',
		'name',
		'type',
		'volume',
		'supportsVolume'
	],
	#category : #SpotifyConnect
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 19:05'
}
SPOCDevice >> id [
	^ id
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 19:05'
}
SPOCDevice >> id: anObject [
	id := anObject
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
	#'squeak_changestamp' : 'VK 5/25/2024 19:06'
}
SPOCDevice >> name [
	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/25/2024 19:06'
}
SPOCDevice >> name: anObject [
	name := anObject
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
