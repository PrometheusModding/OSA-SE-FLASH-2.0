import mx.transitions.Tween;
import mx.transitions.easing.*;
import flash.geom.ColorTransform;
import mx.utils.Delegate;

class core.util.gloryFX {

	
public var o
public var hu
			

var rb
var gb
var bb
			function gloryFX(){
				rb.stop()
				gb.stop()
				bb.stop()
			}
		
			function rainbow(){
					var c = hu.transform.colorTransform;
					rb = new mx.transitions.Tween(c, "redOffset", mx.transitions.easing.None.easeNone, c.redOffset, Math.random() * 0xFF, .75, true);
					gb = new mx.transitions.Tween(c, "greenOffset", mx.transitions.easing.None.easeNone, c.greenOffset, Math.random() * 0xFF, .75, true);
					bb = new mx.transitions.Tween(c, "blueOffset", mx.transitions.easing.None.easeNone, c.blueOffset, Math.random() * 0xFF, .75, true);
					rb.onMotionChanged = Delegate.create(this, function ():Void {
					hu.transform.colorTransform = c;
					});
					 
					rb.onMotionFinished = Delegate.create(this, function ():Void {					
					rainbow()
					})
			}
			
}