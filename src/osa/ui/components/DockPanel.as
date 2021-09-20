/**
 * ...
 * @author Prometheus
 */

import flash.geom.Point;
import osa.ui.UIObject;
import osa.ui.components.Orientation;
 
class osa.ui.components.DockPanel extends UIObject
{
	private var _orientation:Number;
	
	public function DockPanel(orientation:Number, children:/*UIObject*/Array) 
	{
		if(orientation)	_orientation = orientation;
		if (children) 
		{
			_children = children;
		}
		else
		{
			_children = new /*UIObject*/Array;
		}
		
		updateLayout();
	}
	
	public function createClassObject()
	{
		super.createClassObject();
		
		updateLayout();
	}
	
	public function set orientation(orientation:Number):Void
	{		
		_orientation = orientation;
		
		updateLayout();
	}
	
	public function add(child:UIObject):Void
	{
		_children.push(child);
		
		updateLayout();
	}
	
	public function updateLayout():Void
	{
		_children[0].position = this.position;
		var pos:Point;
		
		switch (_orientation)
		{
			case Orientation.horizontal:
				pos.y = this._y;
				
				for (var i = 1; i < _children.length; i++)
				{
					pos.x = _children[i - 1].right;
					_children[i].position = pos;
				}
				break;
			
			case Orientation.vertical:
				pos.x = this._x;
				
				for (var i = 1; i < _children.length; i++)
				{
					pos.y = _children[i - 1].bottom;
					_children[i].position = pos;
				}
				break;
		}
		
	}
}