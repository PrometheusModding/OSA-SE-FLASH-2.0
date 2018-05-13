

class SP1ActraInfoTechnical extends MovieClip
{
	
public var o
public var dat
public var dia
public var actra

var panel
var menuTitle

var topBrass
var technical

var profileMode
var proDat
var horizon
			public function SP1ActraInfoTechnical(){	
				_x = dat.xPos
				_y = dat.yPos
				panel = this
				
				if(!actra.profile.has){profileMode = false}
				else{profileMode = true}
				
				
				proDat = actra.profile.profileData 

				horizon =-10
				
				makeOverlay()
			
			}
			
			
			function makeOverlay(){
				topBrass = this.attachMovie("ProfileBrass", topBrass, this.getNextHighestDepth(), {_y:-310});				
				topBrass.horizon = horizon
				topBrass.o = o
				topBrass.dia = dia
				topBrass.actra = actra
				topBrass.proDat = proDat
				topBrass.profileMod = profileMode
				topBrass.buildShort()
				

				technical = this.attachMovie("_profileTechnical", technical, this.getNextHighestDepth(), {});				
				technical.horizon = horizon
				technical.o = o
				technical.dia = dia
				technical.actra = actra
				technical.proDat = proDat
				technical.profileMod = profileMode
				technical.buildFull()

				OADraw.OLine(this, 0, 0, 0, -310, "0xFFFFFF", .25)			
				
				
			}
					
			
			
			
			
}