Class {
	#name : #SPOCDataModels,
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
SPOCDataModels >> equals: aDataModel [

	^ self subclassResponsibility
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 15:20'
}
SPOCDataModels >> id [
	^ id
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 15:20'
}
SPOCDataModels >> id: anObject [
	id := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 15:21'
}
SPOCDataModels >> name [
	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 15:21'
}
SPOCDataModels >> name: anObject [
	name := anObject
]
