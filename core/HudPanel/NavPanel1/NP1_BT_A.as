class NP1_BT_A extends MovieClip
{

public var o
public var m
public var dia
public var position

var pos

public var actraCur	
public var pageCur

public var TotalBT

var BTdata

var bt
var ico
var halo
var halotype

var desc
var dest
			public function NP1_BT_A(){
			pos = {H:position.H, V:position.V}
			
			
			
			var BTdata = dia.scene.nav[0].actor[actraCur].page[pageCur].bt[TotalBT]
			bt = this.attachMovie(BTdata.b, "box", this.getNextHighestDepth(), {_x:pos.H, _y:pos.V});
			ico = this.attachMovie(BTdata.i, "ico", this.getNextHighestDepth(), {_x:pos.H, _y:pos.V});
			
			if (BTdata.h){
			halotype = BTdata.h
			}
					
			if(o.lib.lang[dia.module.id].user[BTdata.n[0].desc]){
			desc = core.util.syntax.SynDesc(o, o.lib.lang[dia.module.id].user[BTdata.n[0].desc], BTdata.n[0], o.lib.lang[dia.module.id], dia.actra)
			}else if(o.lib.lang[dia.module.id]["default"][BTdata.n[0].desc]){
			desc = core.util.syntax.SynDesc(o, o.lib.lang[dia.module.id]["default"][BTdata.n[0].desc], BTdata.n[0], o.lib.lang[dia.module.id], dia.actra)
			}else{desc = ""}
			
			dest = BTdata.n[0].dest
			dim()
			}
			
			
			public function dim(){
			bt.b._alpha = 90
			bt.o._alpha = 0
			this.halo.removeMovieClip()
			}
			
			public function light(){
			bt.b._alpha = 90
			bt.o._alpha = 100
			halo = this.attachMovie(halotype, "halo", this.getNextHighestDepth(), {_x:pos.H, _y:pos.V});
			}
			
			public function opDest(){
			return dest
			}
}