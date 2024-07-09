"
I build the Spotify Connect app window and hold all of its components.
"
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
	#category : #SpotifyConnect,
	#'squeak_changestamp' : 'OW 7/4/2024 12:28'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'RK 6/7/2024 10:51'
}
SPOCApp class >> appName [

	^ 'Spotify Connect'
]

{
	#category : #messages,
	#'squeak_changestamp' : 'TL 7/7/2024 02:03'
}
SPOCApp class >> devicePopUpMessage [

	^ 'Please activate your device!', String cr,
		'Open your Spotify App and play music or use the ''Devices'' button to choose a device.'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/20/2024 18:18'
}
SPOCApp class >> initialize [
	
	self registerOpenCommand
]

{
	#category : #messages,
	#'squeak_changestamp' : 'TL 7/7/2024 01:44'
}
SPOCApp class >> loginPopUpMessage [

	^ 'Please log in!'
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
	#category : #messages,
	#'squeak_changestamp' : 'TL 7/7/2024 01:51'
}
SPOCApp class >> volumePopUpMessage [

	^ 'Your device does not support volume changes.'
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
	#'squeak_changestamp' : 'TL 7/7/2024 01:52'
}
SPOCApp >> auth: aSPOCAuthorizer [

	auth := aSPOCAuthorizer
]

{
	#category : #ui,
	#'squeak_changestamp' : 'TL 7/7/2024 01:29'
}
SPOCApp >> bottomPanelContent [

	^ {self currentlyPlaying.
		self player.
		self switchDevice.
		self volumeSlider}
]

{
	#category : #ui,
	#'squeak_changestamp' : 'TL 7/8/2024 20:06'
}
SPOCApp >> buildBottomPanel: aBuilder [

	^ SPOCPluggableTablePanelSpec new model: self;
		tableLayoutProperties: (TableLayoutProperties new hResizing: #spaceFill;
			vResizing: #shrinkWrap;
			listDirection: #leftToRight;
			listCentering: #justified;
			wrapDirection: #bottomToTop);
		children: #bottomPanelContent;
		yourself
]

{
	#category : #ui,
	#'squeak_changestamp' : 'TL 7/8/2024 20:06'
}
SPOCApp >> buildCenterPanel: aBuilder [

	^ SPOCPluggableTablePanelSpec new model: self;
		tableLayoutProperties: (TableLayoutProperties new hResizing: #spaceFill;
			vResizing: #spaceFill);
		children: #centerPanelContent;
		yourself
]

{
	#category : #ui,
	#'squeak_changestamp' : 'TL 7/8/2024 20:06'
}
SPOCApp >> buildMainTable: aBuilder [

	^ SPOCPluggableTablePanelSpec new model: self;
		tableLayoutProperties: (TableLayoutProperties new listDirection: #topToBottom;
			cellInset: SPOCStyle defaultMargin;
			hResizing: #spaceFill;
			vResizing: #spaceFill);
		children: {self buildTopPanel: aBuilder.
			self buildCenterPanel: aBuilder.			
			self buildBottomPanel: aBuilder};
		yourself
]

{
	#category : #ui,
	#'squeak_changestamp' : 'TL 7/8/2024 20:06'
}
SPOCApp >> buildTopPanel: aBuilder [

	^ SPOCPluggableTablePanelSpec new model: self;
		tableLayoutProperties: (TableLayoutProperties new hResizing: #spaceFill;
			vResizing: #shrinkWrap;
			listDirection: #leftToRight;
			listCentering: #justified;
			cellPositioning: #topLeft);
		children: #topPanelContent;
		yourself
]

{
	#category : #ui,
	#'squeak_changestamp' : 'TL 7/8/2024 20:10'
}
SPOCApp >> buildWindow: aBuilder [

	^ aBuilder pluggableWindowSpec new model: self;
		 color: SPOCStyle spotifyBlack;
		 label: #windowTitle;
		 minimumExtent: self class minimumExtent;
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
	#'squeak_changestamp' : 'TL 7/7/2024 01:31'
}
SPOCApp >> componentsForUpdatingPlaybackState [

	^ {self currentlyPlaying.
		self player.
		self recentlyPlayed.
		self refresh.
		self resultList.
		self searchbar.
		self switchDevice.
		self volumeSlider}
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
	#'squeak_changestamp' : 'TL 7/7/2024 01:53'
}
SPOCApp >> currentlyPlaying: aSPOCCurrentlyPlaying [

	currentlyPlaying := aSPOCCurrentlyPlaying
]

{
	#category : #'pop-ups',
	#'squeak_changestamp' : 'TL 7/7/2024 01:32'
}
SPOCApp >> devicePopUp [

	UIManager inform: self class devicePopUpMessage
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/7/2024 01:35'
}
SPOCApp >> getPlaybackState [

	(Delay forSeconds: 0.6) wait.
	^ (SPOCApiPlaybackState new authorizer: self auth) getPlaybackState
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/7/2024 01:40'
}
SPOCApp >> initialize [

	super initialize.
	
	self auth: SPOCAuthorizer new; 
		setUpBottomPanelComponents;
		setUpCenterPanelComponents;
		setUpTopPanelComponents
		
		


]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 7/7/2024 01:44'
}
SPOCApp >> isDeviceActive [

	^ (self getPlaybackState class = SPOCApiEndpointResult) not
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 7/2/2024 18:00'
}
SPOCApp >> isUserAuthorized [

	^ self auth isAuthorized
]

{
	#category : #'pop-ups',
	#'squeak_changestamp' : 'TL 7/7/2024 01:44'
}
SPOCApp >> loginPopUp [

	UIManager inform: self class loginPopUpMessage
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 7/2/2024 19:23'
}
SPOCApp >> logout [

	self auth logout.
	self componentsForUpdatingPlaybackState do: [:aComponent | aComponent disable]
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 7/8/2024 16:39'
}
SPOCApp >> open [

	^ (ToolBuilder open: self)
		color: SPOCStyle spotifyBlack;
		borderColor: SPOCStyle spotifyBlack;
		paneColor: SPOCStyle spotifyBlack;
		yourself
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
	#'squeak_changestamp' : 'TL 7/7/2024 01:53'
}
SPOCApp >> player: aSPOCPlayer [

	player := aSPOCPlayer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/7/2024 01:47'
}
SPOCApp >> recentlyPlayed [

	^ recentlyPlayed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/7/2024 01:53'
}
SPOCApp >> recentlyPlayed: aSPOCRecentlyPlayed [

	recentlyPlayed := aSPOCRecentlyPlayed
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
	#'squeak_changestamp' : 'TL 7/7/2024 01:48'
}
SPOCApp >> refresh: aSPOCRefresh [

	refresh := aSPOCRefresh
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
	#'squeak_changestamp' : 'TL 7/7/2024 01:38'
}
SPOCApp >> setUpBottomPanelComponents [

	self setUpCurrentlyPlaying;
		setUpPlayer;
		setUpSwitchDevice;
		setUpVolumeSlider
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/7/2024 01:39'
}
SPOCApp >> setUpCenterPanelComponents [

	self setUpResultList
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
	#'squeak_changestamp' : 'TL 7/7/2024 01:37'
}
SPOCApp >> setUpTopPanelComponents [

	self setUpRecentlyPlayed;
		setUpRefresh;
		setUpSearchbar;
		setUpUserLogin
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/7/2024 01:48'
}
SPOCApp >> setUpUserLogin [

	self userLogin: (SPOCUserLogin new app: self).
	self auth registerSuccessCallback: [self userLogin toggleLogout.
		self updatePlaybackState]


]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/12/2024 02:54'
}
SPOCApp >> setUpVolumeSlider [

	self volumeSlider: (SPOCVolumeSlider new app: self)
]

{
	#category : #'pop-ups',
	#'squeak_changestamp' : 'VE 7/9/2024 10:39'
}
SPOCApp >> showPopUpFor: aUiComponent [
	
	(self isUserAuthorized not and: [aUiComponent needsLogin])
		ifTrue: [self loginPopUp.
			^ self].
	(self isDeviceActive not and: [aUiComponent needsActiveDevice])
		ifTrue: [self devicePopUp.
			^ self]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/7/2024 01:49'
}
SPOCApp >> switchDevice [

	^ switchDevice
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/7/2024 01:50'
}
SPOCApp >> switchDevice: aSPOCSwitchDevice [

	switchDevice := aSPOCSwitchDevice
]

{
	#category : #ui,
	#'squeak_changestamp' : 'TL 7/7/2024 01:55'
}
SPOCApp >> topPanelContent [

	^ {self searchbar.
		self recentlyPlayed.
		self refresh.
		self userLogin}
]

{
	#category : #updating,
	#'squeak_changestamp' : 'VE 7/9/2024 11:05'
}
SPOCApp >> updatePlaybackState [

	| playbackState |
	playbackState := self getPlaybackState.
	self componentsForUpdatingPlaybackState
		do: [:aComponent | aComponent updatePlaybackState: playbackState]
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
	#'squeak_changestamp' : 'TL 7/7/2024 01:51'
}
SPOCApp >> userLogin: aSPOCUserLogin [

	userLogin := aSPOCUserLogin
]

{
	#category : #'pop-ups',
	#'squeak_changestamp' : 'TL 7/7/2024 01:52'
}
SPOCApp >> volumePopUp [

	UIManager inform: self class volumePopUpMessage
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
	#'squeak_changestamp' : 'TL 7/7/2024 01:52'
}
SPOCApp >> volumeSlider: aSPOCVolumeSlider [

	volumeSlider := aSPOCVolumeSlider
]

{
	#category : #ui,
	#'squeak_changestamp' : 'TL 7/8/2024 20:10'
}
SPOCApp >> windowTitle [

	^ self class appName
]
