

class SP1ActraInfoSounds extends MovieClip
{

public var o
public var dat
public var dia
public var actra

var panel
var menuTitle

var purityMode

var topBrass
var sounds
var horizon
var profileMode
var proDat

			public function SP1ActraInfoSounds(){	
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
				topBrass = this.attachMovie("ProfileBrass", topBrass, this.getNextHighestDepth(), {_y:-340});				
				topBrass.horizon = horizon
				topBrass.o = o
				topBrass.dia = dia
				topBrass.actra = actra
				topBrass.proDat = proDat
				topBrass.profileMod = profileMode
				topBrass.buildShort()
				

				sounds = this.attachMovie("_profileSounds", sounds, this.getNextHighestDepth(), {});				
				sounds.horizon = horizon
				sounds.o = o
				sounds.dia = dia
				sounds.actra = actra
				sounds.proDat = proDat
				sounds.profileMod = profileMode
				sounds.buildFull()

				OADraw.OLine(this, 0, 0, 0, -340, "0xFFFFFF", .25)			
				
				
			}
			
			public function makeValues(){

				panel.voVal.htmlText = actra.voice.vo.formSuite.name
				panel.ivoVal.htmlText = actra.voice.ivo.formSuite.name
				panel.ivosVal.htmlText = actra.voice.ivos.formSuite.name
				panel.wvoVal.htmlText = actra.voice.wvo.formSuite.name
				
				if(actra.voice.vo.formSuite.credit){panel.voArt.htmlText = actra.voice.vo.formSuite.credit}
				else{panel.voArt.htmlText = ""}
				if(actra.voice.ivo.formSuite.credit){panel.ivoArt.htmlText = actra.voice.ivo.formSuite.credit}
				else{panel.ivoArt.htmlText = ""}
				if(actra.voice.ivos.formSuite.credit){panel.ivosArt.htmlText = actra.voice.ivos.formSuite.credit}
				else{panel.ivosArt.htmlText = ""}
				if(actra.voice.wvo.formSuite.credit){panel.wvoArt.htmlText = actra.voice.wvo.formSuite.credit}
				else{panel.wvoArt.htmlText = ""}
				
			}
			
			
			
}