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
	#'squeak_changestamp' : 'VE 5/31/2024 00:03'
}
SPOCApp >> buildMainTable: aBuilder [
	
	^ SPOCPluggableTablePanel new
		model: self;
		tableLayoutProperties: (TableLayoutProperties new
			listDirection: #topToBottom);
		children: {SPOCPluggableTablePanel new
			model: self;
			tableLayoutProperties: (TableLayoutProperties new
				listDirection: #rightToLeft;
				layoutInset: 15);
			children: #loginPanelContent}.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 5/30/2024 23:50'
}
SPOCApp >> buildWindow: aBuilder [

	^ aBuilder pluggableWindowSpec new 
		model: self;
		label: #windowTitle;
		minimumExtent: SPOCApp minimumExtent;
		children: {self buildMainTable: aBuilder};
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
	#'squeak_changestamp' : 'VE 5/28/2024 21:24'
}
SPOCApp >> initialize [

	super initialize.
	
	self auth: SPOCAuthorizer new; 
		registerOpenCommand;
		setupUserLogin.


]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 5/31/2024 00:07'
}
SPOCApp >> loginPanelContent [

	^ {self userLogin. SPOCSearchbar new}
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
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> registerOpenCommand [

	TheWorldMenu registerOpenCommand: {'Spotify Connect'. {self. #open}}.

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/28/2024 21:34'
}
SPOCApp >> setupUserLogin [

	self userLogin: (SPOCUserLogin new app: self; yourself).
	self auth registerSuccessCallback: [self userLogin toggleLogout].


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
