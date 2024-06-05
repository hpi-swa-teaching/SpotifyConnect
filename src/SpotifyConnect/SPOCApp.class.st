Class {
	#name : #SPOCApp,
	#superclass : #Model,
	#instVars : [
		'auth',
		'userLogin',
		'searchbar',
		'resultList',
		'player'
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
	#category : #start,
	#'squeak_changestamp' : 'VE 6/3/2024 09:12'
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
	#'squeak_changestamp' : 'VE 6/3/2024 13:58'
}
SPOCApp >> bottomPanelContent [
	^ {self player}
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 6/3/2024 10:13'
}
SPOCApp >> buildBottomPanel: aBuilder [

	^ SPOCPluggableTablePanelSpec new
		model: self;
		tableLayoutProperties: (TableLayoutProperties new
			listDirection: #leftToRight;
			listCentering: #center;
			wrapDirection: #bottomToTop;
			cellInset: SPOCStyle defaultMargin;
			hResizing: #spaceFill;
			vResizing: #shrinkWrap);
		children: #bottomPanelContent
]

{
	#category : #ui,
	#'squeak_changestamp' : 'RK 6/5/2024 21:30'
}
SPOCApp >> buildCenterPanel: aBuilder [

	^ SPOCPluggableTablePanelSpec new
		model: self;
		tableLayoutProperties: (TableLayoutProperties new
			hResizing: #spaceFill;
			vResizing: #spaceFill);
		children: #centerPanelContent
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 6/3/2024 10:24'
}
SPOCApp >> buildMainTable: aBuilder [
	
	^ SPOCPluggableTablePanelSpec new
		model: self;
		tableLayoutProperties: (TableLayoutProperties new
			listDirection: #topToBottom;
			cellInset: SPOCStyle defaultMargin;
			hResizing: #spaceFill;
			vResizing: #spaceFill);
		children: {self buildTopPanel: aBuilder.
			self buildCenterPanel: aBuilder.
			self buildBottomPanel: aBuilder.}.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 6/3/2024 10:29'
}
SPOCApp >> buildTopPanel: aBuilder [
		
	 ^ SPOCPluggableTablePanelSpec new
		model: self;
		tableLayoutProperties: (TableLayoutProperties new
			hResizing: #spaceFill;
			vResizing: #shrinkWrap;
			listDirection: #leftToRight;
			listCentering: #justified;
			cellPositioning: #topLeft);
		children: #topPanelContent
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 6/3/2024 08:57'
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
	#category : #ui,
	#'squeak_changestamp' : 'RK 6/5/2024 21:30'
}
SPOCApp >> centerPanelContent [
	^ {self resultList}
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/5/2024 21:31'
}
SPOCApp >> initialize [

	super initialize.
	
	self auth: SPOCAuthorizer new; 
		registerOpenCommand;
		setupUserLogin;
		setupSearchbar;
		setUpResultList;
		setupPlayer.


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
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> registerOpenCommand [

	TheWorldMenu registerOpenCommand: {'Spotify Connect'. {self. #open}}.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 21:29'
}
SPOCApp >> resultList [
	^ resultList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 21:29'
}
SPOCApp >> resultList: aSPOCResultList [
	resultList := aSPOCResultList
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
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/6/2024 01:40'
}
SPOCApp >> setUpResultList [

	self resultList: (SPOCResultList new app: self).
	self resultList updateTitle: 'Your Results'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/3/2024 14:04'
}
SPOCApp >> setupPlayer [

	self player: (SPOCPlayer new app: self; yourself).
	self auth registerSuccessCallback: [self player updateIsPlaying].
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
	#category : #ui,
	#'squeak_changestamp' : 'VE 6/3/2024 10:23'
}
SPOCApp >> topPanelContent [

	^ { self searchbar. self userLogin}
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
