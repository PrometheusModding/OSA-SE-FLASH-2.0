import flash.filters.GlowFilter;

class core.panel.button.oconMiniCircleColor extends MovieClip {

public var o
public var dataO
public var posO
public var btGlobal

var base
var icon
var sele
var title

	function oconMiniCircleColor(){
		base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, btGlobal.lineThickness, btGlobal.lineColor, dataO.color)
		
		if(dataO.custom>0){
			var icoText = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth())
				
				var type = new TextFormat();
				type.letterSpacing = 1
				type.font = o.fonts.m				
				type.size = 20
				icoText.val.htmlText = "C"+dataO.custom				
				icoText.val.autoSize = "right";
				icoText.val.setTextFormat(type);
				icoText._x += 15.5
				icoText._y -= 7.5
				
				var filterArray:Array = new Array();
				
					var color:Number = 0xFFFFFF;
					var alpha:Number = 0.8;
					var blurX:Number = 6;
					var blurY:Number = 6;
					var strength:Number = 2;
					var quality:Number = 4;
					var inner:Boolean = false;
					
					var filter:GlowFilter = new GlowFilter(color,alpha,blurX,blurY,strength,quality,inner);

					filterArray.push(filter);				
				
					icoText.val.filters = filterArray;

		}
	}	
	
	function build(){
		base = core.util.draw.circle(this.createEmptyMovieClip("base", this.getNextHighestDepth()), 0, 0, posO.btWidth, btGlobal.lineThickness, btGlobal.lineColor, dataO.color)
	}
	
	function update(){
		dim()
		light()
	}
	function light(){
		sele = this.attachMovie("mh_bigdot", "option", this.getNextHighestDepth(), {_xscale:btGlobal.hxs, _yscale:btGlobal.hxs})
		core.panel.util.fx.ilight(this)
		var haloTrans = new flash.geom.Transform(sele.gx);
		var haloHue = new flash.geom.ColorTransform
		haloHue.rgb = o.cfg.config.themeColorHex
		haloTrans.colorTransform = haloHue
	}
	
	function dim(){
		core.panel.util.fx.idim(this)
		sele.removeMovieClip()
	}	

}