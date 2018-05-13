

class core.panel.inspect.persona extends MovieClip {


public var o
public var m




var buildO
var posO

var buttonFont

var description
var brass
var display

		function persona(){
		
				if(!m.actra.dat.personaData){
				var scout = new Scout(o)
				var sourceBack = {fn:dataLoaded, scope:this}
				scout.retrieveActraData("persona", m.actra, sourceBack)
				}else{dataLoaded()}
		
		}				
		
		public function dataLoaded(){

		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 10
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.inspect.brass.typeA(o, m, this, posO, o.cfg.lang.persona.toUpperCase())
		
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		
		if(o.cfg.config.purityMode == 0){
		dataO.push({hud:{panel:"_profileSounds"}, bt:{b:""}, tx:{desc:o.cfg.lang.sounds.toUpperCase()+" | "+o.cfg.lang.intimate.toUpperCase()}})
		dataO.push({hud:{panel:"_profilePersonaClass"}, bt:{b:""}, tx:{desc:o.cfg.lang.personaClass.toUpperCase()+" | "+o.cfg.lang.intimate.toUpperCase()}})
		dataO.push({hud:{panel:"_profileReaction"}, bt:{b:""}, tx:{desc:o.cfg.lang.reaction.toUpperCase()+" | "+o.cfg.lang.intimate.toUpperCase()}})
		
		}
		
		
		
		var btGlobal = {xs:60, hxs:75, menuPanel:m, lineThickness:2, lineColor:"0xFFFFFF", fillColor:""}
		
		for (var i=0; i < dataO.length; i++){
			if(buildO.col < buildO.maxCol){
			buildO.buttons[i] = this.attachMovie("oconMiniCircle", "option", this.getNextHighestDepth(), {o:o, _x:posO.h, _y:posO.v, posO:posO, dataO:dataO[i], btGlobal:btGlobal})
			posO.v += posO.vOff
			buildO.col++
			}else{
			buildO.row++
			buildO.col=0
			posO.v = posO.vStart
			posO.h += posO.hOff
			i--
			}
		}
		

		buildO.concludeSetup()
		processShift()
	}	
	

	function targ(){

	}
	
	function DY(){
	   this[buildO.buttons[buildO.point].dataO.cmd.fn]()
	}
	
	function DN(){
	   o.xplat.sysoi("menuback")
	   m.escape()
	}
	function esc(){DN()}
	
	function adv(){
	o.xplat.sysoi("menuforward")
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	function DU(){buildO.DU();processShift();o.xplat.sysoi("moves")}
	
	function DD(){buildO.DD();processShift();o.xplat.sysoi("moves")}
	
	function DL(){buildO.DL();processShift();o.xplat.sysoi("moves")}
	
	function DR(){buildO.DR();processShift();o.xplat.sysoi("moves")}
	
	function processShift(){
		brass.setDescription(buildO.buttons[buildO.point].dataO.tx.desc.toUpperCase())
		makeDisplay()
	}
	
	function makeDisplay(){
		display.removeMovieClip()
		display = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "option", this.getNextHighestDepth(), {o:o, actra:m.actra, horizon:posO.h-55})
		display._y-=72
		display.buildFull()
	}

}