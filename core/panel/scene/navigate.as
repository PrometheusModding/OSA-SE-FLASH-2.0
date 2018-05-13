

class core.panel.scene.navigate extends MovieClip {


public var o
public var m

var buildO
var posO

var buttonFont

var description
var brass

var warpMode
var helpText

var display

	function navigate(){
		
		warpMode = false
		
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 6
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		


		brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang.navigate.toUpperCase(), "")

		posO.vStart = posO.v
		
		var dataO = []
		
		
		var pandectData = o.lib.PLib.get(m.dia.module.id) 
		var pandectMenu = pandectData.navmenu[0] 
			
			dataO.push({cmd:{fn:"esc"}, bt:{b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
			
			var t1
			var t2
			for (var i=0; i < pandectMenu.l0.length; i++){  		
		
				t1 = core.util.syntax.SynDesc(o, o.lib.translate(pandectMenu.l0[i].title, m.dia.module.id, "P"), pandectMenu.l0[i], o.lib.langP[m.dia.module.id], m.dia.actra)
				t2 = core.util.syntax.SynDesc(o, o.lib.translate(pandectMenu.l0[i].subtitle, m.dia.module.id, "P"), pandectMenu.l0[i], o.lib.langP[m.dia.module.id], m.dia.actra)
				
				dataO.push({cmd:{fn:"anav", out:"sceneNavigate"}, hud:{panel:"_majorNavText"}, bt:{b:pandectMenu.l0[i].i}, tx:{desc:t1.toUpperCase(), ini:t2}, anav:{snd:"confirm", fn:pandectMenu.l0[i].fn, warp:pandectMenu.l0[i].warp, travel:pandectMenu.l0[i].travel}}) 	
				
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
		
		helpText = this.attachMovie("helpTogTo", "helper", this.getNextHighestDepth(), {_x:20,_y:-435});
			helpText.setTitle(o.cfg.lang.travel.toUpperCase())
			helpText.setDesc(o.cfg.lang.togToChangeNav)

		buildO.concludeSetup()
		processShift()
	}	
	

	function inspect(){
		if(o.actro.get("00000007")){
		o.ctr.INSPECT("00000007")
		}else{
		o.skyAll("0SC_InspectActraTrue", "", 0.0, "20")	
		}
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
	
	public function anav(destination){
			if(!m.dia.chore.autoNav.navAgenda[0]){
				if(warpMode){m.dia.menuSelection(buildO.buttons[buildO.point].dataO.anav.warp)}
				else{m.dia.chore.autoNav.newAgenda(buildO.buttons[buildO.point].dataO.anav.travel)}
			}
		}
	
	function DT(){
		o.xplat.sysoi("shiftmo")
		warpMode = !warpMode
		if(warpMode){helpText.setTitle(o.cfg.lang.warp.toUpperCase())}
		else{helpText.setTitle(o.cfg.lang.travel.toUpperCase())}
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
		display = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "option", this.getNextHighestDepth(), {o:o, actra:m.actra, _x:posO.h, horizon:posO, iniText:buildO.buttons[buildO.point].dataO.tx.ini})
		display._y-=72
		display._x-=42
		display.buildFull()
	}

}