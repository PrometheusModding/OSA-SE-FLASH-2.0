



class core.panel.inspect.infoLog extends MovieClip {


public var o
public var m



var actra

var buildO
var posO

var buttonFont

var description
var brass
var display

	function infoLog(){
		
		
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
		dataO.push({cmd:{fn:"printLog", log:"gen"}, hud:{panel:"_majorLongText"}, bt:{sy:"oconMiniCircle", b:"omu_logactor"}, tx:{desc:o.cfg.lang.general+" "+o.cfg.lang.log.toUpperCase(), isLog:true, long:actra.log.gen}})
		dataO.push({cmd:{fn:"printLog", log:"esg"}, hud:{panel:"_majorLongText"}, bt:{sy:"oconMiniCircle", b:"omu_logesg"}, tx:{desc:o.cfg.lang.esg+" "+o.cfg.lang.log.toUpperCase(), isLog:true, long:actra.log.esg}})
		dataO.push({cmd:{fn:"printLog", log:"pro"}, hud:{panel:"_majorLongText"}, bt:{sy:"oconMiniCircle", b:"omu_logprofile"}, tx:{desc:o.cfg.lang.profile+" "+o.cfg.lang.log.toUpperCase(), isLog:true, long:actra.log.pro}})
		dataO.push({cmd:{fn:"printLog", log:"prs"}, hud:{panel:"_majorLongText"}, bt:{sy:"oconMiniCircle", b:"omu_logpersona"}, tx:{desc:o.cfg.lang.persona+" "+o.cfg.lang.log.toUpperCase(), isLog:true, long:actra.log.prs}})
		dataO.push({cmd:{fn:"printLog", log:"bod"}, hud:{panel:"_majorLongText"}, bt:{sy:"oconMiniCircle", b:"omu_logbody"}, tx:{desc:o.cfg.lang.body+" "+o.cfg.lang.log.toUpperCase(), isLog:true, long:actra.log.bod}})
		dataO.push({cmd:{fn:"printLog", log:"gfx"}, hud:{panel:"_majorLongText"}, bt:{sy:"oconMiniCircle", b:"omu_loggfx"}, tx:{desc:"GFX "+o.cfg.lang.log.toUpperCase(), isLog:true, long:actra.log.gfx}})


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
	
	function printLog(){
	o.xplat.sysoi("hello")
	actra.log.printLog(buildO.buttons[buildO.point].dataO.cmd.log)
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
		display = this.attachMovie(buildO.buttons[buildO.point].dataO.hud.panel, "option", this.getNextHighestDepth(), {o:o, actra:actra, _x:posO.h, horizon:posO, isLog:buildO.buttons[buildO.point].dataO.tx.isLog, longText:buildO.buttons[buildO.point].dataO.tx.long})
		display._y-=72
		display._x-=42
		display.buildFull()
	}

}
