import mx.utils.Delegate;
import XMLParser;

class Load{

private var callBack 
private var args = []
private var dir

		function Load(){
			args = []
		}

		function getDoc(directory){			
			var lv = new LoadVars();
			lv.onData = Delegate.create(this, onXMLLoad)
			lv.load(dir);
		}


		function onXMLLoad(xml){
		args[0] = xml
		callBack.fn.apply(callBack.scope, args)		
		}
	
	
		function makeEntry(xml){
		var parse = new XMLParser();
		return parse.parseXML(xml)
		}
}