import mx.utils.Delegate;

class core.panel.nav.np2.onav.brass extends MovieClip {

public var o
public var m
public var f
public var x

var _fontDesc
var _fontTitle

var title
var desc

var outV

var permTitleY

	function brass(){
		
				outV = 0 
				
				_fontDesc = new TextFormat();
				_fontDesc.letterSpacing = .8
				_fontDesc.font = o.fonts.m
				_fontDesc.color = "0x"+"FFFFFF"
				_fontDesc.size = 15		
				
				_fontTitle = new TextFormat();
				_fontTitle.letterSpacing = .8
				_fontTitle.font = o.fonts.m
				if(x.bnhue){
					_fontTitle.color = "0x"+core.panel.nav.np2.util.func.hueFormCmd(x.bnhue[0], undefined, o, m)
				}else{
				_fontTitle.color = "0x"+"FFFFFF"
				}
				_fontTitle.size = 25
				
				title = this.attachMovie("textboxl", "brassTitle", this.getNextHighestDepth())
				
				if(!f.noBrassDesc){
				outV -= 25
				desc = this.attachMovie("textboxl", "brassDesc", this.getNextHighestDepth(), {_y:-20})
				m.ctr.updateactraText()
				}
				
				
			
				permTitleY = title._y
			
				updateTitle(core.panel.nav.np2.util.func.navTabTitlePro(x.text, o, m.dia, x))

			}
			

			
			public function updateDesc(newText){	
				if(descText!=newText){
				descText = newText
				//desc.val.htmlText = newText
				//desc.val.setTextFormat(_fontDesc);
				//desc.val.autoSize = "left";
				
				lightDesc()
				}
			}
			
			function updateTitle(newText){				
				titleWriteFX.rewind()
				titleText = newText
				title.val.htmlText = newText
				title.val.setTextFormat(_fontTitle);
				title.val.autoSize = "left";
			
			}

var titleWriteFX
var titleCount
var titleText
var descWriteFX
var descCount
var descText

			function lightTitle(){
				titleWriteFX.rewind()
				titleCount = 0
				writeTitle()
			}
			
			function lightDesc(){
				descWriteFX.rewind()
				descCount = 0
				writeDesc()
			}
			
			function writeTitle(){
				titleWriteFX = new mx.transitions.Tween(this, "titleCount", mx.transitions.easing.None.easeNone, 0, titleText.length, .25, true);
				var alphaFX = new mx.transitions.Tween(title, "_alpha", mx.transitions.easing.None.easeNone, 0, 100, .35, true);
					titleWriteFX.onMotionChanged = Delegate.create(this, function ():Void {					
						title.val.htmlText = titleText.substr(0, titleCount)
						title.val.setTextFormat(_fontTitle);
						title.val.autoSize = "left";
					})
					
		
			}
			
			function writeDesc(){
				descWriteFX = new mx.transitions.Tween(this, "descCount", mx.transitions.easing.None.easeNone, 0, descText.length, .15, true);
				var alphaFX = new mx.transitions.Tween(desc, "_alpha", mx.transitions.easing.None.easeNone, 0, 100, .25, true);
					descWriteFX.onMotionChanged = Delegate.create(this, function ():Void {					
						desc.val.htmlText = descText.substr(0, descCount)
						desc.val.setTextFormat(_fontDesc);
						desc.val.autoSize = "left";
					})
			}
}