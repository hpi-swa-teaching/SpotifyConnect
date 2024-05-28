Class {
	#name : #SPOCApp,
	#superclass : #Model,
	#instVars : [
		'auth'
	],
	#category : #SpotifyConnect
}

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 5/28/2024 14:50'
}
SPOCApp class >> appName [
	^ 'Spotify Connect'.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 5/28/2024 14:17'
}
SPOCApp class >> minimumExtent [
	^ 1080 @ 720
]

{
	#category : #start,
	#'squeak_changestamp' : 'VE 5/28/2024 14:53'
}
SPOCApp class >> open [
	self new open
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> auth [

	^ auth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> auth: anObject [

	auth := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> buildLoginPanel: aBuilder [

	^ aBuilder pluggablePanelSpec new
		model: self;
		children: #loginPanelContent;
		frame: (Rectangle origin: (0.9@0) corner: (1@0.05));
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> buildWindow: aBuilder [

	^ aBuilder pluggableWindowSpec new 
		model: self;
		label: #windowTitle;
		minimumExtent: SPOCApp minimumExtent;
		children: {self buildLoginPanel: aBuilder};
		defaultFocus: nil;
		yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> buildWith: aBuilder [

	^ aBuilder build: (self buildWindow: aBuilder)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/28/2024 14:55'
}
SPOCApp >> initialize [

	super initialize.
	
	self auth: SPOCAuthorizer new; registerOpenCommand.


]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> loginPanelContent [

	^ { SPOCUserLogin new app: self; yourself}
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> open [

	^ ToolBuilder open: self
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> registerOpenCommand [

	TheWorldMenu registerOpenCommand: {'Spotify Connect'. {self. #open}}.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> windowTitle [

	^ SPOCApp appName
]
