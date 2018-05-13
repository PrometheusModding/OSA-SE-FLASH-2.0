class core.panel.nav.np2.onav.grid extends MovieClip {

public var o
public var m
public var f
public var x
public var parentTab
var outV
var empty
var arr
var ctr
var permX
var maxV


	function grid(){
		empty = true		
		arr = []							
		
		
			
			var analyze
			var v = -38
			var startV = v
			var h = 30
			var incV = -70
			var incH = 70
			maxV = 4
			var row = 0
			//------------------
			
			
			if(o.cfg.config.smallNavigationIcons==1){
			incV = -52
			incH = 52
			}
			
			var curCol = 0
			
			
			
					for (var i=0; i < x.option.length; i++){		
					
						if(curCol >= maxV){
							h+=incH
							curCol = 0
							v = startV
							row++
						}
						analyze = core.util.circuit.analyzeNav(o, m, x.option[i])
						if(analyze.op=="go"){				
									arr.push(this.attachMovie("onav_option"+core.util.circuit.hasCustom(m, x.option[i], "doption", f.doption), "option"+i, this.getNextHighestDepth(), {o:o,m:m,f:f,x:x.option[i],p:this,arrn:arr.length,row:row,_y:v,_x:h}))
									v += incV
									curCol += 1
									empty = false
						}else{
							parentTab.hiddenIcons.push({option:x.option[i], analyze:analyze})}								
					}	
					
					
			ctr = new core.panel.schematic.ctr4D()
			ctr.build(this, maxV, arr)
			
			
			//add to the list in the overlay to rebuild all entries (To update icons when changes occur to things like equipment from the scene menu.			
			for (var i=0; i < arr.length; i++){	
			m.rebuildArr.push(arr[i])
			}
			
			
			permX = _x
			
			
			alphaTw = new mx.transitions.Tween(this, "_alpha", mx.transitions.easing.None.easeNone, 0, 100, .25, true);
			alphaTw.fforward()
			widthTw = new mx.transitions.Tween(this, "_x", mx.transitions.easing.None.easeNone, permX-100, permX, .15, true);
			widthTw.fforward()	
			dim()
	}
	
	
			function dim(){
			_visible = false 	
			}
			
			function light(){
			_visible = true 	
			if(!f.enterFxPlay){lightFX()
			}
			}
			
var alphaTw
var widthTw
			function lightFX(){
				alphaTw.rewind()
				widthTw.rewind()
				alphaTw.start()
				widthTw.start()
				o.ctr.activateGlobalPause(250)
			}
			
			
			
		
			function lightCur(dir){
				if(dir){ctr["arrive"+dir]()}
				arr[ctr.point].light()
			}
			
			function dimCur(){
				arr[ctr.point].dim()
			}
			
			function DY(){			
			f.inputSnd("confirmm")
			if(arr[ctr.point].cmd){
			core.panel.nav.np2.util.optionOutput[arr[ctr.point].cmd.toLowerCase()](o, m, f, this, arr[ctr.point].x.cmd[0])
			}
			else{m.ctr.outputMenuSelection(arr[ctr.point], arr[ctr.point].x)}			
			}
			
			function DT(){
			if(f.tab.length > 1){m.ctr.goTog()}
			else{f.inputSnd("blocks")}

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
			
			function wrapU(){
			if(parentTab.upXM()){}
			else{ctr.wrapU()}	
			}
			
			function wrapD(){
			if(parentTab.dnXM()){}
			else{ctr.wrapD()}	
			}
			
			function edgeU(){
			ctr.wrapU()
			}
			
			function edgeD(){
			ctr.wrapD()
			}
			
			function edgeL(){
							
			m.ctr.edgeL()
			}
			
			function wrapL(){
			ctr.wrapL()
			}
			
			function edgeR(){
			m.ctr.edgeR()
			}
			
			function wrapR(){
			ctr.wrapR()
			}
			
			function edgeWrap(edgeFrom){
			ctr.edgeWrap(edgeFrom)
			}
			
			function decideMenu(){
				return ctr
			}


}