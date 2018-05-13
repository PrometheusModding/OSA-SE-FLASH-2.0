

class core.panel.major.library extends MovieClip {


public var o
public var m




var buildO
var posO

var buttonFont

var description
var brass

	function library(){
		
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 6
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.btWidth = 18		

		brass = new core.panel.major.brass.typeD(o, this, posO, o.cfg.lang.library, "")
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase(), subText:""}}) 
		

		for (var i=0; i < o.scan.mods.length; i++) {		 
		dataO.push({cmd:{fn:"advMod", out:o.scan.mods[i].id},  bind:o.cfg.binds.refM[o.scan.mods[i].id], bindix:i, bt:{b:o.scan.mods[i].button}, tx:{desc:o.scan.mods[i].name, subText:o.scan.mods[i].desc}, index:i}) 		
		}
		
		
		var btGlobal = {xs:60, hxs:75, menuPanel:m, lineThickness:2, lineColor:"0xFFFFFF", fillColor:""}
		
		for (var i=0; i < dataO.length; i++){
			if(buildO.col < buildO.maxCol){
			buildO.buttons[i] = this.attachMovie("oconMiniCircleLibrary", "option", this.getNextHighestDepth(), {o:o, m:m, _x:posO.h, _y:posO.v, posO:posO, dataO:dataO[i], btGlobal:btGlobal})
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
	   m.escape()
	}
	function esc(){DN()}
	
	function advMod(){
	m.dataPin = {id:buildO.buttons[buildO.point].dataO.cmd.out, bt:buildO.buttons[buildO.point]}
	m.advancePanelFade("majorModule")
	}
	
	
	
	function DU(){buildO.DU();processShift();o.xplat.sysoi("moves")}
	
	function DD(){buildO.DD();processShift();o.xplat.sysoi("moves")}
	
	function DL(){buildO.DL();processShift();o.xplat.sysoi("moves")}
	
	function DR(){buildO.DR();processShift();o.xplat.sysoi("moves")}
	
	function processShift(){
		brass.setDescription(buildO.buttons[buildO.point].dataO.tx.desc.toUpperCase())
		brass.setSubText(buildO.buttons[buildO.point].dataO.tx.subText)
	}
	
	function revisit(){
			core.panel.util.fx.PIFXback_basic(buildO.buttons)
	}
	
	function appear(){
		core.panel.util.fx.PIFXreveal_basic(buildO.buttons)
		core.panel.util.fx.POFXreveal_basic(this)
	}

}