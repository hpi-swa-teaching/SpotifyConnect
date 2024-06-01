Class {
	#name : #SPOCApp,
	#superclass : #Model,
	#instVars : [
		'auth',
		'userLogin',
		'searchbar'
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
	#'squeak_changestamp' : 'VE 5/28/2024 21:38'
}
SPOCApp >> buildLoginPanel: aBuilder [
	| proportionalSize |
	proportionalSize := self proportionalPanelSizeOf: self userLogin.
	^ aBuilder pluggablePanelSpec new
		model: self;
		children: #loginPanelContent;
		layout: #proportional;
		frame: (LayoutFrame fractions: (0.9@0 corner: 1@proportionalSize y));
		yourself
]

{
	#category : #ui,
	#'squeak_changestamp' : 'RK 6/1/2024 19:31'
}
SPOCApp >> buildSearchbarPanel: aBuilder [
	| proportionalSize |
	proportionalSize := self proportionalPanelSizeOf: self searchbar.
	^ aBuilder pluggablePanelSpec new
		model: self;
		children: #searchbarPanelContent;
		layout: #proportional;
		frame: (LayoutFrame fractions: (0.1@0 corner: 0.85@proportionalSize y));
		yourself
]

{
	#category : #ui,
	#'squeak_changestamp' : 'RK 5/30/2024 22:12'
}
SPOCApp >> buildWindow: aBuilder [

	^ aBuilder pluggableWindowSpec new 
		model: self;
		label: #windowTitle;
		minimumExtent: SPOCApp minimumExtent;
		children: {self buildLoginPanel: aBuilder.
			self buildSearchbarPanel: aBuilder};
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
	#'squeak_changestamp' : 'RK 5/30/2024 21:57'
}
SPOCApp >> initialize [

	super initialize.
	
	self auth: SPOCAuthorizer new; 
		registerOpenCommand;
		setupUserLogin;
		setupSearchbar.


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
	#'squeak_changestamp' : 'RK 5/30/2024 21:27'
}
SPOCApp >> searchbar [
	^ searchbar
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/30/2024 21:34'
}
SPOCApp >> searchbar: aSPOCSearchbar [
	searchbar := aSPOCSearchbar
]

{
	#category : #ui,
	#'squeak_changestamp' : 'RK 5/30/2024 22:03'
}
SPOCApp >> searchbarPanelContent [

	^ {self searchbar}
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 5/30/2024 21:34'
}
SPOCApp >> setupSearchbar [

	self searchbar: (SPOCSearchbar new app: self; yourself)
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
