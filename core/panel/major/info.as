

class core.panel.major.info extends MovieClip {


public var o
public var m




var buildO
var posO

var buttonFont

var description
var brass
var display

	function info(){
		display = []
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 9
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang.info, "")
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		
		
		dataO.push({hud:{panel:"_majorOSAInfo"}, bt:{b:"omu_osa"}, tx:{desc:"OSA"}})
		dataO.push({hud:{panel:"_majorCredits"}, bt:{b:"omu_osacredits"}, tx:{desc:o.cfg.lang.credits.toUpperCase()}})
		dataO.push({cmd:{fn:"adv", out:"majorInfoLogs"}, bt:{b:"omu_log"}, tx:{desc:o.cfg.lang.log.toUpperCase()}})	
		
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
		core.panel.util.fx.PIFXreveal_basic(buildO.buttons)
	}	
	

	
	function DY(){
	   this[buildO.buttons[buildO.point].dataO.cmd.fn]()
	}
	
	function DN(){
	   o.xplat.sysoi("menuback")
	   m.escape()
	}
	
	function adv(){
	o.xplat.sysoi("menuforward")
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	function esc(){
	o.xplat.sysoi("menuback")
	m.escape()
	}
	
	function targ(){
	o.xplat.sysoi("confirmm")
	o.skyString("0SA_Targeting", buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	function DU(){buildO.DU();processShift();o.xplat.sysoi("moves")}
	
	function DD(){buildO.DD();processShift();o.xplat.sysoi("moves")}
	
	function DL(){buildO.DL();processShift();o.xplat.sysoi("moves")}
	
	function DR(){buildO.DR();processShift();o.xplat.sysoi("moves")}
	
	function processShift(){
		brass.setDescription(buildO.buttons[buildO.point].dataO.tx.desc.toUpperCase())
				makeDisplay()
	}
	
	function revisit(){
			core.panel.util.fx.PIFXback_basic(buildO.buttons)
	}
	
	function makeDisplay(){
		display.removeMovieClip()
		display = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "displayPanel", this.getNextHighestDepth(), {o:o, actra:m.actra, horizon:posO.h-55})
		display._y-=72
		display._x-=50
		display.buildFull()
		
		if(display){
		core.panel.util.fx.PFXreveal_basic(display)
		}
		
	}
	
	function appear(){
		core.panel.util.fx.PIFXreveal_basic(buildO.buttons)
		core.panel.util.fx.POFXreveal_basic(this)
	}

}