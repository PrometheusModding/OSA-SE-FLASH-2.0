class NP1PageBT extends MovieClip
{

public var o
public var m
public var dia
public var position

public var actraCur
public var pageCur

var bt 

			public function NP1PageBT(){
			var pos = {H:position.H, V:position.V}
			
			bt = this.attachMovie(dia.scene.nav[0].actor[actraCur].page[pageCur].b, bt, this.getNextHighestDepth(), {_x:pos.H, _y:pos.V});
			dim()
			}
			
			
			public function dim(){
			bt.b._alpha = 100
			bt.o._alpha = 0
			}
			
			public function light(){
			bt.b._alpha = 0
			bt.o._alpha = 100
			}

}