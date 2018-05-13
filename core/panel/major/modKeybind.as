import skse

class core.panel.major.modKeybind extends MovieClip {


public var o
public var m




var buildO
var posO

var buttonFont

var description
var brass
var display

var module
var pandect
var bindButton

var thisBindButton

		function modKeybind(){
		module = m.dataPin.module
		pandect = m.dataPin.pandect
		bindButton = m.dataPin.bt
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 10
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.major.brass.typeA(o, this, posO, pandect.name+" | "+o.cfg.lang.keybind.toUpperCase())
		
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		
		var L = dataO.push({cmd:{fn:"bind"}, module:module, bt:{sy:"oconMiniCircleModBind", b:"omu_keybindplus"}, tx:{desc:o.cfg.lang.bindModuleToKeypress.toUpperCase()}})
		
		dataO.push({cmd:{fn:"unbind"}, bt:{sy:"oconMiniCircle", b:"omu_keybindx"}, tx:{desc:o.cfg.lang.clearThisKeybind.toUpperCase()}})
		
		
		
		
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
			posO.h += posO.hOff
			i--
			}
		}
		

		buildO.concludeSetup()
		thisBindButton = buildO.buttons[L-1]
		processShift()
		core.panel.util.fx.PIFXreveal_basic(buildO.buttons)
	}	
	

	function bind(){
		o.ctr.globalPause = true
		core.util.specialPanel.keybinder(o)

		skse.StartRemapMode(this)
	}
	
	function EndRemapMode(newKey){
		
		var free = o.cfg.binds.isModuleKeyFree(newKey)
		if(free=="free"){
			
				o.cfg.binds.callBack={fn:bindCallBack, scope:this}
				
				o.hud.specialPanel.removeMovieClip()
				var trigData = module.id+","+"AUTO"+","+module.actors+pandect.keybind[0].hub
				for (var i=0; i < module.actors; i++) {
					if(module.role[i].npc=="npc"){trigData += "P"}
					else if(module.role[i].npc=="creature"){trigData += "C"}		
				}
				if(pandect.keybind[0].targeting == "crosshair"){trigData += ",C"}
				
				if(pandect.keybind[0].directional == "omni"){trigData += ",O"}
				else if(pandect.keybind[0].directional == "angle"){
					if(pandect.keybind[0].directionalmin.length = 3){trigData += ",D"+(pandect.keybind[0].directionalmin)}
					else if (pandect.keybind[0].directionalmin.length = 2){trigData += ",D0"+(pandect.keybind[0].directionalmin)}			
					else if(pandect.keybind[0].directionalmin.length = 1){{trigData += ",D00"+(pandect.keybind[0].directionalmin)}}
					
					if(pandect.keybind[0].directionalmax.length = 3){trigData += (pandect.keybind[0].directionalmax)}
					else if (pandect.keybind[0].directionalmax.length = 2){trigData += "0"+(pandect.keybind[0].directionalmax)}			
					else if(pandect.keybind[0].directionalmax.length = 1){{trigData += "00"+(pandect.keybind[0].directionalmax)}}
					
				}
				o.skyAll("0SA_BindModule", trigData, newKey)
				o.ctr.globalPause = false
				
		}else{
			o.hud.specialPanel.removeMovieClip()
			o.ctr.globalPause = false
			core.util.specialPanel.onotice(o, core.util.func.textinsert(o.cfg.lang.keyAlreadInUseName, free),false,true)
			o.log.addMaj("Module Keybind Attempt Declined, Key already in use by "+free+"...")
			
		}
	}
	
	function bindCallBack(newModule){
		o.cfg.binds.callBack = undefined
		bindButton.update()
		thisBindButton.update()
	}
	function unbind(){		
		o.cfg.binds.unbindModule(module.id)		
		bindButton.update()
		thisBindButton.update()
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
	
	function revisit(){
			core.panel.util.fx.PIFXback_basic(buildO.buttons)
	}
	
	
	
	function makeDisplay(){
		display.removeMovieClip()
		display = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "displayPanel", this.getNextHighestDepth(), {o:o, actra:m.actra, horizon:posO.h-55})
		display._y-=72
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