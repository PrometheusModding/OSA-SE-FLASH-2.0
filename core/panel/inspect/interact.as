

class core.panel.inspect.interact extends MovieClip {


public var o
public var m




var buildO
var posO

var buttonFont

var description
var brass

	function interact(){
		
		if(m.actra.isOnStage()){
		
			if(!o.lib.MLib.get(m.actra.stageStatus.module.id)){
			o.lib.getOData("M", m.actra.stageStatus.module.id, "", checkPandect, this)
			}else{checkPandect()}
				
		}else{dataOut()}
				
		}
	
		function checkPandect(){
			if(!o.lib.PLib.get(m.actra.stageStatus.module.id)){
				o.lib.getOData("P", m.actra.stageStatus.module.id, "", dataOut, this)
			}else{
			dataOut()
			}		
		}
	
	
		function dataOut(){
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 10
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.inspect.brass.typeA(o, m, this, posO, o.cfg.lang.interact.toUpperCase())
		
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.exit.toUpperCase()}}) 
		
		if(m.actra.isOnStage()){
			if(o.lib.PLib.get(m.actra.stageStatus.module.id).multi[0].observer == "1"){
			dataO.push({cmd:{fn:"observe"}, bt:{sy:"oconMiniCircle", b:"omu_observer"}, tx:{desc:o.cfg.lang.observeScene.toUpperCase()}})
			}
			
			if(o.lib.PLib.get(m.actra.stageStatus.module.id).multi[0].visitor == "1"){				
			dataO.push({cmd:{fn:"adv", out:"inspectInteractJoin"}, bt:{sy:"oconMiniCircle", b:"omu_stickfigplus"}, tx:{desc:o.cfg.lang.joinScene.toUpperCase()}})
			}
		}
		
		dataO.push({cmd:{fn:"adv", out:"inspectMyBase"}, pack:{process:"anim", myType:"anim_1"}, bt:{sy:"oconMiniCircle", b:"omu_ballbounce"}, tx:{desc:o.cfg.lang.animate.toUpperCase()}})
		
		
		
		var btGlobal = {xs:60, hxs:75, menuPanel:m, lineThickness:2, lineColor:"0xFFFFFF", fillColor:""}
		
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
	m.dataPin = buildO.buttons[buildO.point].dataO.pack	
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	function join(){
	o.xplat.sysoi("confirmm")
	m.actra.stageStatus.actraInvite("00000007", "20", "0MF2|KNy6!Sx3!PUy6|Sx|Snoop+22Enter")
	}
	
	function observe(){
	o.xplat.sysoi("confirmm")
	o.viewStage = m.actra.stageStatus
	o.viewStage.enterObserver()
	}
	
	function DU(){buildO.DU();processShift();o.xplat.sysoi("moves")}
	
	function DD(){buildO.DD();processShift();o.xplat.sysoi("moves")}
	
	function DL(){buildO.DL();processShift();o.xplat.sysoi("moves")}
	
	function DR(){buildO.DR();processShift();o.xplat.sysoi("moves")}
	
	function processShift(){
		brass.setDescription(buildO.buttons[buildO.point].dataO.tx.desc.toUpperCase())
	}

}