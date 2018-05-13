import gfx.io.GameDelegate;

class core.system.xplatform{

var o

			function xplatform(om){
				o = om
			}
			
			
			
			function sysoi(type){
				GameDelegate.call("PlaySound", ["0SA_SySn_"+type+"_"+o.cfg.config.soundTheme]);
			}
			
			function syso(soundName){
				GameDelegate.call("PlaySound", [soundName]);
			}
			
}