

class core.panel.inspect.equipment extends MovieClip {

public var o
public var m
var buildO
var posO

var buttonFont
var description
var brass

	function equipment(){
		
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 7
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.inspect.brass.typeA(o, m, this, posO, o.cfg.lang.equipment.toUpperCase())
		
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{b:"omu_backmenu"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.exit.toUpperCase()}}) 
		
		for (var i=0; i < 6; i++){
		dataO.push({cmd:{fn:"equip"}, hud:{sy:"oconMiniCircleEquip"}, tx:{desc:m.actra.equip.attire.item[i].name}, item:m.actra.equip.attire.item[i]}) 		
		}
		
		 dataO.push({cmd:{fn:"myEquip"}, bt:{b:"omu_shirt"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.library.toUpperCase()}})
		
		for (var i=6; i < 12; i++){
		dataO.push({cmd:{fn:"equip"}, hud:{sy:"oconMiniCircleEquip"}, tx:{desc:m.actra.equip.attire.item[i].name}, item:m.actra.equip.attire.item[i]}) 		
		}
		
		dataO.push({cmd:{fn:"full", out:0}, bt:{b:"omu_vhorizonr"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.undressAll.toUpperCase()}})
		
		
		for (var i=12; i < 18; i++){
		dataO.push({cmd:{fn:"equip"}, hud:{sy:"oconMiniCircleEquip"}, tx:{desc:m.actra.equip.attire.item[i].name}, item:m.actra.equip.attire.item[i]}) 		
		}
		
		dataO.push({cmd:{fn:"full", out:1}, bt:{b:"omu_vhorizonl"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.redressAll.toUpperCase()}}) 
		
		for (var i=18; i < 24; i++){
		dataO.push({cmd:{fn:"equip"}, hud:{sy:"oconMiniCircleEquip"}, tx:{desc:m.actra.equip.attire.item[i].name}, item:m.actra.equip.attire.item[i]}) 		
		}
		
		dataO.push({cmd:{fn:"reset"}, bt:{b:"omu_skyrim"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.reset.toUpperCase()}}) 
		
		for (var i=24; i < 30; i++){
		dataO.push({cmd:{fn:"equip"}, hud:{sy:"oconMiniCircleEquip"}, tx:{desc:m.actra.equip.attire.item[i].name}, item:m.actra.equip.attire.item[i]}) 		
		}
		
		dataO.push({cmd:{fn:"esc"}, bt:{b:""}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.comingSoon.toUpperCase()}}) 
		
		for (var i=30; i < 32; i++){
		dataO.push({cmd:{fn:"equip"}, hud:{sy:"oconMiniCircleEquip"}, tx:{desc:m.actra.equip.attire.item[i].name}, item:m.actra.equip.attire.item[i]}) 		
		}
		
		
		var btGlobal = {xs:60, hxs:75, menuPanel:m, lineThickness:2, lineColor:"0xFFFFFF", fillColor:""}
		
		for (var i=0; i < dataO.length; i++){
			if(buildO.col < buildO.maxCol){
			buildO.buttons[i] = this.attachMovie(dataO[i].hud.sy, "option", this.getNextHighestDepth(), {o:o, m:m, actra:m.actra,  _x:posO.h, _y:posO.v, posO:posO, dataO:dataO[i], btGlobal:btGlobal})
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
	

	function equip(){
		
		if(buildO.buttons[buildO.point].dataO.item.worn){
			o.skyAll("0SC_MyUnEquip", buildO.buttons[buildO.point].dataO.item.slot+30, 0, m.actra.trueID)
			buildO.buttons[buildO.point].dataO.item.worn = false
			buildO.buttons[buildO.point].calcWorn()
		}else{
			o.skyAll("0SC_MyEquipEx", buildO.buttons[buildO.point].dataO.item.id+","+buildO.buttons[buildO.point].dataO.item.slot+30, 0, m.actra.trueID)	
			buildO.buttons[buildO.point].dataO.item.worn = true
			buildO.buttons[buildO.point].calcWorn()
		}
	}
	
	function full(){
		
		if(buildO.buttons[buildO.point].dataO.cmd.out==1){
			m.actra.equip.attire.redress(1)
		}else{
			m.actra.equip.attire.undress(1)
		}
	}
	
	
	function reset(){
		
		o.skyAll("0SC_ResetEquip", "", 0, m.actra.trueID)	
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
	
	function myEquip(){
	m.advancePanelFade("inspectMyEquip")
	}
	
	
	function DU(){buildO.DU();processShift();o.xplat.sysoi("moves")}
	
	function DD(){buildO.DD();processShift();o.xplat.sysoi("moves")}
	
	function DL(){buildO.DL();processShift();o.xplat.sysoi("moves")}
	
	function DR(){buildO.DR();processShift();o.xplat.sysoi("moves")}
	
	function DT(){
			
	}
	
	function processShift(){
		brass.setDescription(buildO.buttons[buildO.point].dataO.tx.desc.toUpperCase())
	}

}