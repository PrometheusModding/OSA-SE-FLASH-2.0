

class core.panel.inspect.myTier extends MovieClip {

public var o
public var m
var buildO
var posO

var buttonFont
var description
var brass

var tierData
var tier



	function myTier(){
		tierData = m.dataPin.tierData		
		tier = m.dataPin.tier
		buildEntry()
	}

	
	function buildEntry(){
		
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 13
		
		posO = new core.panel.button.positioner()
		posO.vOff = -36
		posO.hOff = -160
		posO.btWidth = 13	

		brass = new core.panel.inspect.brass.typeA(o, m, this, posO, tierData.n+" | "+o.my.user[m.dataPin.myType].declare.global[0].title)
		
		posO.vStart = posO.v
		
		var dataO = []
		
				
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu", xscale:60, yscale:60}, tx:{desc:o.cfg.lang.exit.toUpperCase()}}) 
		
		for (var i=0; i < tierData["folder"+(tier+1)].length; i++){
		dataO.push({cmd:{fn:"adv", out:"inspectMyTier", ix:i}, bt:{sy:"oconMyEntry"}, type:m.dataPin.doc.folderstyle[0], entry:tierData["folder"+(tier+1)][i], tier:tierData["folder"+(tier+1)][i], tx:{desc:tierData["folder"+(tier+1)][i].n}}) 
		}
		
		for (var i=0; i < tierData.entry.length; i++){
		dataO.push({cmd:{fn:m.dataPin.proc.fn, out:"inspectMyTier"}, bt:{sy:"oconMyEntry"}, type:m.dataPin.doc.entrystyle[0], entry:tierData.entry[i], tx:{desc:tierData.entry[i].n}}) 
		}
		
		
		var btGlobal = {xs:48, hxs:57, toff:-20, menuPanel:m, lineThickness:1.5, lineColor:"0xFFFFFF", fillColor:""}
		
		for (var i=0; i < dataO.length; i++){
			if(buildO.col < buildO.maxCol){
			buildO.buttons[i] = this.attachMovie(dataO[i].bt.sy, "option", this.getNextHighestDepth(), {o:o, _x:posO.h, _y:posO.v, posO:posO, dataO:dataO[i], btGlobal:btGlobal})
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
		

	function DY(){
	   this[buildO.buttons[buildO.point].dataO.cmd.fn]()
	}
	
	function equip(){
		o.skyAll("0SC_MyEquip", buildO.buttons[buildO.point].dataO.entry.m+","+buildO.buttons[buildO.point].dataO.entry.s, "0x"+buildO.buttons[buildO.point].dataO.entry.fo, m.actra.trueID)
		if(buildO.buttons[buildO.point].dataO.entry.s){
		m.actra.equip.attire.item[buildO.buttons[buildO.point].dataO.entry.s-30].name = buildO.buttons[buildO.point].dataO.entry.n
		m.actra.equip.attire.item[buildO.buttons[buildO.point].dataO.entry.s-30].id = Number("0x"+buildO.buttons[buildO.point].dataO.entry.fo)
		m.actra.equip.attire.item[buildO.buttons[buildO.point].dataO.entry.s-30].exists = true
		m.actra.equip.attire.item[buildO.buttons[buildO.point].dataO.entry.s-30].worn = true
		}
	}
	
	function anim(){
		o.skyAll("0SC_MyAnim_1", buildO.buttons[buildO.point].dataO.entry.id, 0, m.actra.trueID)
	}
	
	function DN(){
	   o.xplat.sysoi("menuback")
	   m.escape()
	}
	function esc(){DN()}
	
	function adv(){
	o.xplat.sysoi("menuforward")
	m.dataPin = {tier:Number(tier+1), doc:m.dataPin.doc, slot:m.dataPin.slot, tierData:tierData["folder"+Number(tier+1)][buildO.buttons[buildO.point].dataO.cmd.ix], myType:m.dataPin.myType, proc:{fn:m.dataPin.proc.fn}}
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	
	
	function DU(){buildO.DU();processShift();o.xplat.sysoi("moves")}
	
	function DD(){buildO.DD();processShift();o.xplat.sysoi("moves")}
	
	function DL(){buildO.DL();processShift();o.xplat.sysoi("moves")}
	
	function DR(){buildO.DR();processShift();o.xplat.sysoi("moves")}
	
	function DT(){
		m.advancePanelFade("inspectMyEquip")	
	}
	
	function processShift(){
		brass.setDescription(buildO.buttons[buildO.point].dataO.tx.desc)
	}

}