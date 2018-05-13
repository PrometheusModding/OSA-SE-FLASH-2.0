class NP1ActraBT extends MovieClip
{

public var o
public var m
public var dia
public var position

public var actraCur

public var specialActor

var base
var bt

var actraName


			public function NP1ActraBT(){
			
			var pos = {H:position.H, V:position.V}
			
			if (!specialActor){
			bt = this.attachMovie(dia.scene.nav[0].actor[actraCur].b, bt, this.getNextHighestDepth(), {_x:pos.H, _y:pos.V});
			actraName = dia.actra[dia.scene.nav[0].actor[actraCur].a].name
			}else{
			this[specialActor](pos)
			}
			
			dim()
			}


			function observer(pos){
			bt = this.attachMovie(dia.module.observer[0].signet, bt, this.getNextHighestDepth(), {_x:pos.H, _y:pos.V});
			actraName = o.cfg.lang.observer
			}
			
			public function dim(){
			bt.b._alpha = 0
			bt.o._alpha = 0
			}
			
			public function light(){
			bt.b._alpha = 90
			bt.o._alpha = 100
			}
}