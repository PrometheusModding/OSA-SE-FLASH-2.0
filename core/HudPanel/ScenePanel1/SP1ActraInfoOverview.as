

class SP1ActraInfoOverview extends MovieClip
{
	
public var o
public var dat
public var dia
public var actra

var panel
var menuTitle

var profileMode

var proDat

var VPin
var VPinCount

var statIcon
var statText
var totalCount

var HPoint
var VPinMax
var HPinPush

var spacer

var topBrass
var overview

var horizon

			public function SP1ActraInfoOverview(){	
				_x = dat.xPos
				_y = dat.yPos
				
				if(!actra.profile.has){profileMode = false}
				else{profileMode = true}
				
				panel = this
				proDat = actra.profile.profileData 

				horizon =-10
				makeOverlay()
				
				
			}
			
					
			public function makeOverlay(){
				
				
				topBrass = this.attachMovie("ProfileBrass", topBrass, this.getNextHighestDepth(), {_y:-250});				
				topBrass.o = o
				topBrass.horizon = horizon
				topBrass.dia = dia
				topBrass.actra = actra
				topBrass.proDat = proDat
				topBrass.profileMod = profileMode
				topBrass.buildFull()
				
				if(profileMode){
				overview = this.attachMovie("_profileOverview", overview, this.getNextHighestDepth(), {_y:0});				
				overview.horizon = horizon
				overview.o = o
				overview.dia = dia
				overview.actra = actra
				overview.proDat = proDat
				overview.profileMod = profileMode
				overview.buildFull()
				
				OADraw.OLine(this, 0, 0, 0, -300, "0xFFFFFF", .25)
				}else{
					
				topBrass._y = 0
				OADraw.OLine(this, 0, -85, 0, -170, "0xFFFFFF", .25)
				}
				
				
				
				}

}