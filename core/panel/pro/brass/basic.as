

class core.panel.pro.brass.basic extends MovieClip
{
public var o
public var actra


var panel
var yLoc
var type
var cur

			function basic(){	
				
				yLoc = -80
				
			}
			
			function fromBlock(basicXML){
				var textParse
				this._x = -10
				type = new TextFormat();
				type.letterSpacing = 1.3
				type.font = o.fonts.m
				type.size = 36
				
				if(basicXML.block[0].color){
				
					textParse = core.panel.pro.util.profunc.proscan(o, actra, basicXML.block[0].color)

						if(textParse=="undefined"){
						type.color = "0x"+o.cfg.xconfig.profileConfig[0].dRGB[0].nameColor
						}else{
						type.color = "0x"+core.panel.pro.util.profunc.proscan(o, actra, basicXML.block[0].color)
						}
				}else{
				 	type.color = "0x"+o.cfg.xconfig.profileConfig[0].dRGB[0].nameColor
				}
				
				cur = this.attachMovie("genericText", "nameVal", this.getNextHighestDepth(), {_y:yLoc}).val					
				cur.htmlText = core.panel.pro.util.profunc.proscan(o, actra, basicXML.block[0].v)
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				
				type = new TextFormat();
				type.letterSpacing = 1.1
				type.size = 9
				
				if(basicXML.block[0].dnv!="undefined"){
				
				
				
					textParse = core.panel.pro.util.profunc.proscan(o, actra, basicXML.block[0].dnv)
					if(textParse!="undefined"){
						
						type = new TextFormat();
						type.letterSpacing = 1.1
						type.size = 9
						
						cur = this.attachMovie("genericText", "titleVal", this.getNextHighestDepth(), {_y:yLoc+40}).val					

				cur.htmlText = textParse
				cur.setTextFormat(type);
				cur.autoSize = "right";
						
					}else{cur._y+=10}				
				}else{cur._y+=10}
				
			
			}
			
			function fromPanel(name, title){
				this._x = -10
				type = new TextFormat();
				type.letterSpacing = 1.3
				type.font = o.fonts.m
				type.size = 36
				
				
				cur = this.attachMovie("genericText", "nameVal", this.getNextHighestDepth(), {_y:yLoc}).val					
				cur.htmlText = name
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				
				type = new TextFormat();
				type.letterSpacing = 1.1
				type.size = 9
				
				if(title){
				cur = this.attachMovie("genericText", "titleVal", this.getNextHighestDepth(), {_y:yLoc+40}).val					

				cur.htmlText = title
				cur.setTextFormat(type);
				cur.autoSize = "right";
				}
			}
			
			
	
}