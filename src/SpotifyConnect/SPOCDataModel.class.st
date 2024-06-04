Class {
	#name : #SPOCDataModel,
	#superclass : #Object,
	#instVars : [
		'id',
		'name'
	],
	#category : #SpotifyConnect
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 16:01'
}
SPOCDataModel >> equals: aDataModel [

	^ self subclassResponsibility
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 15:20'
}
SPOCDataModel >> id [
	^ id
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 15:20'
}
SPOCDataModel >> id: anObject [
	id := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 15:21'
}
SPOCDataModel >> name [
	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 15:21'
}
SPOCDataModel >> name: anObject [
	name := anObject
]
