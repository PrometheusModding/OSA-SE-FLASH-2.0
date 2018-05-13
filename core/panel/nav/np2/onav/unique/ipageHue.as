

class core.panel.nav.np2.onav.unique.ipageHue extends MovieClip {


public var o
public var m
public var xml


		function ipageHue(){				
				if(xml.hue[0]){
					var toneTrans				
					for (var j=0; j < xml.hue.length; j++){					
					core.panel.nav.np2.util.func.hueFormCmd(xml.hue[j], this["Y"], o, m)
					core.panel.nav.np2.util.func.hueFormCmd(xml.hue[j], this["N"], o, m)
					}
				}		
		}
	
}