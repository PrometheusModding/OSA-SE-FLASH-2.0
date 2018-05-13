

class core.panel.scene.infoActorProfile extends MovieClip {


public var o
public var m


var buttonFont

var description

var helpText

var actraMenu
var cur

var display

		function infoActorProfile(){
	
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
		amu.buildO.maxCol = 7
		
		amu.posO = new core.panel.button.positioner()
		amu.posO.vOff = -50
		amu.posO.hOff = -50
		amu.posO.btWidth = 18		


		amu.brass = new core.panel.major.brass.typeA(o, amu, amu.posO, o.cfg.lang.profile+" | "+o.cfg.lang.character+" | "+o.cfg.lang.info.toUpperCase(), "")
		amu.posO.vStart = amu.posO.v
		
		amu.dataO = []
		
		amu.dataO.push({cmd:{fn:"esc"}, bt:{b:"omu_backmenu"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		if(actra.profile.has){
			if(actra.profile.splash[0]){
			amu.dataO.push({bt:{b:actra.profile.profileData.splash[0].icon}, hud:{sy:"oconMiniCircle", panel:"proshell"+actra.profile.profileData.splash[0].type}, xml:actra.profile.profileData.splash[0], tx:{desc:actra.profile.profileData.splash[0].t}})
			}else{
			amu.dataO.push({bt:{b:o.cfg.xconfig.template[0].profile[0].splash[0].icon}, hud:{sy:"oconMiniCircle", panel:"proshell"+o.cfg.xconfig.template[0].profile[0].splash[0].type}, xml:o.cfg.xconfig.template[0].profile[0].splash[0], tx:{desc:o.cfg.xconfig.template[0].profile[0].splash[0].t}})
			}
			
		}
		
		var prodat = actra.profile.profileData
		for (var i=0; i < prodat.panel.length; i++){
				amu.dataO.push({hud:{sy:"oconMiniCircle", panel:"proshell"+prodat.panel[i].type}, bt:{b:prodat.panel[i].icon}, xml:prodat.panel[i], tx:{desc:prodat.panel[i].t}})	
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
	o.xplat.sysoi("menuforward")
	m.advancePanelFade(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.cmd.out)
	}
	
	
	function DT(){
		o.xplat.sysoi("shifta")
		m.pushActra()
	}
		
	function reparse(){
			var newPoint = actraMenu[cur].buildO.point
			actraMenu[cur].removeMovieClip()
			actraMenu[cur] = this.createEmptyMovieClip("am", this.getNextHighestDepth(), {posO:undefined, buildO:undefined, brass:undefined, dataO:undefined}); 
			buildActraMenu(cur, actraMenu[cur])
			actraMenu[cur].buildO.jumpPoint(newPoint)
			processShift()
	}
	
	function DU(){actraMenu[cur].buildO.DU();processShift()}
	
	function DD(){actraMenu[cur].buildO.DD();processShift()}
	
	function DL(){actraMenu[cur].buildO.DL();processShift()}
	
	function DR(){actraMenu[cur].buildO.DR();processShift()}
	

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
		display = this.attachMovie(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.hud.panel, "option", this.getNextHighestDepth(), {o:o, actra:m.actra, m:m, _x:actraMenu[cur].posO.h, xml:actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.xml, horizon:actraMenu[cur].posO, iniText:actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.tx.ini})
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