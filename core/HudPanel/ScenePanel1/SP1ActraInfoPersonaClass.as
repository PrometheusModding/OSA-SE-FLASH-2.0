

class SP1ActraInfoPersonaClass extends MovieClip
{
	
public var o
public var dat
public var dia
public var actra

var panel
var menuTitle

var purityMode

var topBrass
var personaClass
var horizon
var profileMode
var proDat

			public function SP1ActraInfoPersonaClass(){	
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
				topBrass = this.attachMovie("ProfileBrass", topBrass, this.getNextHighestDepth(), {_y:-270});				
				topBrass.horizon = horizon
				topBrass.o = o
				topBrass.dia = dia
				topBrass.actra = actra
				topBrass.proDat = proDat
				topBrass.profileMod = profileMode
				topBrass.buildShort()
				

				personaClass = this.attachMovie("_profilePersonaClass", personaClass, this.getNextHighestDepth(), {});				
				personaClass.horizon = horizon
				personaClass.o = o
				personaClass.dia = dia
				personaClass.actra = actra
				personaClass.proDat = proDat
				personaClass.profileMod = profileMode
				personaClass.buildFull()

				OADraw.OLine(this, 0, 0, 0, -270, "0xFFFFFF", .25)			
				
				
			}

}