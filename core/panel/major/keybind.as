
class core.panel.major.keybind extends MovieClip {


public var o
public var m




var buildO
var posO

var buttonFont

var description
var brass
var display

	function keybind(){
		display = []
		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 8
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -110
		posO.btWidth = 18		

		brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang.keybind+" | "+ o.cfg.lang.config, "")
		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
		
		
		dataO.push({cmd:{fn:"bind", ix:7}, bt:{sy:"oconMiniCircleBind", b:"obt_y"}, tx:{desc:o.cfg.lang.yes.toUpperCase()}})
		dataO.push({cmd:{fn:"bind", ix:8}, bt:{sy:"oconMiniCircleBind", b:"obt_n"}, tx:{desc:o.cfg.lang.no.toUpperCase()}})		
		dataO.push({cmd:{fn:"bind", ix:6}, bt:{sy:"oconMiniCircleBind", b:"obt_t"}, tx:{desc:o.cfg.lang.tog.toUpperCase()}})
		dataO.push({cmd:{fn:"bind", ix:0}, bt:{sy:"oconMiniCircleBind", b:"obt_e"}, tx:{desc:o.cfg.lang.end.toUpperCase()}})
		dataO.push({cmd:{fn:"bind", ix:1}, bt:{sy:"oconMiniCircleBind", b:"obt_m"}, tx:{desc:o.cfg.lang.mainMenu.toUpperCase()}})
		dataO.push({cmd:{fn:"bind", ix:9}, bt:{sy:"oconMiniCircleBind", b:"obt_i"}, tx:{desc:o.cfg.lang.inspect.toUpperCase()}})
		dataO.push({cmd:{fn:"bind", ix:11}, bt:{sy:"oconMiniCircleBind", b:"obt_h"}, tx:{desc:"HUD"}})
		
		dataO.push({cmd:{fn:"bind", ix:10}, bt:{sy:"oconMiniCircleBind", b:"obt_v"}, tx:{desc:o.cfg.lang.vanish.toUpperCase()}})
		dataO.push({cmd:{fn:"bind", ix:12}, bt:{sy:"oconMiniCircleBind", b:"obt_o"}, tx:{desc:o.cfg.lang.option.toUpperCase()}})
		
		dataO.push({cmd:{fn:"bind", ix:2}, bt:{sy:"oconMiniCircleBind", b:"obt_u"}, tx:{desc:o.cfg.lang.up.toUpperCase()}})
		dataO.push({cmd:{fn:"bind", ix:3}, bt:{sy:"oconMiniCircleBind", b:"obt_d"}, tx:{desc:o.cfg.lang.down.toUpperCase()}})
		dataO.push({cmd:{fn:"bind", ix:4}, bt:{sy:"oconMiniCircleBind", b:"obt_l"}, tx:{desc:o.cfg.lang.left.toUpperCase()}})
		dataO.push({cmd:{fn:"bind", ix:5}, bt:{sy:"oconMiniCircleBind", b:"obt_r"}, tx:{desc:o.cfg.lang.right.toUpperCase()}})		
		
		
		
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
		core.panel.util.fx.PIFXreveal_basic(buildO.buttons)
	}	
	
	function bind(){
		o.ctr.globalPause = true
		core.util.specialPanel.keybinder(o)
		o.xplat.sysoi("aware")
		skse.StartRemapMode(this)
	}
	
	function EndRemapMode(newKey){
		o.hud.specialPanel.removeMovieClip()
		
		
		var duplicate = false
		var duplicateKey = 0
		for (var i=0; i < o.cfg.binds.OKey.length; i++){
			if(o.cfg.binds.OKey[i] == newKey){
			duplicate = true
			duplicateKey = i
			}
		}	
		
		
		
		if(duplicate){
		o.cfg.binds.OKey[duplicateKey] = o.cfg.binds.OKey[buildO.buttons[buildO.point].dataO.cmd.ix]
		o.skyAll("0SC_BindKey", duplicateKey, o.cfg.binds.OKey[duplicateKey])
			for (var i=0; i < buildO.buttons.length; i++){
				if(buildO.buttons[i].dataO.cmd.ix == duplicateKey){
				buildO.buttons[i].updateBind()
				}
			}
		}
		
		o.cfg.binds.OKey[buildO.buttons[buildO.point].dataO.cmd.ix] = newKey
		o.skyAll("0SC_BindKey", buildO.buttons[buildO.point].dataO.cmd.ix, newKey)

		buildO.buttons[buildO.point].updateBind()
		
		o.xplat.sysoi("learn")
		var time = new Time({fn:bindCoolDown, scope:this}, 1000)
		
	}
	
	function bindCoolDown(){
		o.ctr.globalPause = false	
	}
	
	function DY(){
	   this[buildO.buttons[buildO.point].dataO.cmd.fn]()
	}
	
	function DN(){
	   o.xplat.sysoi("menuback")
	   m.escape()
	}
	
	function adv(){
	o.xplat.sysoi("menuforward")
	m.advancePanelFade(buildO.buttons[buildO.point].dataO.cmd.out)
	}
	
	function esc(){
	o.xplat.sysoi("menuback")
	m.escape()
	}
	
	function targ(){
	o.xplat.sysoi("confirmm")
	o.skyString("0SA_Targeting", buildO.buttons[buildO.point].dataO.cmd.out)
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
		display = this.attachMovie("majorTargetingList", "displayPanel", this.getNextHighestDepth(), {o:o, _x:posO.h-40, _y:-60})
		
		if(display){
		core.panel.util.fx.PFXreveal_basic(display)
		}
	}
	
	function appear(){
		core.panel.util.fx.PIFXreveal_basic(buildO.buttons)
		core.panel.util.fx.POFXreveal_basic(this)
	}

}