

class ProfileBio extends MovieClip
{
	
public var o
public var dia
public var actra
public var proDat
public var profileMode
public var horizon
var horizon2
var yLoc
var hPad

var typeVal
var typeVar

var ySave
			public function ProfileBio(){	
				
			}
			
			public function buildFull(){
			
				yLoc = -11
				hPad = 75 
				horizon2 = horizon-(hPad*2)
				makeOverlay()				
			
			}
		
			
			function makeOverlay(){
			
				
				
				var bodyType = new TextFormat();
				bodyType.letterSpacing = 1.1
				bodyType.font = o.fonts.l
				bodyType.size = 8.5
				bodyType.align = "left"
				bodyType.indent = 50
				bodyType.leading = 5
				
				var storyBox = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_x:horizon})	
				
				
				storyBox.val.wordWrap = true; 
				storyBox.val.multiline = true;
				storyBox.val._width = 300
				storyBox.val._x = -300
				storyBox.val.autoSize = "left";	
				storyBox.val.htmlText = proDat.biography
				storyBox.val.setTextFormat(bodyType);
				ySave = yLoc-storyBox._height
				storyBox._y = ySave+50
				OADraw.OLine(this, -325, +50, -325, ySave+50, "0xFFFFFF", .25)
				
			}


	
				
			

}