import osa.graphic.skins.Skin;

/**
 * 
 */
class osa.graphic.skins.Rectangle extends Skin
{
	public function Rectangle() {}
	
	public function draw():Void 
	{
		trace("hello")
		var color:Number = 0xFF0000;
		clear();
		beginFill(color, 100);
		lineTo(__width, 0);
		lineTo(__width, __height);
		lineTo(0, __height);
		lineTo(0, 0);
		endFill();
	}	
}