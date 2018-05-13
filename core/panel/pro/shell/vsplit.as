

class core.panel.pro.shell.vsplit extends MovieClip
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

var frame1
var frame0

var horizon

			public function vsplit(){	
				panel = this
				horizon =-10
				prodat = actra.profile.profileData 
				makeOverlay()				
			}
			
					
			public function makeOverlay(){
				
				
				frame1 = this.attachMovie("proframe"+xml.frame[0].type, frame1, this.getNextHighestDepth(), {o:o, actra:actra, xml:xml, frame:xml.frame[0], prodat:prodat, _y:-250});				
				frame1.horizon = horizon
				frame1.profileMod = profileMode
				frame1.vsplit()
				

				frame0 = this.attachMovie("proframe"+xml.frame[1].type, frame0, this.getNextHighestDepth(), {o:o, actra:actra, xml:xml, frame:xml.frame[1], prodat:prodat, _y:0});				
				frame0.horizon = horizon
				frame0.profileMod = profileMode
				frame0.vsplit()
				
					if(frame0.matchline){OADraw.OLine(this, 0, 0, 0, frame0.matchline.tall, frame0.matchline.color, frame0.matchline.thickness)}
					else{OADraw.OLine(this, 0, 0, 0, -300, "0xFFFFFF", .25)}

				
				frame1._y = (-frame0.frameHeight)-25
				
				
				}


}