

class core.panel.scene.info extends MovieClip {


public var o
public var m


var buttonFont

var description

var helpText

var actraMenu
var cur

var display

		function info(){
	
			actraMenu = []
			cur = m.tabActra
			for (var i=0; i < m.dia.actra.length; i++){
				actraMenu[i] = this.createEmptyMovieClip("am", this.getNextHighestDepth(), {posO:undefined, buildO:undefined, brass:undefined, dataO:undefined}); 
				//actraMenu[i] = {posO:undefined, buildO:undefined, brass:undefined, dataO:undefined}
				buildMenu(i, actraMenu[i])
				actraMenu[i]._visible = false
			}
			
			helpText = this.attachMovie("helpTogTo", "helper", this.getNextHighestDepth(), {_x:-130,_y:-635});
			helpText.setTitle((m.actra.name).toUpperCase())
			helpText.setDesc(o.cfg.lang.togToChangeActra)
			
			processShift()
			actraMenu[cur]._visible = true
			core.panel.util.fx.PIFXreveal_basic(actraMenu[cur].buildO.buttons)
			
		}
		
		function buildMenu(ix, amu){
		
		var actra = m.dia.actra[ix]
		
		amu.buildO = new core.panel.button.builder4D()
		amu.buildO.maxCol = 7
		
		amu.posO = new core.panel.button.positioner()
		amu.posO.vOff = -50
		amu.posO.hOff = -50
		amu.posO.btWidth = 18		


		amu.brass = new core.panel.major.brass.typeA(o, amu, amu.posO, o.cfg.lang.info.toUpperCase(), "")
		amu.posO.vStart = amu.posO.v
		
		amu.dataO = []
		
		amu.dataO.push({cmd:{fn:"esc"}, bt:{b:"omu_backmenu"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		amu.dataO.push({cmd:{fn:"", out:"sceneModuleInfo"}, bt:{b:"omu_moduleinfo"}, hud:{sy:"oconMiniCircle", panel:"_SceneInfoModule"}, tx:{desc:o.cfg.lang.module.toUpperCase()+" | "+o.cfg.lang.info.toUpperCase()}})
		amu.dataO.push({cmd:{fn:""}, bt:{b:"omu_stage"}, hud:{sy:"oconMiniCircle", panel:"_SceneInfoScene"}, tx:{desc:o.cfg.lang.scene.toUpperCase()+" | "+o.cfg.lang.info.toUpperCase()}})
		amu.dataO.push({cmd:{fn:"adv", out:"pluginTwesl"}, bt:{b:"omu_plugins"}, hud:{sy:"oconMiniCircle", panel:"_pluginChecklist"}, tx:{desc:o.cfg.lang.plugin.toUpperCase()+" | "+o.cfg.lang.info.toUpperCase()}})
			
		
		var profilePanel
		if(actra.profile.has){
		amu.dataO.push({cmd:{fn:"adv", out:"sceneInfoActor"}, bt:{b:"omu_multipeople"}, hud:{sy:"oconMiniCircle", panel:"proshell"+actra.profile.profileData.splash[0].type}, actra:actra, xml:actra.profile.profileData.splash[0], tx:{desc:o.cfg.lang.character.toUpperCase()+" | "+o.cfg.lang.info.toUpperCase()}})
		}else{
		amu.dataO.push({cmd:{fn:"adv", out:"sceneInfoActor"}, bt:{b:"omu_multipeople"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.character.toUpperCase()+" | "+o.cfg.lang.info.toUpperCase()}})
		}
		
		if(o.cfg.config.devMode=="1"){
		   amu.dataO.push({cmd:{fn:"adv", out:"sceneInfoStage"}, bt:{b:"omu_stage"}, hud:{sy:"oconMiniCircle", panel:"_SceneInfoStage"}, tx:{desc:o.cfg.lang.stage.toUpperCase()+" | "+o.cfg.lang.info.toUpperCase()}})
		}
		
		
		var btGlobal = {xs:60, hxs:75, menuPanel:m, lineThickness:2, lineColor:"0xFFFFFF", fillColor:""}
		
		for (var i=0; i < amu.dataO.length; i++){
			if(amu.buildO.col < amu.buildO.maxCol){
			amu.buildO.buttons[i] = amu.attachMovie(amu.dataO[i].hud.sy, "option", amu.getNextHighestDepth(), {o:o, m:m, actra:actra, _x:amu.posO.h, _y:amu.posO.v, posO:amu.posO, dataO:amu.dataO[i], btGlobal:btGlobal})
			amu.posO.v += amu.posO.vOff
			amu.buildO.col++
			}else{
			amu.buildO.row++
			amu.buildO.col=0
			amu.posO.v = amu.posO.vStart
			amu.posO.h += amu.posO.hOff
			i--
			}
			
		}
		
		
		amu.buildO.concludeSetup()

	}	
	
	
	function DY(){
	   this[actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.cmd.fn]()
	}
	
	function DN(){
	   ;o.xplat.sysoi("menuback")
	   m.escape()
	}
	
	function esc(){DN()}
	
	function adv(){
	;o.xplat.sysoi("menuforward")
	m.advancePanelFade(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.cmd.out)
	}
	
	
	function DT(){
		;o.xplat.sysoi("shifta")
		m.pushActra()
	}
	
	function DU(){actraMenu[cur].buildO.DU();processShift();o.xplat.sysoi("moves")}
	
	function DD(){actraMenu[cur].buildO.DD();processShift();o.xplat.sysoi("moves")}
	
	function DL(){actraMenu[cur].buildO.DL();processShift();o.xplat.sysoi("moves")}
	
	function DR(){actraMenu[cur].buildO.DR();processShift();o.xplat.sysoi("moves")}
	
	function newActra(){core.panel.util.func.newActra(this)}
	
	function revisit(){if(cur!=m.tabActra){
		core.panel.util.func.newActra(this)}
		core.panel.util.fx.PIFXback_basic(actraMenu[cur].buildO.buttons)
	}
	
	
	function processShift(){
		actraMenu[cur].brass.setDescription(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.tx.desc.toUpperCase())
		makeDisplay()
	}
	
	function makeDisplay(){
		display.removeMovieClip()
		display = this.attachMovie(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.hud.panel, "option", this.getNextHighestDepth(), {o:o, actra:m.actra, m:m, _x:actraMenu[cur].posO.h, xml:actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.xml, horizon:actraMenu[cur].posO, iniText:actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.tx.ini})
		display._y-=72
		display._x-=42
		display.buildFull()
		core.panel.util.fx.PFXreveal_basic(display)
	}
	
	function appear(){
		core.panel.util.fx.PIFXreveal_basic(actraMenu[cur].buildO.buttons)
		core.panel.util.fx.POFXreveal_basic(this)
	}

}