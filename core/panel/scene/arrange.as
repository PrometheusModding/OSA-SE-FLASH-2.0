

class core.panel.scene.arrange extends MovieClip {


public var o
public var m




var buildO
var posO
var swapButtons

var buttonFont

var description
var brass

var tempActra

var selectra

	function arrange(){	
		swapButtons = []		
		tempActra = []
		for (var i=0; i < m.dia.actra.length; i++){
			tempActra[i] = m.dia.actra[i]
		}
		buildMenu()
	}
	
	function buildMenu(){
		

		buildO = new core.panel.button.builder4D()
		buildO.maxCol = 12
		
		posO = new core.panel.button.positioner()
		posO.vOff = -50
		posO.hOff = -50
		posO.btWidth = 18		

		brass = new core.panel.major.brass.typeA(o, this, posO, o.cfg.lang.arrange.toUpperCase(), "")

		posO.vStart = posO.v
		
		var dataO = []
		
		dataO.push({cmd:{fn:"esc"}, bt:{sy:"oconMiniCircle", b:"omu_backmenu"}, tx:{desc:o.cfg.lang.back.toUpperCase()}}) 
			
		if(tempActra.length == 2){
		dataO.push({cmd:{fn:"swap"}, bt:{sy:"oconMiniCircle", b:"omu_arrange"}, tx:{desc:o.cfg.lang.swapRoles.toUpperCase()}}) 		
		}else if(tempActra.length >= 3){
			
		
		
		dataO.push({cmd:{fn:"swapMulti"}, bt:{sy:"oconMiniCircle", b:"omu_arrange"}, tx:{desc:o.cfg.lang.swapRoles.toUpperCase()}})
		
			for (var i=0; i < tempActra.length; i++){
				dataO.push({cmd:{fn:"select"}, ix:i, bt:{sy:"oconArrange"}, tx:{desc:undefined}})				
				swapButtons.push(dataO.length-1)
			}
		}
		
			
		
		
		var btGlobal = {xs:60, hxs:75, toff:-27, menuPanel:m, lineThickness:2, lineColor:"0xFFFFFF", fillColor:""}
		
		for (var i=0; i < dataO.length; i++){
			if(buildO.col < buildO.maxCol){
			buildO.buttons[i] = this.attachMovie(dataO[i].bt.sy, "option", this.getNextHighestDepth(), {o:o, dia:m.dia, _x:posO.h, _y:posO.v, posO:posO, dataO:dataO[i], btGlobal:btGlobal})
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
	
	
	public function swap(){
			o.xplat.sysoi("confirmm")
			m.dia.arrangeActra()
	}
	
	public function swapMulti(){
			o.xplat.sysoi("confirmm")		
			m.dia.arrangeActraMulti(tempActra)
			
			for (var i=0; i < swapButtons.length; i++){
			buildO.buttons[swapButtons[i]].update()
			}
	}
	
	public function select(){
			
			if(selectra){
				if(selectra.dataO.ix!=buildO.buttons[buildO.point].dataO.ix){
					var storeActra = tempActra[buildO.buttons[buildO.point].dataO.ix]
					tempActra[buildO.buttons[buildO.point].dataO.ix] = tempActra[selectra.dataO.ix]
					var storeIX = buildO.buttons[buildO.point].dataO.ix
					buildO.buttons[buildO.point].dataO.ix = selectra.dataO.ix
					tempActra[selectra.dataO.ix] = storeActra
					selectra.dataO.ix = storeIX
					buildO.buttons[buildO.point].update()
					selectra.update()
					buildO.buttons[buildO.point].light()
					selectra().dim
					selectra = undefined
					o.xplat.sysoi("confirmm")
				}else{
					o.xplat.sysoi("togglex")
					selectra.select()
					selectra = undefined
				}
			}else{
					   o.xplat.sysoi("confirmm")
					   selectra = buildO.buttons[buildO.point]
					   selectra.select()
			}
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
	o.xplat.sysoi("confirms")
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