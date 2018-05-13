

class core.panel.scene.infoActor extends MovieClip {


public var o
public var m


var buttonFont

var description

var helpText

var actraMenu
var cur

var display

		function infoActor(){
	
			actraMenu = []
			cur = m.tabActra
			for (var i=0; i < m.dia.actra.length; i++){
				actraMenu[i] = this.createEmptyMovieClip("am", this.getNextHighestDepth(), {posO:undefined, buildO:undefined, brass:undefined, dataO:undefined}); 
				//actraMenu[i] = {posO:undefined, buildO:undefined, brass:undefined, dataO:undefined}
				buildActraMenu(i, actraMenu[i])
				actraMenu[i]._visible = false
			}
			
			helpText = this.attachMovie("helpTogTo", "helper", this.getNextHighestDepth(), {_x:-130,_y:-635});
			helpText.setTitle((m.actra.name).toUpperCase())
			helpText.setDesc(o.cfg.lang.togToChangeActra)
			
			processShift()
			actraMenu[cur]._visible = true
			core.panel.util.fx.PIFXreveal_basic(actraMenu[cur].buildO.buttons)
			
		}
		
		function buildActraMenu(ix, amu){
		
		var actra = m.dia.actra[ix]
		
		amu.buildO = new core.panel.button.builder4D()
		amu.buildO.maxCol = 8
		
		amu.posO = new core.panel.button.positioner()
		amu.posO.vOff = -50
		amu.posO.hOff = -50
		amu.posO.btWidth = 18		


		amu.brass = new core.panel.major.brass.typeA(o, amu, amu.posO, o.cfg.lang.character+" | "+o.cfg.lang.info.toUpperCase(), "")
		amu.posO.vStart = amu.posO.v
		
		amu.dataO = []
		
		amu.dataO.push({cmd:{fn:"esc"}, bt:{b:"omu_backmenu"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		if(actra.profile.has){
		amu.dataO.push({cmd:{fn:"adv", out:"sceneInfoActorProfile"}, bt:{b:"omu_profile"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.profile.toUpperCase()}})
		}
		
		amu.dataO.push({cmd:{fn:"adv", out:"sceneInfoActorPersona"}, bt:{b:"omu_persona"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.persona.toUpperCase()}})
		amu.dataO.push({cmd:{fn:"adv", out:"sceneInfoActorBody"}, bt:{b:"omu_bodyscale"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.body.toUpperCase()}})

		amu.dataO.push({cmd:{fn:"", out:""}, bt:{b:"omu_personpaint"}, hud:{sy:"oconMiniCircle", panel:"_infoActorGraphics"}, tx:{desc:o.cfg.lang.graphics.toUpperCase()}})
		amu.dataO.push({cmd:{fn:"", out:"sceneInfoActorTechnical"}, bt:{b:"omu_info"}, hud:{sy:"oconMiniCircle", panel:"_infoActorTechnical"}, tx:{desc:o.cfg.lang.technical.toUpperCase()}})
		if(o.cfg.config.logging){
		amu.dataO.push({cmd:{fn:"adv", out:"sceneInfoActorLog"}, bt:{b:"omu_log"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.logging.toUpperCase()}})
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
	   o.xplat.sysoi("menuback")
	   m.escape()
	}
	
	function esc(){DN()}
	
	function adv(){
	;o.xplat.sysoi("menuforward")
	m.advancePanelFade(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.cmd.out)
	}
	
	
	function DT(){
		o.xplat.sysoi("shifta")
		m.pushActra()
	}

	
	function DU(){actraMenu[cur].buildO.DU();processShift();o.xplat.sysoi("moves")}
	
	function DD(){actraMenu[cur].buildO.DD();processShift();o.xplat.sysoi("moves")}
	
	function DL(){actraMenu[cur].buildO.DL();processShift();o.xplat.sysoi("moves")}
	
	function DR(){actraMenu[cur].buildO.DR();processShift();o.xplat.sysoi("moves")}
	

	function newActra(pointer){
			actraMenu[cur]._visible = false			
			var point = actraMenu[cur].buildO.point
			cur = m.tabActra
			actraMenu[cur].buildO.jumpPoint(point)
			actraMenu[cur]._visible = true			
			helpText.setTitle((m.actra.name).toUpperCase())
			processShift(true)
	}
	
	function revisit(){if(cur!=m.tabActra){
		core.panel.util.func.newActra(this)}
		core.panel.util.fx.PIFXback_basic(actraMenu[cur].buildO.buttons)
	}
	function processShift(tog){
		actraMenu[cur].brass.setDescription(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.tx.desc.toUpperCase())
		makeDisplay(tog)
	}
	
	function makeDisplay(tog){
		display.removeMovieClip()
		display = this.attachMovie(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.hud.panel, "option", this.getNextHighestDepth(), {o:o, actra:m.actra, _x:actraMenu[cur].posO.h, horizon:actraMenu[cur].posO, isLog:actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.tx.isLog, longText:actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.tx.long})
		display._y-=72
		display._x-=42
		display.buildFull()
		if(tog){
		core.panel.util.fx.PIFXtog_basic(actraMenu[cur].buildO.buttons)
		}
		core.panel.util.fx.PFXreveal_basic(display)
	}
	
	function appear(){
		core.panel.util.fx.PIFXreveal_basic(actraMenu[cur].buildO.buttons)
		core.panel.util.fx.POFXreveal_basic(this)
	}


}