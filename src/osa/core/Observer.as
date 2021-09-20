/**
 * ...
 * @author Prometheus
 */

class osa.core.Observer
{
	private var _subscribers:Array;
	
	public function Observer()
	{
		_subscribers = new Array();
	}
	
	public function addSubscriber(instance:Object):Boolean
	{
		for (var i = 0; i < this._subscribers.length; i++)
		{
			if (this._subscribers[i] == instance)
			{
				return false;
			}	
		}
		
		this._subscribers.push(instance);
		
		return true;
	}
	
	public function removeSubscriber(instance:Object):Boolean
	{
		for (var i = 0; i < this._subscribers.length; i++)
		{
			if (this._subscribers[i] == instance)
			{
				this._subscribers.splice(i, 1);
				
				return true;
			}
		}
		
		return false;
	}
	
	public function notifyChanges(event:Object):Void
	{
		this._subscribers.reverse();
		
		for (var i:String in this._subscribers)
		{
			this._subscribers[i].update(event);
		}
	}
}