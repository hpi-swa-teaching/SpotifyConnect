Class {
	#name : #SPOCApp,
	#superclass : #Model,
	#instVars : [
		'auth',
		'userLogin'
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
	#'squeak_changestamp' : 'VE 5/28/2024 20:52'
}
SPOCApp class >> minimalPanelSize [ 
	
	^ 1008@591 
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
	#category : #ui,
	#'squeak_changestamp' : 'VE 5/28/2024 20:23'
}
SPOCApp >> buildLoginPanel: aBuilder [
	| proportionalSize |
	proportionalSize := self proportionalPanelSizeOf: self userLogin.
	^ aBuilder pluggablePanelSpec new
		model: self;
		children: #loginPanelContent;
		layout: #proportional;
		frame: (LayoutFrame fractions: ((1-proportionalSize x)@0 corner: 1@proportionalSize y));
		yourself
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 5/28/2024 20:25'
}
SPOCApp >> buildWindow: aBuilder [

	^ aBuilder pluggableWindowSpec new 
		model: self;
		label: #windowTitle;
		minimumExtent: SPOCApp minimumExtent;
		children: {self buildLoginPanel: aBuilder};
		yourself.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> buildWith: aBuilder [

	^ aBuilder build: (self buildWindow: aBuilder)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/28/2024 20:00'
}
SPOCApp >> initialize [

	super initialize.
	
	self auth: SPOCAuthorizer new; 
		registerOpenCommand;
		userLogin: (SPOCUserLogin new app: self; yourself).


]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 5/28/2024 19:59'
}
SPOCApp >> loginPanelContent [

	^ {self userLogin}
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> open [

	^ ToolBuilder open: self
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 5/28/2024 20:26'
}
SPOCApp >> proportionalPanelSizeOf: aMorph [

	^ aMorph extent / SPOCApp minimalPanelSize
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> registerOpenCommand [

	TheWorldMenu registerOpenCommand: {'Spotify Connect'. {self. #open}}.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 19:59'
}
SPOCApp >> userLogin [
	^ userLogin
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 19:59'
}
SPOCApp >> userLogin: anObject [
	userLogin := anObject
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> windowTitle [

	^ SPOCApp appName
]
