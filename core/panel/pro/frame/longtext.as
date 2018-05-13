

class core.panel.pro.frame.longtext extends MovieClip
{
	
public var o
public var actra
public var xml
public var frame
public var prodat


public var profileMode
public var horizon
var horizon2
var yLoc
var hPad

var typeVal
var typeVar

var ySave

var wide
var matchline

var frameHeight
var extraHeight

			public function longtext(){	
				extraHeight = 0
			}
			
			public function vsplit(){
				yLoc = -11
				hPad = 75 
				horizon2 = horizon-(hPad*2)
				makeOverlay()							
			}
			
			public function tall(){
				yLoc = -11
				hPad = 75 
				horizon2 = horizon-(hPad*2)
				makeOverlay()							
			}
		
			
			function makeOverlay(){				
				
				
				var _bodyfont = new TextFormat()
						_bodyfont = new TextFormat();
						_bodyfont.font = o.fonts.l
						_bodyfont.letterSpacing = 1.1
						_bodyfont.leading = 5
						_bodyfont.size = 8.5
						_bodyfont.align = "left"


				var storyBox = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon})	
				
				
				if(frame.box[0].width){wide = frame.box[0].width}
				else{wide = 300}

				storyBox.val.wordWrap = true; 
				storyBox.val.multiline = true;
				storyBox.val._width = wide
				storyBox.val._x = -wide
				storyBox.val.autoSize = "left";	
				storyBox.val.htmlText = core.panel.pro.util.profunc.protext(o, actra, core.panel.pro.util.profunc.proscan(o, actra, frame.page[0].v))
				storyBox.val.setTextFormat(core.util.func.fontblock(o, _bodyfont, frame.font[0]));
				ySave = yLoc-storyBox._height
				storyBox._y = ySave+50
				
				
				
				
				
				
				if(frame.line[0]){
				var color
				var thickness
				if(frame.line[0].color){color = "0x"+frame.line[0].color}
				else{color = "0xFFFFFF"}
				if(frame.line[0].thick){thickness = frame.line[0].thick}
				else{thickness = .25}
				OADraw.OLine(this, -wide-25, 0, -wide-25, -storyBox._height, color, thickness)
				matchline = {tall:-storyBox._height, color:color, thickness:thickness}
				}
				
				frameHeight = storyBox._height
				storyBox._y = -storyBox._height
				
				
					if(frame.title[0]){

					
						var _font = new TextFormat()
						_font = new TextFormat();
						_font.letterSpacing = 1.1
						_font.size = 10
						_font.align = "left"
						
						var titlebox = storyBox.attachMovie("genericText", "titlemain", storyBox.getNextHighestDepth(), {_y:-50}).val					
						titlebox.htmlText = core.panel.pro.util.profunc.proscan(o, actra, frame.title[0].v)
						titlebox.setTextFormat(core.util.func.fontblock(o, _font, frame.title[0]));
						titlebox.autoSize = "right";
						titlebox._x = -wide			
				
						if(frame.title[0].subtitle[0]){

						var subtitlebox = storyBox.attachMovie("genericText", "subtitlemain", storyBox.getNextHighestDepth(), {_y:-30}).val					
						subtitlebox.htmlText = core.panel.pro.util.profunc.proscan(o, actra, frame.title[0].subtitle[0].v)
						subtitlebox.setTextFormat(core.util.func.fontblock(o, _font, frame.title[0].subtitle[0]));
						subtitlebox.autoSize = "right";
						subtitlebox._x = -wide			
				
						}
						
						extraHeight = 50
						frameHeight += extraHeight
					}
					
					
					core.panel.pro.util.profunc.probrass(o, actra, frame.brass[0], storyBox, -extraHeight-20)
			}


	
				
			

}