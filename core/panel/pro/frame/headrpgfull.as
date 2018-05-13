

class core.panel.pro.frame.headrpgfull extends MovieClip
{
	
public var o
public var actra
public var xml
public var frame
public var prodat

public var profileMode
public var horizon

var panel
var yLoc
var type
var cur

var classTypeWidth

var header
			public function headrpgfull(){		
				classTypeWidth = false
				panel = this
				this._x = horizon
				yLoc = -44
				

			}
			
			
			function vsplit(){
				this[frame.style]()
				

			}
			
			function full(){
				this._x = horizon
				var hasR = false
				var hasL = false
					if(frame.rightblock[0]){
					showRightBlock(yLoc)
					hasR = true
					}
				
				var xLoc
				if(classTypeWidth){
					xLoc = -30-classTypeWidth
				}else{xLoc = this._x}
				
					if(frame.leftblock[0]){
						showLeftBlock(yLoc, xLoc)
						hasL = true
					}
				
				if(hasR||hasL){yLoc -= 100}				
				
				if(1==1){showLongBlock(yLoc)}
				
				yLoc -= 40
				
				showMainBlock(yLoc)			
			}
			
			function short(){	
				this._x = horizon
				showMainBlock(yLoc)	
			}
			
			function showMainBlock(yLocation){
				type = new TextFormat();
				type.letterSpacing = 1.3
				type.font = o.fonts.m
				type.size = 36
				var textParse
				
				if(frame.mainblock[0].color){
					textParse = core.panel.pro.util.profunc.proscan(o, actra, frame.mainblock[0].color)

						if(textParse=="undefined"){
						type.color = "0x"+o.cfg.xconfig.profileConfig[0].dRGB[0].nameColor
						}else{
						type.color = "0x"+core.panel.pro.util.profunc.proscan(o, actra, frame.mainblock[0].color)
						}
				}else{
				 	type.color = "0x"+o.cfg.xconfig.profileConfig[0].dRGB[0].nameColor
				}

				cur = this.attachMovie("genericText", "nameVal", this.getNextHighestDepth(), {_y:yLocation}).val					
				cur.htmlText = core.panel.pro.util.profunc.proscan(o, actra, frame.mainblock[0].v)
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				
				
				
				if(frame.mainblock[0].dnv!="undefined"){
					textParse = core.panel.pro.util.profunc.proscan(o, actra, frame.mainblock[0].dnv)
					if(textParse!="undefined"){
						
						type = new TextFormat();
						type.letterSpacing = 1.1
						type.size = 9
						
						cur = this.attachMovie("genericText", "titleVal", this.getNextHighestDepth(), {_y:yLocation+40}).val					

						cur.htmlText = textParse
						cur.setTextFormat(type);
						cur.autoSize = "right";
						
					}else{cur._y+=10}				
				}else{cur._y+=10}
				
			}
			
			function showLongBlock(yLocation){
				
				var xPush = 0
				var textParse
				
					if(frame.longblock[0].genSymbol==1){
						if(actra.gender=="0"){
						cur = this.attachMovie("proMale", "genderIcon", this.getNextHighestDepth(), {_y:yLocation+36})
						cur._yscale = 125
						cur._xscale = 125
						xPush -= 45
						}else{
						cur = this.attachMovie("proFemale", "genderIcon", this.getNextHighestDepth(), {_y:yLocation+36})
						cur._yscale = 140
						cur._xscale = 140
						xPush -= 30
						}
						
						
					}
				
				type = new TextFormat();
				type.letterSpacing = 1.2
				type.font = o.fonts.m
				type.size = 17
				
				cur = this.attachMovie("genericText", "raceVal", this.getNextHighestDepth(), {_y:yLocation+25, _x:xPush}).val					
				
				
						
				cur.htmlText = core.panel.pro.util.profunc.proscan(o, actra, frame.longblock[0].v)

				

				
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				if(frame.longblock[0].dnv){
					textParse = core.panel.pro.util.profunc.proscan(o, actra, frame.longblock[0].dnv)
					if(textParse!="undefined"){
						
						type = new TextFormat();
						type.letterSpacing = 1.2
						type.size = 9.5
						
						cur = this.attachMovie("genericText", "raceVal", this.getNextHighestDepth(), {_y:yLocation+47, _x:xPush}).val					
						cur.htmlText = core.panel.pro.util.profunc.proscan(o, actra, frame.longblock[0].dnv)
						cur.setTextFormat(type);
						cur.autoSize = "right";
						
					}else{cur._y+=10}				
				}else{cur._y+=10}
				

			}
			
			function showLeftBlock(yLocation, xLocation){
				
				type = new TextFormat();
				type.letterSpacing = 1.2
				type.font = o.fonts.m
				type.size = 16
				
				if(frame.leftblock[0].color){
				   type.color = "0x"+header.classType.color
				}
				
				cur = this.attachMovie("genericText", "affiliationVal", this.getNextHighestDepth(), {_y:yLocation, _x:xLocation}).val					
				cur.htmlText = core.panel.pro.util.profunc.proscan(o, actra, frame.leftblock[0].v)
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
					if(frame.leftblock[0].upv){
						
						
						type = new TextFormat();
						type.letterSpacing = 1.2
						type.size = 10
						
						cur = this.attachMovie("genericText", "affiliationRankVal", this.getNextHighestDepth(), {_y:yLocation-14, _x:xLocation}).val					
						cur.htmlText = core.panel.pro.util.profunc.proscan(o, actra, frame.leftblock[0].upv)
						cur.setTextFormat(type);
						cur.autoSize = "right";					
					}
					
					if(frame.leftblock[0].dnv){
						
						
						type = new TextFormat();
						type.letterSpacing = 1.1
						type.size = 9
						
						cur = this.attachMovie("genericText", "affiliationUnitVal", this.getNextHighestDepth(), {_y:yLocation+25, _x:xLocation}).val					
						cur.htmlText = core.panel.pro.util.profunc.proscan(o, actra, frame.leftblock[0].dnv)
						cur.setTextFormat(type);
						cur.autoSize = "right";					
					}
			}
			
			
			
			function showRightBlock(yLocation){
				
				type = new TextFormat();
				type.letterSpacing = 1.2
				type.font = o.fonts.m
				type.size = 16
				
				if(frame.rightblock[0].color){
				   type.color = "0x"+header.classType.color
				}
				
				cur = this.attachMovie("genericText", "classTypeVal", this.getNextHighestDepth(), {_y:yLocation}).val					
				cur.htmlText = core.panel.pro.util.profunc.proscan(o, actra, frame.rightblock[0].v)
				cur.setTextFormat(type);
				cur.autoSize = "right";
				classTypeWidth=cur._width

					if(frame.rightblock[0].upv){
						
						
						type = new TextFormat();
						type.letterSpacing = 1.1
						type.size = 10
						
						cur = this.attachMovie("genericText", "classTypeSkillVal", this.getNextHighestDepth(), {_y:yLocation-14}).val					
						cur.htmlText = core.panel.pro.util.profunc.proscan(o, actra, frame.rightblock[0].upv)
						cur.setTextFormat(type);
						cur.autoSize = "right";					
					}
					
					if(frame.rightblock[0].dnv){
						
						
						type = new TextFormat();
						type.letterSpacing = 1.1
						type.font = o.fonts.m
						type.size = 9
						
						cur = this.attachMovie("genericText", "classTypeLevelVal", this.getNextHighestDepth(), {_y:yLocation+25}).val					
						cur.htmlText = core.panel.pro.util.profunc.proscan(o, actra, frame.rightblock[0].dnv)
						cur.setTextFormat(type);
						cur.autoSize = "right";					
					}
					
					

				
			}
			
	
}