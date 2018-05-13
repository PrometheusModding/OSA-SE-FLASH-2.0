class NP1PageGroup extends MovieClip
{
	

public var o
public var m
public var dia
public var position

public var actraCur	
public var pageCur
public var specialActor

var opos

var ctr			


public var XPack
public var BCount


var R
var C
var TotalCount
var ButtonCount
var ColumnCount
var Vorigin 
			
var hiddenButton

			public function NP1PageGroup(){
			opos = {H:position.H, V:position.V-50}
			Vorigin = position.V-50
			hiddenButton = []
			TotalCount = 0
			ButtonCount = 0
			ColumnCount = 1
			
					if(!specialActor){
					ctr = this.attachMovie("NP1PageControl", "ctr", this.getNextHighestDepth(), {XPack:XPack,Minu:this,actraCur:actraCur,m:m});
								
						while (TotalCount < dia.scene.nav[0].actor[actraCur].page[pageCur].bt.length){	
							
							
							
								 
							
							if (ColumnCount < m.MaxV){			
							// Check here total sum for if adding the button, if so only add to TotalCount
							
							
							var hideButton = false
							for (var i=0; i < dia.scene.nav[0].actor[actraCur].page[pageCur].bt[TotalCount].check.length; i++){  
									 if(!OCheck.makeCheck(o, dia, dia.scene.nav[0].actor[actraCur].page[pageCur].bt[TotalCount].check[i])){hideButton = true}
							}
							
									if(!hideButton){
									this["BType_"+dia.scene.nav[0].actor[actraCur].page[pageCur].bt[TotalCount].t]()
									
									}else{
										TotalCount ++
										hiddenButton.push(dia.scene.nav[0].actor[actraCur].page[pageCur].bt[TotalCount])
										}
							
							
							} else {
							ColumnCount = 1;
							opos.H -= 77
							opos.V = Vorigin
							}
						}
					
					BCount = ButtonCount
					}else{
						this[specialActor]()
					}
			ctr.Init()
			dim()
			}
			
			public function observer(){
				
				
				
				ctr = this.attachMovie("NP1PageControl", "ctr", this.getNextHighestDepth(), {XPack:XPack,Minu:this,actraCur:actraCur,m:m});
								
						this.attachMovie("NP1_BT_Obs", "BT"+ButtonCount, this.getNextHighestDepth(), {XPack:XPack, purpose:"exit", BTdata:dia.module.observer[0].navexit[0], actraCur:actraCur,pageCur:pageCur,TotalBT:TotalCount, o:o, m:m, dia:dia, position:{H:-(opos.H-65),V:opos.V}});					
						opos.V -= 65;
						TotalCount ++;
						ButtonCount ++;
						ColumnCount ++;
									

							ColumnCount = 1;
							opos.H -= 77
							opos.V = Vorigin

					
					BCount = ButtonCount				
			}
			
			
			public function light(){
			this._alpha = 100			
			}
			
			public function dim(){
			this._alpha = 0			
			}
			
			
			public function BType_A(){
				
				// Check here total sum for if adding the button, if so only add to TotalCount
					this.attachMovie("NP1_BT_A", "BT"+ButtonCount, this.getNextHighestDepth(), {XPack:XPack, actraCur:actraCur,pageCur:pageCur,TotalBT:TotalCount, o:o, m:m, dia:dia, position:{H:-(opos.H-65),V:opos.V}});					
					opos.V -= 65;
					TotalCount ++;
					ButtonCount ++;
					ColumnCount ++;
				
			}
			
			public function BType_A2V(){
				// Check here total sum for if adding the button, if so only add to TotalCount
					this.attachMovie("NP1_BT_A", "BT"+ButtonCount, this.getNextHighestDepth(), {XPack:XPack, actraCur:actraCur,pageCur:pageCur,TotalBT:TotalCount, o:o, m:m, dia:dia,position:{H:-(opos.H-65),V:opos.V}});					
					opos.V -= 130;
					TotalCount ++;
					ButtonCount ++;
					ColumnCount +=2;
				
			}
			
			
			
			
			
			
			
			

}