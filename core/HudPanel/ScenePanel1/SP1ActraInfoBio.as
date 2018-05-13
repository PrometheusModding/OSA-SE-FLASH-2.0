

class SP1ActraInfoBio extends MovieClip
{
	
public var o
public var dat
public var dia
public var actra

var panel
var menuTitle

var topBrass
var bio
var id

var profileMode
var proDat
var horizon
			public function SP1ActraInfoBio(){	
				_x = dat.xPos
				_y = dat.yPos
				panel = this
				id = "biography"				
				if(!actra.profile.has){profileMode = false}
				else{profileMode = true}
				
				
				proDat = actra.profile.profileData 

				horizon =-10
				
				makeOverlay()
			
			}
			
			
			function makeOverlay(){
				topBrass = this.attachMovie("ProfileBrass", topBrass, this.getNextHighestDepth(), {_y:0});				
				topBrass.horizon = horizon
				topBrass.o = o
				topBrass.dia = dia
				topBrass.actra = actra
				topBrass.proDat = proDat
				topBrass.profileMod = profileMode
				topBrass.buildShort()
				
				if(proDat.biography){
				bio = this.attachMovie("_profileBio", bio, this.getNextHighestDepth(), {});				
				bio.horizon = horizon
				bio.o = o
				bio.dia = dia
				bio.actra = actra
				bio.proDat = proDat
				bio.profileMod = profileMode
				bio.buildFull()

				topBrass._y = bio.ySave-20+50
				OADraw.OLine(this, 0, 50, 0, bio.ySave+50, "0xFFFFFF", .25)			
				}
				
				else{
				
				var type = new TextFormat();
				type.letterSpacing = 1.1
				type.font = o.fonts.l
				type.size = 13
				
				var cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:-70}).val	
				cur.htmlText = actra.name+" "+o.cfg.lang.actorHasNoBio
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				
				topBrass._y = -80
				OADraw.OLine(this, 0, 0, 0, -100, "0xFFFFFF", .25)	
					
				}
				
			}
					
			
			
			
			
}