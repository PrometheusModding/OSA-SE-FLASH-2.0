

class core.panel.inspect.main extends MovieClip {


public var o
public var m




var buildO
var posO

var buttonFont

var description
var brass

	function main(){
		
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 10
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.inspect.brass.typeA(o, m, this, posO, o.cfg.lang.inspectMenu.toUpperCase())
		
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{b:"omu_btno"}, tx:{desc:o.cfg.lang.exit.toUpperCase()}}) 
		
		dataO.push({cmd:{fn:"adv", out:"inspectInteract"}, bt:{b:"omu_hand"}, tx:{desc:o.cfg.lang.interact.toUpperCase()}})
		if(m.actra.profile.has){
		dataO.push({cmd:{fn:"adv", out:"inspectProfile"}, bt:{b:"omu_profile"}, tx:{desc:o.cfg.lang.profile.toUpperCase()}})
		}
		dataO.push({cmd:{fn:"adv", out:"inspectEquipment"}, bt:{b:"omu_shirt"}, tx:{desc:o.cfg.lang.equipment.toUpperCase()}})
		dataO.push({cmd:{fn:"adv", out:"inspectInfo"}, bt:{b:"omu_info"}, tx:{desc:o.cfg.lang.info.toUpperCase()}})
		
		
		
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
	   m.endMenu()
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
	
	function revisit(){
			core.panel.util.fx.PIFXback_basic(buildO.buttons)
	}
	
	function processShift(){
		brass.setDescription(buildO.buttons[buildO.point].dataO.tx.desc.toUpperCase())
	}
	
	function appear(){
		core.panel.util.fx.PIFXreveal_basic(buildO.buttons)
		core.panel.util.fx.POFXreveal_basic(this)
	}

}