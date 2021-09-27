/**
 * ...
 * @author Prometheus
 */

import flash.geom.Point;
import osa.ui.UIObject;
import osa.ui.components.Orientation;
 
class osa.ui.components.DockPanel extends UIObject
{	
	private var __orientation:Number;
	
	public function DockPanel() {}
	
	public function init() 
	{
		super.init();
	}
	
	public function createClassObject(class_:Function, name:String, depth:Number, initObj:Object):UIObject 
	{
		var uiObject:UIObject = super.createClassObject(class_, name, depth, initObj);
		updateLayout();
		return uiObject;
	}
	
	public function set orientation(orientation:Number):Void
	{		
		__orientation = orientation;
		
		updateLayout();
	}
	
	public function add(child:UIObject):Void
	{
		__children.push(child);
		
		updateLayout();
	}
	
	public function clear():Void
	{
		for (var i = __children.length - 1; i > -1; i--)
		{
			__children[i].remove();
		}
	}
	
	public function updateLayout():Void
	{
		var child:UIObject;
		var pos:Point = position;
		
		child = __children[0];
		
		child.position = this.position;
		
		var width:Number = child.width;
		var height:Number = child.height;
		
		if (__orientation == Orientation.horizontal)
		{
			
			for (var i = 1; i < __children.length; i++)
			{
				pos.x = child.right;
				
				child = __children[i];
				
				width += child.width;
				if (child.height > height) height = child.height;
				
				child.position = pos;
			}			
		}
		else if (__orientation == Orientation.vertical)
		{
			
			for (var i = 1; i < __children.length; i++)
			{
				pos.y = child.bottom;
				
				child = __children[i];
				
				height += child.height;
				if (child.width > width) width = child.width;
				
				child.position = pos;
			}
		}
		
		setSize(width, height);
	}
}