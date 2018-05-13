



class core.panel.inspect.infoPersona extends MovieClip {


public var o
public var m



var actra

var buildO
var posO

var buttonFont

var description
var brass
var display

	function infoPersona(){
		
		
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 10
		
		actra = m.actra
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.inspect.brass.typeA(o, m, this, posO, o.cfg.lang.info.toUpperCase())
		
		posO.vStart = posO.v
		
		
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{b:"omu_backmenu"}, tx:{desc:o.cfg.lang.exit.toUpperCase()}}) 
		dataO.push({cmd:{fn:"", out:""}, bt:{b:"omu_personavoice"}, hud:{sy:"oconMiniCircle", panel:"_InfoActorPerIntSound"}, tx:{desc:o.cfg.lang.sounds.toUpperCase()+" | "+o.cfg.lang.intimate.toUpperCase()}})
		dataO.push({cmd:{fn:"", out:""}, bt:{b:"omu_personaexpression"}, hud:{sy:"oconMiniCircle", panel:"_InfoActorPerIntClass"}, tx:{desc:o.cfg.lang.personaClass.toUpperCase()+" | "+o.cfg.lang.intimate.toUpperCase()}})
		dataO.push({cmd:{fn:"", out:""}, bt:{b:"omu_personareaction"}, hud:{sy:"oconMiniCircle", panel:"_InfoActorPerIntReaction"}, tx:{desc:o.cfg.lang.reaction.toUpperCase()+" | "+o.cfg.lang.intimate.toUpperCase()}})



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
		display = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "option", this.getNextHighestDepth(), {o:o, actra:actra, _x:posO.h, horizon:posO, mode:buildO.buttons[buildO.point].dataO.hud.mode, isLog:buildO.buttons[buildO.point].dataO.tx.isLog, longText:buildO.buttons[buildO.point].dataO.tx.long})
		display._y-=72
		display._x-=42
		display.buildFull()
	}

}
