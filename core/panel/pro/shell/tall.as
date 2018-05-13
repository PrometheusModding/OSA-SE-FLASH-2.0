

class core.panel.pro.shell.tall extends MovieClip
{
	
public var o
public var actra
public var xml
public var prodat
var panel
var menuTitle

var profileMode


var VPin
var VPinCount

var statIcon
var statText
var totalCount

var HPoint
var VPinMax
var HPinPush

var spacer

var frame0

var horizon

			public function tall(){	
				
				if(!actra.profile.has){profileMode = false}
				else{profileMode = true}
				
				panel = this
				prodat = actra.profile.profileData 

				horizon =-10
				makeOverlay()
				
				
			}
			
					
			public function makeOverlay(){
				
				
				if(profileMode){
				frame0 = this.attachMovie("proframe"+xml.frame[0].type, frame0, this.getNextHighestDepth(), {o:o, actra:actra, xml:xml, frame:xml.frame[0], prodat:prodat, _y:0});				
				frame0.horizon = horizon
				frame0.profileMod = profileMode
				frame0.tall()
				
					if(frame0.matchline){OADraw.OLine(this, 0, 0, 0, frame0.matchline.tall, frame0.matchline.color, frame0.matchline.thickness)}
					else{OADraw.OLine(this, 0, 0, 0, -300, "0xFFFFFF", .25)}
				
				}else{

				OADraw.OLine(this, 0, -85, 0, -170, "0xFFFFFF", .25)
				}

				
				
				}

}