

class core.panel.nav.np2.rep.addactorscan extends MovieClip {

public var o
public var m
public var f
public var g
public var x

var outV
var empty

var arr

var option

var ctr

var scanSig

	function addactorscan(){
			o.xplat.sysoi("confirmm")
			o.targ.resetTarg()
			o.beacon._cbCellScan = {fn:build, scope:this}
			o.skyString("0SA_Targeting", "ScanCell")
			
			m.dia.log.addLog("run", "INVITE SELECTED. Sending request to scan cell for nearby actors...")
		
			scanSig = this.attachMovie("scanningCell", "scanSig", this.getNextHighestDepth(), {o:o, _x:f._x+60, _y:f._y-60})
			
			if(o.flashDevMode){
				
				m.dia.log.addLog("run", "WARNING: Developer Switch ByPass activated in addactorscan()...")
				o.sim.simActraThird()
				o.targ.addTarg(o.sim.simActraThirdID())
				o.beacon.cbCellScan()
			}
			
			
			
	}
	
	function build(){
			
			scanSig.removeMovieClip()
			arr = []		
		
			var v = -30
			var startV = v
			var h = 0
			var incV = -30
			var incH = 70
			var maxV = 99
			
			//------------------
			
			this._x = f._x
			this._y = f._y
			
			
			
			var curCol = 0
			
			var targets = o.targ.all
			
			
					arr.push(this.attachMovie("rep__textlist", "option"+i, this.getNextHighestDepth(), {o:o,m:m,f:f,_y:v,_x:h}))
					arr[0].desc = "RETURN TO SCENE"
					arr[0].dest = "esc"
					arr[0].build()
					
					v += incV
					curCol += 1
									
					var ix = 1
					for (var i=0; i < targets.length; i++){		
					
						if(curCol >= maxV){
							h+=incH
							curCol = 0
							v = startV
						}
		
									if(!targets[i].isOnStage()){
										arr.push(this.attachMovie("rep__textlist", "option"+i, this.getNextHighestDepth(), {o:o,m:m,f:f,_y:v,_x:h}))
										arr[ix].desc = targets[i].name
										arr[ix].dest = "addActor"
										arr[ix].dat = targets[i]
										arr[ix].build()
										ix++
										v += incV
										curCol += 1
										empty = false					
									}
					}	
					
					
					
					
					
			ctr = new core.panel.schematic.ctr4D()
			ctr.build(this, maxV, arr)
			
			arr[0].light("U")
	}
	
	
			function dim(){
			_visible = false 	
			}
			
			function light(){
			_visible = true 	
			}
	
			function DY(){
			this[arr[ctr.point].dest]()
			}
			
			function esc(){
				m.endReplacerMenu()
			}
			
			
	
			function addActor(){
					m.dia.log.addLog("run", "Add Actor Request: "+arr[ctr.point].dat.id+"...")
					if(!arr[ctr.point].dat.isOnStage()){
						o.xplat.sysoi("confirmm")
						m.dia.log.addLog("run", "Add Actor is not on a stage, APPROVED REQUEST and adding...")
						m.dia.actraInvite(arr[ctr.point].dat.id, arr[ctr.point].dat.trueID, x.dest)
						
					}
				
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
			
			function edgeU(){
			ctr.wrapL()
			}
			
			function edgeD(){
			ctr.wrapR()
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
			
			
			function decideMenu(){
				return ctr
			}


}