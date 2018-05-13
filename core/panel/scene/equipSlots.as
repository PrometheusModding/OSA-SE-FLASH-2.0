

class core.panel.scene.equipSlots extends MovieClip {


public var o
public var m
public var me

var buttonFont

var description

var helpText

var actraMenu
var cur

var display

		function equipSlots(){
			me = this
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


		amu.brass = new core.panel.major.brass.typeA(o, amu, amu.posO, o.cfg.lang.slots.toUpperCase()+" | "+o.cfg.lang.equipment.toUpperCase(), "")
		amu.posO.vStart = amu.posO.v
		
		amu.dataO = []
		
		amu.dataO.push({cmd:{fn:"esc"}, bt:{b:"omu_backmenu"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.exit.toUpperCase()}}) 
		
		for (var i=0; i < 6; i++){
		amu.dataO.push({cmd:{fn:"equip"}, hud:{sy:"oconMiniCircleEquip"}, tx:{desc:actra.equip.attire.item[i].name}, item:actra.equip.attire.item[i]}) 		
		}
		
		 amu.dataO.push({cmd:{fn:"myEquip"}, bt:{b:"omu_shirt"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.library.toUpperCase()}})
		
		for (var i=6; i < 12; i++){
		amu.dataO.push({cmd:{fn:"equip"}, hud:{sy:"oconMiniCircleEquip"}, tx:{desc:actra.equip.attire.item[i].name}, item:actra.equip.attire.item[i]}) 		
		}
		
		amu.dataO.push({cmd:{fn:"attire", out:"undress"}, bt:{b:"omu_vhorizonr"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.undressAll.toUpperCase()}})
		
		
		for (var i=12; i < 18; i++){
		amu.dataO.push({cmd:{fn:"equip"}, hud:{sy:"oconMiniCircleEquip"}, tx:{desc:actra.equip.attire.item[i].name}, item:actra.equip.attire.item[i]}) 		
		}
		
		amu.dataO.push({cmd:{fn:"attire", out:"redress"}, bt:{b:"omu_vhorizonl"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.redressAll.toUpperCase()}}) 
		
		for (var i=18; i < 24; i++){
		amu.dataO.push({cmd:{fn:"equip"}, hud:{sy:"oconMiniCircleEquip"}, tx:{desc:actra.equip.attire.item[i].name}, item:actra.equip.attire.item[i]}) 		
		}
		
		amu.dataO.push({cmd:{fn:"reset"}, bt:{b:"omu_skyrim"}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.reset.toUpperCase()}}) 
		
		for (var i=24; i < 30; i++){
		amu.dataO.push({cmd:{fn:"equip"}, hud:{sy:"oconMiniCircleEquip"}, tx:{desc:actra.equip.attire.item[i].name}, item:actra.equip.attire.item[i]}) 		
		}
		
		amu.dataO.push({cmd:{fn:"esc"}, bt:{b:""}, hud:{sy:"oconMiniCircle"}, tx:{desc:o.cfg.lang.comingSoon.toUpperCase()}}) 
		
		for (var i=30; i < 32; i++){
		amu.dataO.push({cmd:{fn:"equip"}, hud:{sy:"oconMiniCircleEquip"}, tx:{desc:actra.equip.attire.item[i].name}, item:actra.equip.attire.item[i]}) 		
		}
		
		if(actra.equip.attire.autoInt.intlow.exists){		
		amu.dataO.push({cmd:{fn:"equipFaux"}, hud:{sy:"oconMiniCircleEquip"}, tx:{desc:actra.equip.attire.autoInt.intlow.name}, faux:1, item:actra.equip.attire.autoInt.intlow})
		}
		if(actra.equip.attire.autoInt.inthigh.exists){		
		amu.dataO.push({cmd:{fn:"equipFaux"}, hud:{sy:"oconMiniCircleEquip"}, tx:{desc:actra.equip.attire.autoInt.inthigh.name}, faux:1, item:actra.equip.attire.autoInt.inthigh})
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
		core.panel.util.fx.PIFXtog_basic(actraMenu[cur].buildO.buttons)
	}
	
	function equip(){
		if(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].hasItem){
			o.xplat.sysoi("confirml")
			if(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.item.worn){
				m.actra.equip.unequipSlot(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.item.slot)
				actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.item.worn = false
				actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].calcWorn()
			}else{
				m.actra.equip.attire.dressSlot(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.item.slot, me)
				actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.item.worn = true
				actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].calcWorn()
			}
			
			m.dia.menuNav.rebuildIcos()
		}
	}
	
	
	function equipFaux(){
		o.xplat.sysoi("confirml")
		m.actra.equip.attire.autoInt.toggleEquip(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.item)
		actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].calcWorn()
		m.dia.menuNav.rebuildIcos()
	}
	
	function fauxEsgCalc(){
		 actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].calcWorn()
	}
	
	
	function equipBACK(){
		o.xplat.sysoi("confirml")
		if(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.item.worn){
			o.skyAll("0SC_MyUnEquip", actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.item.slot+30, 0, m.actra.trueID)
			actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.item.worn = false
			actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].calcWorn()
		}else{
			o.skyAll("0SC_MyEquipEx", actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.item.id+","+actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.item.slot+30, 0, m.actra.trueID)	
			actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.item.worn = true
			actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].calcWorn()
		}
	}
	
	function attire(){
			o.xplat.sysoi("confirml")
			m.actra.equip.attire[actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.cmd.out]()
			core.panel.util.func.reparse(this, cur, actraMenu)
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
		display = this.attachMovie(actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].amu.dataO.hud.panel, "option", this.getNextHighestDepth(), {o:o, actra:m.actra, _x:actraMenu[cur].posO.h, horizon:actraMenu[cur].posO, iniText:actraMenu[cur].buildO.buttons[actraMenu[cur].buildO.point].dataO.tx.ini})
		display._y-=72
		display._x-=42
		display.buildFull()
	}

	function appear(){
		core.panel.util.fx.PIFXreveal_basic(actraMenu[cur].buildO.buttons)
		core.panel.util.fx.POFXreveal_basic(this)
	}
}