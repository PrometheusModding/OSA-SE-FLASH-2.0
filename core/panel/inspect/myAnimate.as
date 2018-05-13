

class core.panel.inspect.myAnimate extends MovieClip {

public var o
public var m
var buildO
var posO

var buttonFont
var description
var brass

	function myAnimate(){
		
		if(o.my.user.anim_1.declare==undefined){
			var manager={yFn:declareReady, yScope:this, nFN:declareNA, nScope:this, myType:"anim_1"}
			o.my.getMyDeclare(manager)
		}else{buildPanel()}
		
		
	}
		
	function declareReady(){
		buildPanel()
	}
	
	function declareNA(){
		m.escape()
	}
	
	function buildPanel(){
		
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 7
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.inspect.brass.typeA(o, m, this, posO, o.my.user.anim_1.declare.global[0].title)
		
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{b:"omu_backmenu"}, tx:{desc:o.cfg.lang.exit.toUpperCase()}}) 
		
		for (var i=0; i < o.my.user.anim_1.declare.declare.length; i++){
		dataO.push({cmd:{fn:"advDec", out:"inspectMyTier", tierData:undefined, doc:o.my.user.anim_1.declare.declare[i].doc}, bt:{b:o.my.user.anim_1.declare.declare[i].i, halo:o.my.user.anim_1.declare.declare[i].halo}, tx:{desc:o.my.user.anim_1.declare.declare[i].n}}) 
		}
		
		for (var i=0; i < o.my.user.anim_1.folder.folder0.length; i++){
		dataO.push({cmd:{fn:"adv", out:"inspectMyoTier", tierData:undefined}, bt:{b:o.my.user.anim_1.folder.folder0[i].i, halo:o.my.user.anim_1.folder.folder0[i].halo}, tx:{desc:o.my.user.anim_1.folder.folder0[i].n}}) 
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
	
	function advDec(){
	o.xplat.sysoi("menuforward")
	
		if(!o.my.user.anim_1.doc.global[0].id){
			var manager={yFn:docReady, yScope:this, nFN:docNA, nScope:this, myType:"anim_1", myDoc:buildO.buttons[buildO.point].dataO.cmd.doc}
			o.my.getMyDoc(manager)
		}else{docReady()}
	}
	
	function adv(){
	o.xplat.sysoi("menuforward")
	
		m.dataPin = {tier:0, slot:m.dataPin.slot, doc:o.my.user["anim_1"].doc[buildO.buttons[buildO.point].dataO.cmd.doc], tierData:o.my.user["anim_1"].doc[buildO.buttons[buildO.point].dataO.cmd.doc]["folder"+0][0], myType:"anim_1", proc:{fn:"anim"}}
		m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	function docReady(){

		m.dataPin = {tier:0, slot:m.dataPin.slot, doc:o.my.user["anim_1"].doc[buildO.buttons[buildO.point].dataO.cmd.doc], tierData:o.my.user["anim_1"].folder.folder0, myType:"anim_1", proc:{fn:"anim"}}
		m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	function docNA(){
		trace("DOC NOT AVAILABLE")
	}
	
	
	function DU(){buildO.DU();processShift();o.xplat.sysoi("moves")}
	
	function DD(){buildO.DD();processShift();o.xplat.sysoi("moves")}
	
	function DL(){buildO.DL();processShift();o.xplat.sysoi("moves")}
	
	function DR(){buildO.DR();processShift();o.xplat.sysoi("moves")}
	
	function DT(){
		m.advancePanelFade("inspectMyanim_1")	
	}
	
	function processShift(){
		brass.setDescription(buildO.buttons[buildO.point].dataO.tx.desc)
	}

}