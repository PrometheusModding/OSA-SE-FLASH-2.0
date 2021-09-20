/**
 * ...
 * @author Prometheus
 */

import osa.ui.UIObject;
 
class osa.graphic.Rectangle extends UIObject
{
	public function Rectangle() {}
	
	public function draw():Void 
	{
		var color:Number = 0xFF0000;
		clear()
		beginFill(color, 100)
		lineTo(__width, 0)
		lineTo(__width, __height);
		lineTo(0, __height);
		lineTo(0, 0);
		endFill();
	}	
}