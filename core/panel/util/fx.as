

class core.panel.util.fx {

			
			public static function PFXreveal_basic(panel){
				var alphaTw = new mx.transitions.Tween(panel, "_alpha", mx.transitions.easing.None.easeNone, 0, 100, .2, true);
				var xTw = new mx.transitions.Tween(panel, "_x", mx.transitions.easing.Strong.easeOut, panel._x+10, panel._x, .2, true);

			}
			
			public static function PIFXtog_basic(dataArr){
				for (var i=0; i < dataArr.length; i++){
				var xscaleTw = new mx.transitions.Tween(dataArr[i], "_xscale", mx.transitions.easing.Strong.easeOut, 0, 100, .4*("1."+i), true);
				}

			}
			
			public static function PIFXreveal_basic(dataArr){
				for (var i=0; i < dataArr.length; i++){
				//var xscaleTw = new mx.transitions.Tween(dataArr[i], "_xscale", mx.transitions.easing.Strong.easeOut, 0, 100, .3, true);
				//var yscaleTw = new mx.transitions.Tween(dataArr[i], "_yscale", mx.transitions.easing.Strong.easeOut, 0, 100, .3, true);
				var xTw = new mx.transitions.Tween(dataArr[i], "_x", mx.transitions.easing.Strong.easeOut, dataArr[i]._x+40, dataArr[i]._x, .3, true);
				var alphaTw = new mx.transitions.Tween(dataArr[i], "_alpha", mx.transitions.easing.None.easeNone, 0, 100, .2, true);
				}

			}

			public static function PIFXback_basic(dataArr){
				for (var i=0; i < dataArr.length; i++){
				var xTw = new mx.transitions.Tween(dataArr[i], "_x", mx.transitions.easing.Strong.easeOut, dataArr[i]._x-50, dataArr[i]._x, .3, true);
				var alphaTw = new mx.transitions.Tween(dataArr[i], "_alpha", mx.transitions.easing.None.easeNone, 0, 100, .2, true);
				}

			}
			
			public static function POFXreveal_basic(panel){
				var alphaTw = new mx.transitions.Tween(panel, "_alpha", mx.transitions.easing.None.easeNone, 0, 100, .2, true);

			}
			
			public static function ilight(bt){
				bt._xscale = 105
				bt._yscale = 105
			}
			
			public static function idim(bt){
				bt._xscale = 100
				bt._yscale = 100
			}
		
}