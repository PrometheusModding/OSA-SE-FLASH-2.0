

class SP1ActraInfoEquipment extends MovieClip
{
	
public var o
public var dat
public var dia
public var actra

var panel
var menuTitle

var topBrass
var equipment

var profileMode
var proDat
var horizon
			public function SP1ActraInfoEquipment(){	
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
				topBrass = this.attachMovie("ProfileBrass", topBrass, this.getNextHighestDepth(), {_y:-380});				
				topBrass.horizon = horizon
				topBrass.o = o
				topBrass.dia = dia
				topBrass.actra = actra
				topBrass.proDat = proDat
				topBrass.profileMod = profileMode
				topBrass.buildShort()
				

				equipment = this.attachMovie("EquipmentSlotFull", equipment, this.getNextHighestDepth(), {});				
				equipment.horizon = horizon
				equipment.o = o
				equipment.dia = dia
				equipment.actra = actra
				equipment.proDat = proDat
				equipment.profileMod = profileMode
				equipment.buildFull()

				
				var lineHeight = equipment.maxHeight
				
				if(lineHeight < -380){lineHeight = 0-380}
				topBrass._y = lineHeight
				OADraw.OLine(this, 0, 0, 0, lineHeight, "0xFFFFFF", .25)			
				
				
			}
					
			
			
			
			
}