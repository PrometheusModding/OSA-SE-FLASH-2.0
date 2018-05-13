import flash.filters.DropShadowFilter;
import flash.filters.GlowFilter;
class core.panel.major._iniText extends MovieClip
{
	
public var o
public var actra

var iniText
var panel
var horizon


			public function _iniText(){	
				horizon = -10
				panel = this
				makeOverlay()			
				
			}
			
			function makeOverlay(){
				
				var cur
				var type


					
				type = new TextFormat();
				type.letterSpacing = 1.1
				type.font = o.fonts.l
				type.align = "left"
				
				
				cur = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon}).val
				
				
				if(o.cfg.config.largeMenuDescriptions){
				
					if(!o.cfg.xconfig.menuConfig[0].descExplanationBigOptionText[0].size){
					type.size = 14
					}else{
					type.size = o.cfg.xconfig.menuConfig[0].descExplanationBigOptionText[0].size
					}
					
				cur._width = 525
				cur._x = -525
				}else{
					if(!o.cfg.xconfig.menuConfig[0].descExplanationText[0].size){
					type.size = 9
					}else{
					type.size = o.cfg.xconfig.menuConfig[0].descExplanationText[0].size
					}
				cur._width = 375
				cur._x = -375
				}
				
				cur.wordWrap = true
				cur.htmlText = iniText
				cur.multiline = true
				
				cur.autoSize = "left";
				cur.setTextFormat(type);
				cur._y =_y-cur._height
				
				
					if(o.cfg.config.largeMenuDescriptions){
					var textMode = o.cfg.xconfig.menuConfig[0].descExplanationBigOptionText[0]
					}else{
					var textMode = o.cfg.xconfig.menuConfig[0].descExplanationText[0]
					}
								
				var filterArray:Array = new Array();
				if(o.cfg.config.glowLightText){	
					filterArray.push(core.util.func.filterGlow(textMode, 5, 0.4, 2, 4));
				}				
				if(o.cfg.config.dropShadowLightText){					
					filterArray.push(core.util.func.filterDropShadow(textMode, 1, 0.8, 2, 4));					
				}
				
				cur.filters = filterArray;
				
				
				OADraw.OLine(this, 0, 0, 0, 0-cur._height-20, "0xFFFFFF", .25)			
			}
					
			

			
			
}