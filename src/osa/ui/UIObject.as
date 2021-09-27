import flash.geom.Point;
import osa.core.IEventDispatcher;
import osa.core.Broadcaster;
import osa.graphic.StyleFormat;
import osa.managers.StyleManager;

/**
 *
 */
class osa.ui.UIObject extends MovieClip implements IEventDispatcher
{
	private static var className:String = "UIObject";
	
	// Holds the className of each UIObject this class inherited from in order of first to last
	private var __classes:Array;
	private var __enabled:Boolean;
	private var __width:Number;
	private var __height:Number;
	private var __initialWidth:Number;
	private var __initialHeight:Number;
	private var __children:Array;
	private var __dispatcher:Broadcaster;
	
	public var styleFormatName:String;
	public var styleFormat:StyleFormat;
	
	public function UIObject()
	{
		if (!_global.StyleManager)
		{
			_global.StyleManager = new StyleManager();
		}
		
		init();
	}
	
	private function init():Void 
	{
		__classes = [UIObject.className]
		__children = [];
		__dispatcher = new Broadcaster();
		__enabled = true;
		tabEnabled = false;
		focusEnabled = false;
		tabChildren = true;
		_focusrect = false;
		useHandCursor = false;
		__width = __initialWidth || _width;
		__height = __initialHeight || _height;
		_xscale = _yscale = 100;
	}
	
	private function resolveGraphic(graphic:String):String {return undefined}
	
	private function getGraphic(graphic:String):String 
	{
		var graph:String = this[graphic];
		
		return (graph != undefined && graph != "") ? graph : resolveGraphic(graphic);
	}
	
	public function dispatchEvent(event:String, params:Object):Void 
	{
		var info:Object = params || {};
		
		info.target = this;
		__dispatcher.dispatchEvent(event, info);
	}
	
	public function addEventListener(event:String, listener:Object, mappedTo:String):Boolean 
	{
		return __dispatcher.addEventListener(event, listener, mappedTo);
	}
	
	public function removeEventListener(event:String, listener:Object):Boolean 
	{
		return __dispatcher.removeEventListener(event, listener);
	}
	
	public function setEnabled(bool:Boolean):Void
	{
		__enabled = enabled = bool;
	}
	
	public function getEnabled():Boolean
	{
		return __enabled;
	}
	
	public function setSize(w:Number, h:Number):Void
	{
		__width = w;
		__height = h;
		dispatchEvent("resize");
	}
	
	public function get width():Number
	{
		return __width;
	}
	
	public function get height(): Number
	{
		return __height;
	}
	
	public function set initialWidth(w:Number):Void
	{
		__initialWidth = w;
	}
	
	public function set initialHeight(h:Number):Void
	{
		__initialHeight = h;
	}
	
	public function get position():Point
	{
		return new Point(this._x, this._y);
	}
	
	public function set position(pos:Point):Void
	{
		this._x = pos.x;
		this._y = pos.y;
	}
	
	public function get top():Number
	{
		return _y;
	}
	
	public function get bottom():Number
	{
		return _y + __height;
	}
	
	public function get left():Number
	{
		return _x;
	}
	
	public function get right():Number
	{
		return _x + __width;
	}
	
	public function createObject(linkID:String, name:String, depth:Number, initObj:Object):MovieClip
	{
		if (depth == null)
		{
			depth = getNextHighestDepth();
		}
		var object:MovieClip = attachMovie(linkID, name, depth, initObj);
		__children.push(object);
		
		return object;
	}
	
	public function createClassObject(class_:Function, name:String, depth:Number, initObj:Object):UIObject
	{
		var linkID:String = "empty class";
		
		Object.registerClass(linkID, class_);
		
		var uiObject:UIObject = UIObject(createObject(linkID, name, depth, initObj));
		
		return uiObject;
	}
	
	public function createEmptyObject(name:String, depth:Number):UIObject
	{
		return createClassObject(UIObject, name, depth);
	}
	
	public function remove():Void
	{
		var children:Number = __children.length;
		var child:MovieClip;
		
		for (var i:Number = children - 1; i > -1; i--)
		{
			child = __children[i];
			
			if (!UIObject(child)) 
			{
				child.removeMovieClip();
				child.unloadMovie();
			} 
			else 
			{
				child.remove();
			}		
		}
		
		_parent.removeChild(this);
		
		this.removeMovieClip();
		this.unloadMovie();
	}
	
	public function removeChild(child:MovieClip):Boolean
	{
		var children:Number = __children.length;
		for (var i:Number = 0; i < children; i++) 
		{
			if (child == __children[i]) 
			{
				__children.splice(i, 1);
				return true;
			}
		}
		
		return false;
	}
	
	public function getChild(name:String):MovieClip 
	{
		return this[name];
	}
	
	/**
	* @return list of classes this UIObject inherited from
	*/	
	public function get classes():Array {
		var arr = [];
		for (var i:Number = 0; i < __classes.length; i++) 
		{
			arr.push(__classes[i]);
		}
		
		return arr;
	}

	public function updateStyles(style:StyleFormat):Void 
	{
		if (style != undefined) 
		{
			if (style != styleFormat) style.addListener(this);
		}
		
		dispatchEvent("restyle");
	}
}