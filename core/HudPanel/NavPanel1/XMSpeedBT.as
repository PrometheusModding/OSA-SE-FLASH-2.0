class XMSpeedBT extends MovieClip
{


public var o
public var m
public var dia




public var V
public var H
public var SP
public var CMD
var base
var overlay
var un
var ico
var desc
var cmd

			public function XMSpeedBT(){
			this[CMD]()
			}
			
			public function minus(){
			base = this.attachMovie(SP.menu[0].db, "base", this.getNextHighestDepth(), {_x:H,_y:V});
			overlay = this.attachMovie(SP.menu[0]["do"], "overlay", this.getNextHighestDepth(), {_x:H,_y:V});

			if(o.lib.lang[dia.module.id].user[SP.menu[0].dt]){
			desc = core.util.syntax.SynDesc(o, o.lib.lang[dia.module.id].user[SP.menu[0].dt], SP.menu[0], o.lib.lang[dia.module.id], dia.actra)
			}else if(o.lib.lang[dia.module.id]["default"][SP.menu[0].dt]){
			desc = core.util.syntax.SynDesc(o, o.lib.lang[dia.module.id]["default"][SP.menu[0].dt], SP.menu[0], o.lib.lang[dia.module.id], dia.actra)
			}else{desc = ""}
			
			cmd = "minus"
			dim()
			}
			
			
			
			public function plus(){
			base = this.attachMovie(SP.menu[0].ub, "base", this.getNextHighestDepth(), {_x:H,_y:V});
			overlay = this.attachMovie(SP.menu[0].uo, "overlay", this.getNextHighestDepth(), {_x:H,_y:V});
			
			if(o.lib.lang[dia.module.id].user[SP.menu[0].ut]){
			desc = core.util.syntax.SynDesc(o, o.lib.lang[dia.module.id].user[SP.menu[0].ut], SP.menu[0], o.lib.lang[dia.module.id], dia.actra)
			}else if(o.lib.lang[dia.module.id]["default"][SP.menu[0].ut]){
			desc = core.util.syntax.SynDesc(o, o.lib.lang[dia.module.id]["default"][SP.menu[0].ut], SP.menu[0], o.lib.lang[dia.module.id], dia.actra)
			}else{desc = ""}
			
			cmd = "plus"
			dim()
			}


			public function dim(){
			base._alpha = 60
			overlay._alpha = 0
			}
			
			public function light(){
			base._alpha = 0
			overlay._alpha = 100
			}
			


}