class NP1Actra extends MovieClip
{

public var o
public var m
public var dia
public var position

var noBT



			public function NP1Actra(){
			var pos = {H:position.H, V:position.V}
			var actraCount = 0
			var MH = pos.H
			var actraMenu = []
			noBT = []	

				for (var i=0; i < dia.actra.length; i++) {
					actraMenu[dia.scene.nav[0].actor[i].a] = dia.scene.nav[0].actor[i]	
				}

				
				for (var i=0; i < dia.scene.actors; i++) {
					if (actraMenu[i]){
					this.attachMovie("NP1ActraBT", "ATab"+actraCount, this.getNextHighestDepth(), {actraCur:actraCount, o:o, m:m, dia:dia, position:{H:MH+8, V:pos.V+15}});
					this.attachMovie("NP1ActraGroup", "AG"+actraCount, this.getNextHighestDepth(), {actraCur:actraCount, actraMenu:actraMenu, actraRole:i, o:o, m:m, dia:dia, position:pos});
					actraCount++;
					}
					else{					
					noBT[i] = this.attachMovie(dia.module.role[i].gfx[0].signet, noBT[i], this.getNextHighestDepth(), {_x:MH+8, _y:pos.V+15});
					noBT[i].b._alpha = 0
					noBT[i].o._alpha = 0
					}
					MH += 35;	
				}
				
				if(dia.observed){
					this.attachMovie("NP1ActraBT", "ATab"+actraCount, this.getNextHighestDepth(), {actraCur:actraCount, o:o, m:m, dia:dia, specialActor:"observer", position:{H:MH+8, V:pos.V+15}});
					this.attachMovie("NP1ActraGroup", "AG"+actraCount, this.getNextHighestDepth(), {actraCur:actraCount, actraMenu:actraMenu, specialActor:"observer", actraRole:i, o:o, m:m, dia:dia, position:pos});
					MH += 35;	
					actraCount++;
				}
				
				m.ctr.actraMenuTotal = actraCount;
			}
			
			
			

}