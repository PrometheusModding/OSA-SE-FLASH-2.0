

class core.panel.inspect.info extends MovieClip {


public var o
public var m



var actra

var buildO
var posO

var buttonFont

var description
var brass
var display

	function info(){
		
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 10
		
		actra = m.actra
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.inspect.brass.typeA(o, m, this, posO, o.cfg.lang.info.toUpperCase())
		
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{b:"omu_backmenu"}, tx:{desc:o.cfg.lang.exit.toUpperCase()}}) 		
		dataO.push({cmd:{fn:"adv", out:"inspectInfoPersona"}, bt:{b:"omu_persona"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.persona.toUpperCase()}})
		dataO.push({cmd:{fn:"adv", out:"inspectInfoBody"}, bt:{b:"omu_bodyscale"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.body.toUpperCase()}})

		dataO.push({cmd:{fn:"", out:""}, bt:{b:"omu_personpaint"}, hud:{sy:"oconMiniCircle", panel:"_infoActorGraphics"}, tx:{desc:o.cfg.lang.graphics.toUpperCase()}})
		dataO.push({cmd:{fn:"", out:"sceneInfoActorTechnical"}, bt:{b:"omu_info"}, hud:{sy:"oconMiniCircle", panel:"_infoActorTechnical"}, tx:{desc:o.cfg.lang.technical.toUpperCase()}})
		if(o.cfg.config.logging){
		dataO.push({cmd:{fn:"adv", out:"inspectInfoLog"}, bt:{b:"omu_log"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.logging.toUpperCase()}})
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
		display = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "option", this.getNextHighestDepth(), {o:o, actra:actra, horizon:posO.h-55})
		display._y-=72
		display._x-=42
		display.buildFull()
	}

}