class NP1_BT_Obs extends MovieClip
{

public var o
public var m
public var dia
public var position

var pos

public var actraCur	
public var pageCur

public var TotalBT

public var BTdata
public var purpose
var bt
var ico
var halo
var halotype

var desc
var dest
			public function NP1_BT_Obs(){
			pos = {H:position.H, V:position.V}	

			bt = this.attachMovie(BTdata.b, "box", this.getNextHighestDepth(), {_x:pos.H, _y:pos.V});
			ico = this.attachMovie(BTdata.i, "ico", this.getNextHighestDepth(), {_x:pos.H, _y:pos.V});
			
			if (BTdata.h){
			halotype = BTdata.h
			}
			
			if(purpose=="exit"){
			desc = o.cfg.lang.exitObservationMode
			dest = "$ObsExit"
			}
			
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