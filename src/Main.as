/**
 * ...
 * @author Prometheus
 */

class Main
{	
	public static function main():Void
	{
		Object.registerClass("empty class", Root);
		_root.attachMovie("empty class", "root", 0, {_x:75, _y:150});
	}
}