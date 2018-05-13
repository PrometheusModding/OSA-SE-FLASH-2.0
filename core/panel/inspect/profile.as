

class core.panel.inspect.profile extends MovieClip {


public var o
public var m


var buildO
var posO

var buttonFont

var description
var brass
var display

var actra 
var prodat


	function profile(){
		
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 10
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		
		
		brass = new core.panel.inspect.brass.typeA(o, m, this, posO, o.cfg.lang.profile.toUpperCase())
		
		posO.vStart = posO.v
		
		actra = m.actra
		prodat = actra.profile.profileData
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		
		dataO.push({hud:{panel:"proshell"+prodat.splash[0].type}, bt:{b:"omu_profile"}, xml:prodat.splash[0], tx:{desc:o.cfg.lang.overview.toUpperCase()}})
		//if(m.actra.profile.profileData.biography){
		//dataO.push({hud:{panel:"proshell"+prodat.biography[0].type}, bt:{b:"cimaj_biography01_bw!a"}, xml:prodat.biography[0], tx:{desc:o.cfg.lang.biography.toUpperCase()}})		
		//}
		
		for (var i=0; i < prodat.panel.length; i++){
				dataO.push({hud:{panel:"proshell"+prodat.panel[i].type}, bt:{b:prodat.panel[i].icon}, xml:prodat.panel[i], tx:{desc:prodat.panel[i].t}})	
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
		display = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "option", this.getNextHighestDepth(), {o:o, actra:actra, prodat:prodat, xml:buildO.buttons[buildO.point].dataO.xml})
		if(display.id == "biography"){display._y-=125}
		else{display._y-=72}
		display._x-=50
		
		display.buildFull()
	}

}