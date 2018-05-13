class core.panel.nav.np2.onav.page extends MovieClip {

public var o
public var m
public var f
public var x


var outV
var empty


var shell
var bar
var arr
var brass

var cPage

var xmenu
var xmPoint

var activeMenu

var noGrids

var hiddenIcons

var permY
var peg

	function page(){
		activeMenu = undefined
		empty = true		
		shell = this
		noGrids = false
		cPage = 0
		arr = []
		hiddenIcons = []
		xmenu = []		
		ostyle()
	}	
	
	function ostyle(){
					
			var analyze
			var __ico
			var __arr
			var adjV = -55
			
			cPage = 0
			
			peg = this.createEmptyMovieClip("peg", this.getNextHighestDepth())
			
					for (var i=0; i < x.page.length; i++){		
						
						analyze = core.util.circuit.analyzeNav(o, m, x.page[i])
						if(analyze.op=="go"){
							
							var nextGrid = "onav_grid"+core.util.circuit.hasCustom(m, x.page[i], "dgrid", f.dgrid)
							if(nextGrid=="onav_grid" && o.cfg.config.textOptUi == 1){nextGrid="onav_gridtext"}
							
				__arr = peg.attachMovie(nextGrid, "page"+i, peg.getNextHighestDepth(), {o:o,m:m,f:f,x:x.page[i],parentTab:this}) 
							
								if(!__arr.empty){			
									arr.push(__arr)
									empty = false
								}
						}								
					}	
					
					for (var i=0; i < x.xmenu.length; i++){		
						xmenu.push(peg.attachMovie("onavx_"+x.xmenu[i].id, "page"+i, peg.getNextHighestDepth(), {o:o,m:m,f:f,x:x.xmenu[i],parentTab:this})) 
						empty = false
					}
					
			
			if(arr.length > 0 || xmenu.length > 0){
				
				if(arr.length <= 0 && xmenu.length > 0){noGrids=true;activeMenu=xmenu[0];xmPoint=0}
				empty = false				
				
				var v = 0
				
				brass = this.attachMovie("onav_brass"+core.util.circuit.hasCustom(m, x, "dbrass", f.dbrass), "brass", this.getNextHighestDepth(), {o:o,m:m,f:f,x:x})
				
				v+=brass.outV
				
				for (var i=xmenu.length-1; i >= 0; i--){	
				xmenu[i]._y+= v				
				v+=xmenu[i].outV
				}
				
				bar = peg.attachMovie("onav_pagebar"+core.util.circuit.hasCustom(m, x, "dpagebar", f.dpagebar), "bar", peg.getNextHighestDepth(), {o:o,m:m,f:f,_y:v})
				bar.build(arr)				
				
				v+=bar.outV
				
				
				
				
				for (var i=0; i < arr.length; i++){	
						arr[i]._y += v
				}
			}
			
			
			
			selectPage(cPage)
			dim()
			
	}
	
	
				function firstLight(){
					
									}
	
				function buildEnd(){
				if(noGrids){activeMenu.openMenu(1)}
				else{brass.updateDesc(arr[cPage].arr[0].desc)}
				permY = _y
				}
				
				
				
				
				function selectPage(newPage){				
				arr[cPage].dim()				
				cPage = newPage
				arr[cPage].light(newPage)
				arr[cPage].arr[arr[cPage].ctr.point].light()
				
				bar.onPage(newPage)
				f.updateDesc(m.ctr.getCursor().desc)
				}
				
					
				function dim(){
				_visible = false 	
				}
				
				function light(){
				_visible = true 
				lightFX()
				}
				
var alphaTw
var yTw
			function lightFX(){
				
				alphaTw.rewind()
				yTw.rewind()
				alphaTw = new mx.transitions.Tween(peg, "_alpha", mx.transitions.easing.None.easeNone, 0, 100, .25, true);
				yTw = new mx.transitions.Tween(this, "_y", mx.transitions.easing.Strong.easeOut, permY-80, permY, .25, true);
				o.ctr.activateGlobalPause(300)
				}
			
				
				
		function decideMenu(){
			if(!activeMenu){
				return arr[cPage]
			}else{
				return activeMenu
			}
		}
		
				
		function DY(){
			
		decideMenu().DY()		
		}
		
		function DN(){
		decideMenu().DN()			
		}
		
		function DT(){
		decideMenu().DT()				
		}
		
		function DU(){
		decideMenu().DU()				
		}

		function DD(){
		decideMenu().DD()	
		}
		
		function DL(){
		decideMenu().DL()			
		}
		
		function DR(){
		decideMenu().DR()			
		}
		
		function wrapL(){
		decideMenu().wrapL()		
		}
		
		function wrapR(){
		decideMenu().wrapR()			
		}
		
		function upXM(){
			
			if(xmenu[0]){
				if(activeMenu==undefined){xmPoint=xmenu.length-1;arr[cPage].dimCur();activeMenu=xmenu[xmPoint];activeMenu.openMenu()}					
				else if(xmenu[xmPoint-1]){xmPoint--;activeMenu.closeMenu();activeMenu = xmenu[xmPoint];activeMenu.openMenu()}
				else{
					if(noGrids){activeMenu.closeMenu();xmPoint=xmenu.length-1;activeMenu = xmenu[xmPoint];activeMenu.openMenu()}					
					else{activeMenu.closeMenu();activeMenu = undefined;xmPoint=undefined;arr[cPage].lightCur("U")}
					}
					//Sound
					f.inputSnd("shiftx")
				return true
			}else{return false}			
		}
		
		function dnXM(){
			if(xmenu[0]){
				if(activeMenu==undefined){xmPoint=0;arr[cPage].dimCur();activeMenu=xmenu[xmPoint];activeMenu.openMenu()}					
				else if(xmenu[xmPoint+1]){xmPoint++;activeMenu.closeMenu();activeMenu = xmenu[xmPoint];activeMenu.openMenu()}
				else{
					
				if(noGrids){activeMenu.closeMenu();xmPoint=0;activeMenu = xmenu[xmPoint];activeMenu.openMenu()}		
				else{activeMenu.closeMenu();activeMenu = undefined;xmPoint=undefined;arr[cPage].lightCur("D")}
					}
					//Sound
					f.inputSnd("shiftx")
				return true
			}else{return false}			
		}

}