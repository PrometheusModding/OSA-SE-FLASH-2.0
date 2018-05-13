

class core.panel.major.esgSelect extends MovieClip {


public var o
public var m

var buildO
var posO

var buttonFont

var description
var brass
var display

var gen
var genL
var btRef

		function esgSelect(){
		display = []
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 9
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		gen = m.dataPin.gen
		if(gen==1){brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang.esg+" | "+o.cfg.lang.female+" | "+o.cfg.lang.config.toUpperCase(), "")}
		else{brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang.esg+" | "+o.cfg.lang.male+" | "+o.cfg.lang.config.toUpperCase(), "")}

		posO.vStart = posO.v

		gen = m.dataPin.gen
		btRef = m.dataPin.btRef
		
		if(gen==0){genL = "M"}
		else{genL = "F"}
		
		var dataO = []
		
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		
		dataO.push({cmd:{fn:"select", esg:undefined}, bt:{sy:"oconMiniCircle", b:"omu_bomb"}, tx:{desc:o.cfg.lang.clearESG.toUpperCase()}})
		
		dataO.push({cmd:{fn:"select", esg:"helmet"}, bt:{sy:"oconMiniCircle", b:"ome_a_helmet_"+genL}, tx:{desc:o.cfg.esg.getEsgName("helmet", gen).toUpperCase()}})
		dataO.push({cmd:{fn:"select", esg:"cuirass"}, bt:{sy:"oconMiniCircle", b:"ome_a_cuirass_"+genL}, tx:{desc:o.cfg.esg.getEsgName("cuirass", gen).toUpperCase()}}) 
		dataO.push({cmd:{fn:"select", esg:"boots"}, bt:{sy:"oconMiniCircle", b:"ome_a_boots_"+genL}, tx:{desc:o.cfg.esg.getEsgName("boots", gen).toUpperCase()}}) 
		dataO.push({cmd:{fn:"select", esg:"gloves"}, bt:{sy:"oconMiniCircle", b:"ome_a_gloves_"+genL}, tx:{desc:o.cfg.esg.getEsgName("gloves", gen).toUpperCase()}}) 
		dataO.push({cmd:{fn:"select", esg:"intlow"}, bt:{sy:"oconMiniCircle", b:"ome_a_intlow_"+genL}, tx:{desc:o.cfg.esg.getEsgName("intlow", gen).toUpperCase()}}) 
		dataO.push({cmd:{fn:"select", esg:"inthigh"}, bt:{sy:"oconMiniCircle", b:"ome_a_inthigh_"+genL}, tx:{desc:o.cfg.esg.getEsgName("inthigh", gen).toUpperCase()}}) 
		dataO.push({cmd:{fn:"select", esg:"cape"}, bt:{sy:"oconMiniCircle", b:"ome_a_cape_"+genL}, tx:{desc:o.cfg.esg.getEsgName("cape", gen).toUpperCase()}}) 
		dataO.push({cmd:{fn:"select", esg:"pants"}, bt:{sy:"oconMiniCircle", b:"ome_a_pants_"+genL}, tx:{desc:o.cfg.esg.getEsgName("pants", gen).toUpperCase()}})
		dataO.push({cmd:{fn:"select", esg:"stockings"}, bt:{sy:"oconMiniCircle", b:"ome_a_stockings_"+genL}, tx:{desc:o.cfg.esg.getEsgName("stockings", gen).toUpperCase()}})
		dataO.push({cmd:{fn:"select", esg:"misclow"}, bt:{sy:"oconMiniCircle", b:"ome_a_misclow_"+genL}, tx:{desc:o.cfg.esg.getEsgName("misclow", gen).toUpperCase()}})
		dataO.push({cmd:{fn:"select", esg:"miscmid"}, bt:{sy:"oconMiniCircle", b:"ome_a_miscmid_"+genL}, tx:{desc:o.cfg.esg.getEsgName("miscmid", gen).toUpperCase()}})
		dataO.push({cmd:{fn:"select", esg:"miscup"}, bt:{sy:"oconMiniCircle", b:"ome_a_miscup_"+genL}, tx:{desc:o.cfg.esg.getEsgName("miscup", gen).toUpperCase()}})
		dataO.push({cmd:{fn:"select", esg:"miscarms"}, bt:{sy:"oconMiniCircle", b:"ome_a_miscarms_"+genL}, tx:{desc:o.cfg.esg.getEsgName("miscarms", gen).toUpperCase()}})
		dataO.push({cmd:{fn:"select", esg:"circlet"}, bt:{sy:"oconMiniCircle", b:"ome_a_circlet_"+genL}, tx:{desc:o.cfg.esg.getEsgName("circlet", gen).toUpperCase()}})
		dataO.push({cmd:{fn:"select", esg:"hood"}, bt:{sy:"oconMiniCircle", b:"ome_a_hood_"+genL}, tx:{desc:o.cfg.esg.getEsgName("hood", gen).toUpperCase()}})
		dataO.push({cmd:{fn:"select", esg:"earrings"}, bt:{sy:"oconMiniCircle", b:"ome_a_earrings_"+genL}, tx:{desc:o.cfg.esg.getEsgName("earrings", gen).toUpperCase()}})
		dataO.push({cmd:{fn:"select", esg:"rings"}, bt:{sy:"oconMiniCircle", b:"ome_a_rings_"+genL}, tx:{desc:o.cfg.esg.getEsgName("rings", gen).toUpperCase()}})
		dataO.push({cmd:{fn:"select", esg:"necklace"}, bt:{sy:"oconMiniCircle", b:"ome_a_necklace_"+genL}, tx:{desc:o.cfg.esg.getEsgName("necklace", gen).toUpperCase()}})
		dataO.push({cmd:{fn:"select", esg:"glasses"}, bt:{sy:"oconMiniCircle", b:"ome_a_glasses_"+genL}, tx:{desc:o.cfg.esg.getEsgName("glasses", gen).toUpperCase()}})
		dataO.push({cmd:{fn:"select", esg:"bodypiercing"}, bt:{sy:"oconMiniCircle", b:"ome_a_bodypiercing_"+genL}, tx:{desc:o.cfg.esg.getEsgName("bodypiercing", gen).toUpperCase()}})
		dataO.push({cmd:{fn:"select", esg:"shield"}, bt:{sy:"oconMiniCircle", b:"ome_a_shield_"+genL}, tx:{desc:o.cfg.esg.getEsgName("shield", gen).toUpperCase()}})
		dataO.push({cmd:{fn:"select", esg:"hair"}, bt:{sy:"oconMiniCircle", b:"ome_a_hair_"+genL}, tx:{desc:o.cfg.esg.getEsgName("hair", gen).toUpperCase()}})
		
		if(o.cfg.config.purityMode == 0){
		dataO.push({cmd:{fn:"select", esg:"anatomy"}, bt:{sy:"oconMiniCircle", b:"ome_a_anatomy_"+genL}, tx:{desc:o.cfg.esg.getEsgName("anatomy", gen).toUpperCase()}})
		}
		
		
		dataO.push({cmd:{fn:"select", esg:"physicsobject"}, bt:{sy:"oconMiniCircle", b:"ome_a_physicsobject_"+genL}, tx:{desc:o.cfg.esg.getEsgName("physicsobject", gen).toUpperCase()}})
		
		
		var btGlobal = {xs:60, hxs:75, menuPanel:m, lineThickness:2, lineColor:"0xFFFFFF", fillColor:""}
		
		for (var i=0; i < dataO.length; i++){
			if(buildO.col < buildO.maxCol){
			buildO.buttons[i] = this.attachMovie(dataO[i].bt.sy, "option", this.getNextHighestDepth(), {o:o, m:m, _x:posO.h, _y:posO.v, posO:posO, dataO:dataO[i], btGlobal:btGlobal})
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
		core.panel.util.fx.PIFXreveal_basic(buildO.buttons)
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
	
	function select(){
	o.xplat.sysoi("confirmm")
	btRef.setESG(buildO.buttons[buildO.point].dataO.cmd.esg)
	m.dataPin.panel.brass.setDescription(btRef.dataO.tx.desc.toUpperCase())
	m.dataPin.panel.unsavedChanges = true
	m.escape()
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
		display = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "displayPanel", this.getNextHighestDepth(), {o:o, actra:m.actra, horizon:posO, iniText:buildO.buttons[buildO.point].dataO.tx.ini})
		display._y-=72
		display._x-=42
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