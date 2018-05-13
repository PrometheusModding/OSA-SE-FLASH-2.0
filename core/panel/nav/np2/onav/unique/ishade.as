

class core.panel.nav.np2.onav.unique.ishade extends MovieClip {

var dat
	
	function ishade(){
	var alphaSave = this._alpha
	var toneTrans = new flash.geom.Transform(this);
	
	if(_parent.block.o.cfg.config.iconShading=="1"&&_parent.block.x.ishade[dat._x-30].a){				
	toneTrans.colorTransform = _parent.block.actra[_parent.block.x.ishade[dat._x-30].a].gfx[_parent.block.o.lists.gfx[dat._y]+"RGB"]
	}else{
	this._visible = false
	}
	this._alpha = alphaSave
	
	}
	
	function ishadeBAK (){
	
	var alphaSave = this._alpha
	var toneTrans = new flash.geom.Transform(this);
	toneTrans.colorTransform = _parent._parent.getGFXbyIndex(this, this.dat._x-30, dat._y)
	this._alpha = alphaSave
	}
		
}