

class core.panel.major._longText extends MovieClip
{
	
public var o
public var actra
public var longText
var iniText
var panel
var horizon

var isLog

			public function _longText(){	
				horizon = -10
				panel = this
				makeOverlay()			
				
			}
			
			function makeOverlay(){
				
				var cur
				var type
				var yLoc = -18
				
				
				type = new TextFormat();
				type.letterSpacing = 1.1
				type.font = o.fonts.m

				if(isLog){
					if(!o.cfg.xconfig.menuConfig[0].descLogText[0].size){
					type.size = 7
					}else{
					type.size = o.cfg.xconfig.menuConfig[0].descLogText[0].size
					}
				}
				else{
					if(!o.cfg.xconfig.menuConfig[0].descTallText[0].size){
					type.size = 8
					}else{
					type.size = o.cfg.xconfig.menuConfig[0].descTallText[0].size
					}
				}
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon, _y:yLoc}).val	
				
				if(isLog){
					var L = longText.length
					var lastIx = longText.lastIndexOf("\n")
					var maxLines = o.cfg.xconfig.menuConfig[0].descLogText[0].maxLines
					for (var i=0; i < maxLines; i++){
						lastIx = longText.substr(o, lastIx).lastIndexOf("\n")						
						if(lastIx==-1){i+=5000}
						
					}					

					if(i<=4000){
						longText = longText.substr(lastIx)
						longText = "ONLY SHOWING LAST "+maxLines+" LINES...\n"+longText
					}
					
				}
				cur.htmlText = longText
				cur.setTextFormat(type);
				cur.multiline = true
				cur.autoSize = "right";
				
				cur._y = 0-cur._height
				
				
				OADraw.OLine(this, 0, 0, 0, 0-cur._height, "0xFFFFFF", .25)		
			}
					
			

			
			
}