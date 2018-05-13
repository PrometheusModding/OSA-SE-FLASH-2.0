

class SP1ActraInfoProportions extends MovieClip
{
	
public var o
public var dat
public var dia
public var actra

var panel
var menuTitle

var proDat
var purityMode
var profileMode
var horizon

var topBrass
var proportions

			public function SP1ActraInfoProportions(){	
				_x = dat.xPos
				_y = dat.yPos
				
				if (o.lib.PLib.get(dia.module.id).menuflags[0].maturecontent){
					purityMode = false
				}else{purityMode = true}

				if(!actra.profile.has){profileMode = false}
				else{profileMode = true}
				
				panel = this
				proDat = actra.profile.profileData 

				horizon =-10
				makeOverlay()

			
			}
			
			
			public function makeOverlay(){	
				topBrass = this.attachMovie("ProfileBrass", topBrass, this.getNextHighestDepth(), {_y:-390});				
				topBrass.horizon = horizon
				topBrass.o = o
				topBrass.dia = dia
				topBrass.actra = actra
				topBrass.proDat = proDat
				topBrass.profileMod = profileMode
				topBrass.buildShort()
				

				proportions = this.attachMovie("_profileProportions", proportions, this.getNextHighestDepth(), {});				
				proportions.horizon = horizon
				proportions.purityMode = purityMode
				proportions.cmd = dat.cmd
				proportions.o = o
				proportions.dia = dia
				proportions.actra = actra
				proportions.proDat = proDat
				proportions.profileMod = profileMode
				proportions.buildFull()
				
				if(purityMode){
					topBrass._y=-255
					OADraw.OLine(this, 0, 0, 0, -255, "0xFFFFFF", .25)		
				}else{
				OADraw.OLine(this, 0, 0, 0, -390, "0xFFFFFF", .25)			
				}
				
			}


}