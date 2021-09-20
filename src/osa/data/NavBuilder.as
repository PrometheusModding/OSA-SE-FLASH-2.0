import osa.data.HubScene;
/**
 * ...
 * @author Prometheus
 */


 
class osa.data.NavBuilder
{
	private var _xml:XML;
	private var _hubScene:HubScene
	
	public function NavBuilder(xml:XML, hubScene:HubScene) 
	{
		_xml = xml;
		_hubScene = hubScene;
	}
	
	public function buildNav():Array
	{
		var tabs:Array;
		
		if (_xml.nodeName.toLowerCase != "hubscene" || !_xml.hasChildNodes) return tabs;
		
		var navElement:XMLNode;
		
		for (var e:XMLNode = _xml.firstChild; e != null; e.nextSibling)
		{
			if (e.nodeName.toLowerCase == "nav") navElement = e;
		}
		
		if (navElement == undefined || !navElement.hasChildNodes) return tabs;
		
		for (var e:XMLNode = navElement.firstChild; e != null; e.nextSibling)
		{
			if (e.nodeName.toLowerCase == "tab") tabs.push(e);
		}
		
		
	}	
}