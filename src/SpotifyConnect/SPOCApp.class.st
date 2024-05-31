Class {
	#name : #SPOCApp,
	#superclass : #Model,
	#instVars : [
		'auth',
		'player',
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
	#'squeak_changestamp' : 'TL 5/31/2024 17:29'
}
SPOCApp >> buildPlayerPanel: aBuilder [

	| proportionalSize |
	proportionalSize := self proportionalPanelSizeOf: self player.
	^ aBuilder pluggablePanelSpec new
		model: self;
		children: #playerPanelContent;
		layout: #proportional;
		frame: (LayoutFrame fractions: (0.1@0 corner: 1@proportionalSize y));
		yourself
]

{
	#category : #ui,
	#'squeak_changestamp' : 'TL 5/31/2024 17:29'
}
SPOCApp >> buildWindow: aBuilder [

	^ aBuilder pluggableWindowSpec new 
		model: self;
		label: #windowTitle;
		minimumExtent: SPOCApp minimumExtent;
		children: {self buildLoginPanel: aBuilder.
			self buildPlayerPanel: aBuilder};
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
	#'squeak_changestamp' : 'TL 5/30/2024 23:56'
}
SPOCApp >> initialize [

	super initialize.
	
	self auth: SPOCAuthorizer new; 
		registerOpenCommand;
		setupUserLogin;
		setupPlayer


]

{
	#category : #ui,
	#'squeak_changestamp' : 'TL 5/31/2024 00:03'
}
SPOCApp >> loginPanelContent [

	^ {self userLogin, self player}
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> open [

	^ ToolBuilder open: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/30/2024 11:49'
}
SPOCApp >> player [
	^ player
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/30/2024 11:49'
}
SPOCApp >> player: anObject [
	player := anObject
]

{
	#category : #ui,
	#'squeak_changestamp' : 'TL 5/31/2024 17:32'
}
SPOCApp >> playerPanelContent [

	^ {self player}
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
	#category : #initialization,
	#'squeak_changestamp' : 'TL 5/30/2024 12:23'
}
SPOCApp >> setupPlayer [

	self player: (SPOCPlayer new app: self; yourself).
	self auth registerSuccessCallback: [self player enableButtons].
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
