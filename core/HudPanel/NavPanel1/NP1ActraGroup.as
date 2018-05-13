class NP1ActraGroup extends MovieClip
{

public var o
public var m
public var dia
public var position

public var actraCur	
public var actraMenu
public var actraRole
public var specialActor

var XMenu
var XCount 
var XCur

var pos
var opos

var pageActual

			public function NP1ActraGroup(){
			pos = {H:position.H, V:position.V}
			opos = {H:position.H, V:position.V}
			XMenu = []
			XCount = 0 
			XCur = 0
				
			if(!specialActor){	
					if (dia.scene.nav[0].actor[actraCur].page){
					XMenu[XCount] = "Page"
					XCount ++;
					}
				
				pos.V -= 80
				//Offset Vertical
				pageActual = 0
				var MH = pos.H
				
				var TempXPath = this
				var XPack = [] 
				XPack[1] = TempXPath
				
				for (var i=0; i < actraMenu[actraRole].xmenu.length; i++) {
					var Path = actraMenu[actraRole].xmenu[i]
					var VAdj = this["XM_"+actraMenu[actraRole].xmenu[i].cmd](Path, XPack)
					pos.V += VAdj
				}
				
				var pageTotal = 0
				
				while (pageTotal < actraMenu[actraRole].page.length){	
	
				this.attachMovie("NP1PageBT", "PTab"+pageActual, this.getNextHighestDepth(), {actraCur:actraCur,pageCur:pageTotal,actraCur:actraCur, o:o, m:m, dia:dia, position:{H:MH+14, V:pos.V}});
	
				this.attachMovie("NP1PageGroup", "PG"+pageActual, this.getNextHighestDepth(), {XPack:XPack,actraCur:actraCur,pageCur:pageTotal, o:o, m:m, dia:dia, position:{H:pos.H, V:pos.V}});
				
	
					if(this["PG"+pageActual].ButtonCount == 0){
					this["PTab"+pageActual].removeMovieClip()
					
					pageTotal++
					}else{
					MH += 30;
					pageTotal++;
					pageActual++;
					}
				}
			}else{
			this[specialActor](pos)	
			}
			dim()
			}
			
			public function observer(pos){
				XMenu[XCount] = "Page"
				XCount ++;
				
				pos.V -= 80
				//Offset Vertical
				pageActual = 0
				var MH = pos.H
				
				var TempXPath = this
				var XPack = [] 
				XPack[1] = TempXPath
				
				var pageTotal = 0
				
				//while (pageTotal < actraMenu[actraRole].page.length){	
	
				this.attachMovie("NP1PageBT", "PTab"+pageActual, this.getNextHighestDepth(), {actraCur:actraCur,pageCur:pageTotal,actraCur:actraCur, o:o, m:m, specialActor:specialActor, dia:dia, position:{H:MH+14, V:pos.V}});	
				this.attachMovie("NP1PageGroup", "PG"+pageActual, this.getNextHighestDepth(), {XPack:XPack,actraCur:actraCur,pageCur:pageTotal, specialActor:specialActor, o:o, m:m, dia:dia, position:{H:pos.H, V:pos.V}});
				
				/**
					if(this["PG"+pageActual].ButtonCount == 0){
	
					this["PTab"+pageActual].removeMovieClip()
					this["PG"+pageActual].removeMovieClip()
					pageTotal++
					}else{
					MH += 30;
					pageTotal++;
					pageActual++;
					}
				}
				*/
			}
			
			public function XPath(SelActra, SelPage){
			if (XMenu[XCur] == "Page"){return this["PG"+SelPage].ctr}
			else {return this["Speed"].ctr}
			}
			
			public function XM_speed(Path, XPack):Number{
			var XM = this.attachMovie("XMSpeed", "Speed", this.getNextHighestDepth(), {XPack:XPack, actraCur:actraCur, actraRole:actraMenu[actraRole].a, o:o, m:m, dia:dia, position:{H:opos.H+8, V:opos.V-80}});
			var VAdj = XM.startMenu()
			XMenu[XCount] = "Speed"
			XCount ++;
			return VAdj
			}
			
			public function light(){
			this._alpha = 100			
			}
			
			public function dim(){
			this._alpha = 0			
			}
			
			public function pushXMenu(Side){
			var Total = XMenu.length
				m.ctr.cmdCurMenu("Exit")
				if (Side == "U"){
					if (XCur <= 0){XCur = Total-1}
					else{XCur -= 1}					
				}
				else if (Side == "D"){
					if (XCur >= Total-1){XCur = 0}
					else{XCur += 1}	
				}		
				m.ctr.cmdCurMenu("Enter")

			}

}