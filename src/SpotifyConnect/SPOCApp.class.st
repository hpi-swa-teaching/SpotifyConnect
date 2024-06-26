Class {
	#name : #SPOCApp,
	#superclass : #Model,
	#instVars : [
		'auth',
		'currentlyPlaying',
		'player',
		'recentlyPlayed',
		'refresh',
		'resultList',
		'searchbar',
		'switchDevice',
		'userLogin',
		'volumeSlider'
	],
	#category : #SpotifyConnect
}

{
	#category : #constants,
	#'squeak_changestamp' : 'RK 6/7/2024 10:51'
}
SPOCApp class >> appName [

	^ 'Spotify Connect'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/20/2024 18:18'
}
SPOCApp class >> initialize [
	
	self registerOpenCommand
]

{
	#category : #start,
	#'squeak_changestamp' : 'RK 6/7/2024 10:51'
}
SPOCApp class >> minimumExtent [

	^ 1080 @ 720
]

{
	#category : #start,
	#'squeak_changestamp' : 'RK 6/7/2024 10:51'
}
SPOCApp class >> open [

	self new open
]

{
	#category : #start,
	#'squeak_changestamp' : 'VE 6/20/2024 18:18'
}
SPOCApp class >> registerOpenCommand [

	TheWorldMenu registerOpenCommand: {'Spotify Connect'. {self. #open}}
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
	#'squeak_changestamp' : 'VE 6/10/2024 22:48'
}
SPOCApp >> bottomPanelContent [

	^ {self currentlyPlaying. self player. self switchDevice. self volumeSlider.}
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 6/10/2024 22:31'
}
SPOCApp >> buildBottomPanel: aBuilder [

	^ SPOCPluggableTablePanelSpec new
		model: self;
		tableLayoutProperties: (TableLayoutProperties new
			hResizing: #spaceFill;
			vResizing: #shrinkWrap;
			listDirection: #leftToRight;
			listCentering: #justified;
			wrapDirection: #bottomToTop);
		children: #bottomPanelContent
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 6/10/2024 14:47'
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
	#'squeak_changestamp' : 'TL 6/10/2024 03:48'
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
			self buildBottomPanel: aBuilder}
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
	#'squeak_changestamp' : 'VE 6/20/2024 18:22'
}
SPOCApp >> buildWindow: aBuilder [

	^ aBuilder pluggableWindowSpec new 
		model: self;
		color: SPOCStyle spotifyBlack;
		label: #windowTitle;
		minimumExtent: SPOCApp minimumExtent;
		children: {self buildMainTable: aBuilder};
		yourself
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 6/20/2024 18:33'
}
SPOCApp >> buildWith: aBuilder [

	^ aBuilder build: (self buildWindow: aBuilder)
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 6/10/2024 14:04'
}
SPOCApp >> centerPanelContent [

	^ {self resultList}
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 6/26/2024 13:59'
}
SPOCApp >> componentsForUpdatingPlaybackState [

	^ {currentlyPlaying. player. resultList. volumeSlider. recentlyPlayed. switchDevice}
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 12:17'
}
SPOCApp >> currentlyPlaying [

	^ currentlyPlaying
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 12:17'
}
SPOCApp >> currentlyPlaying: anObject [

	currentlyPlaying := anObject
]

{
	#category : #'pop-ups',
	#'squeak_changestamp' : 'TL 6/18/2024 12:25'
}
SPOCApp >> devicePopUp [

	UIManager inform: 'Please activate your device!', String cr, 'Open your Spotify App and play music or use the ''Devices'' button to choose a device.'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'VE 6/26/2024 14:24'
}
SPOCApp >> getPlaybackState [

	| apiEndpoint |
	(Delay forSeconds: 0.6) wait.
	apiEndpoint := SPOCApiPlaybackState new
		authorizer: self auth;
		yourself.
	^ apiEndpoint getPlaybackState
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/20/2024 18:18'
}
SPOCApp >> initialize [

	super initialize.
	
	self auth: SPOCAuthorizer new; 
		setUpUserLogin;
		setUpCurrentlyPlaying;
		setUpPlayer;
		setUpRecentlyPlayed;
		setUpRefresh;
		setUpResultList;
		setUpSearchbar;
		setUpSwitchDevice;		
		setUpVolumeSlider
		
		


]

{
	#category : #'pop-ups',
	#'squeak_changestamp' : 'TL 6/10/2024 19:30'
}
SPOCApp >> loginPopUp [

	UIManager inform: 'Please log in!'
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 6/20/2024 19:00'
}
SPOCApp >> open [

	| a |
	a := ToolBuilder open: self.
	a color: SPOCStyle spotifyBlack.
	a borderColor: SPOCStyle spotifyBlack.
	a paneColor: SPOCStyle spotifyBlack.
	^ a
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:49'
}
SPOCApp >> player [

	^ player
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:49'
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
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/9/2024 13:16'
}
SPOCApp >> recentlyPlayed [
	^ recentlyPlayed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/9/2024 13:16'
}
SPOCApp >> recentlyPlayed: anObject [
	recentlyPlayed := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/18/2024 23:19'
}
SPOCApp >> refresh [

	^ refresh
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/18/2024 23:19'
}
SPOCApp >> refresh: anObject [

	refresh := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:49'
}
SPOCApp >> resultList [

	^ resultList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:49'
}
SPOCApp >> resultList: aSPOCResultList [

	resultList := aSPOCResultList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:49'
}
SPOCApp >> searchbar [

	^ searchbar
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:49'
}
SPOCApp >> searchbar: aSPOCSearchbar [

	searchbar := aSPOCSearchbar
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/12/2024 02:54'
}
SPOCApp >> setUpCurrentlyPlaying [

	self currentlyPlaying: (SPOCCurrentlyPlaying new app: self)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/12/2024 02:54'
}
SPOCApp >> setUpPlayer [

	self player: (SPOCPlayer new app: self)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/12/2024 02:54'
}
SPOCApp >> setUpRecentlyPlayed [

	self recentlyPlayed: (SPOCRecentlyPlayed new app: self)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/18/2024 23:21'
}
SPOCApp >> setUpRefresh [

	self refresh: (SPOCRefresh new app: self)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/7/2024 11:25'
}
SPOCApp >> setUpResultList [

	self resultList: (SPOCResultList new app: self)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/12/2024 02:58'
}
SPOCApp >> setUpSearchbar [

	self searchbar: (SPOCSearchbar new app: self)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/10/2024 19:08'
}
SPOCApp >> setUpSwitchDevice [

	self switchDevice: (SPOCSwitchDevice new app: self)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/19/2024 01:26'
}
SPOCApp >> setUpUserLogin [

	self userLogin: (SPOCUserLogin new app: self).
	self auth registerSuccessCallback: [self userLogin toggleLogout.
		self updateComponentsWith: self getPlaybackState andDisabled: true]


]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/12/2024 02:54'
}
SPOCApp >> setUpVolumeSlider [

	self volumeSlider: (SPOCVolumeSlider new app: self)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/9/2024 16:42'
}
SPOCApp >> switchDevice [
	^ switchDevice
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/9/2024 16:42'
}
SPOCApp >> switchDevice: anObject [
	switchDevice := anObject
]

{
	#category : #ui,
	#'squeak_changestamp' : 'TL 6/18/2024 23:26'
}
SPOCApp >> topPanelContent [

	^ { self searchbar. self recentlyPlayed. self refresh. self userLogin}
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 6/26/2024 14:25'
}
SPOCApp >> updateComponentsWith: aState andDisabled: aBoolean [

	self componentsForUpdatingPlaybackState do: [:aComponent | 
		aComponent disabled: aBoolean.
		aComponent updatePlaybackState: aState]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 6/19/2024 01:26'
}
SPOCApp >> updatePlaybackState [

	| playbackState |
	self auth isAuthorized
		ifTrue: [playbackState := self getPlaybackState.
			playbackState class = SPOCApiEndpointResult
				ifTrue: [self devicePopUp]
				ifFalse: [self updateComponentsWith: playbackState andDisabled: false]]
		ifFalse: [self loginPopUp]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:50'
}
SPOCApp >> userLogin [

	^ userLogin
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 03:50'
}
SPOCApp >> userLogin: anObject [

	userLogin := anObject
]

{
	#category : #'pop-ups',
	#'squeak_changestamp' : 'TL 6/12/2024 04:00'
}
SPOCApp >> volumePopUp [

	UIManager inform: 'Your device does not support volume changes.'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 02:56'
}
SPOCApp >> volumeSlider [

	^ volumeSlider
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 02:56'
}
SPOCApp >> volumeSlider: anObject [

	volumeSlider := anObject
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> windowTitle [

	^ SPOCApp appName
]
