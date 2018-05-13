

class core.panel.major.module extends MovieClip {


public var o
public var m

var buildO
var posO

var mod
var pandect

var buttonFont

var description
var brass
var display 

	function module(){
		
		if(!o.lib.MLib.get(m.dataPin.id)){
		o.lib.getOData("M", m.dataPin.id, "", checkPandect, this)
		}else{checkPandect()}
	}
	
	function checkPandect(){
		if(!o.lib.PLib.get(m.dataPin.id)){o.lib.getOData("P", m.dataPin.id, "", dataReady, this)
		}else{dataReady()}		
	}
	
	function dataReady(){
		
		mod = o.lib.MLib.get(m.dataPin.id)
		pandect = o.lib.PLib.get(m.dataPin.id)
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 5
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.btWidth = 18		

		brass = new core.panel.major.brass.typeA(o, this, posO, pandect.name+" | "+o.cfg.lang.module, "")
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		dataO.push({cmd:{fn:"adv", out:"majorModStart"}, bt:{sy:"oconMiniCircle", b:"omu_powerplus"}, tx:{desc:o.cfg.lang.start.toUpperCase()}})
		
		if(mod.actors < 3){
		dataO.push({cmd:{fn:"adv", out:"majorModKeybind"}, bt:{sy:"oconMiniCircle", b:"omu_keybind"}, tx:{desc:o.cfg.lang.keybind.toUpperCase()}})
		}
		dataO.push({hud:{panel:"_majorModInfo"}, bt:{sy:"oconMiniCircle", b:"omu_info"}, tx:{desc:o.cfg.lang.info.toUpperCase()}}) 
		dataO.push({cmd:{fn:"adv", out:"pluginTwesl"}, bt:{sy:"oconMiniCircle", b:"omu_plugins"}, tx:{desc:o.cfg.lang.plugin.toUpperCase()}})		
		
		var btGlobal = {xs:60, hxs:75, menuPanel:m, lineThickness:2, lineColor:"0xFFFFFF", fillColor:""}
		
		for (var i=0; i < dataO.length; i++){
			if(buildO.col < buildO.maxCol){
			buildO.buttons[i] = this.attachMovie(dataO[i].bt.sy, "option", this.getNextHighestDepth(), {o:o, _x:posO.h, _y:posO.v, posO:posO, dataO:dataO[i], btGlobal:btGlobal})
			posO.v += posO.vOff
			buildO.col++
			}else{
			buildO.row++
			buildO.col=0
			posO.v = posO.vStart
			posO.h += posO.vOff
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
	m.dataPin = {module:mod, pandect:pandect, bt:m.dataPin.bt}
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	
	
	
	function esc(){
	m.escape()
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
		display = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "displayPanel", this.getNextHighestDepth(), {o:o, actra:m.actra, horizon:posO.h-55, pandect:pandect, module:mod})
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