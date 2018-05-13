
class core.ui.help.multiInfoPoper extends MovieClip
{
	

public var o

var title
var desc

var fontTitle
var fontDesc

var lines
var ico
			public function multiInfoPoper(){
				o = _parent.o
				
				lines=[]
				ico=[]
				fontTitle = new TextFormat();
				fontTitle.letterSpacing = 1.2
				fontTitle.font = o.fonts.m
				fontTitle.size = 18
				
				fontDesc = new TextFormat();
				fontDesc.letterSpacing = 1.2
				fontDesc.font = o.fonts.m
				fontDesc.size = 8
			}
			
			function build(){
				lines[0] = this.attachMovie("genericText", "line0", this.getNextHighestDepth(), {_x:176, _y:0})
				lines[0].val.htmlText = o.cfg.lang.yesToPrintLog.toUpperCase() 
				lines[0].val.setTextFormat(fontDesc);
				lines[0].val.autoSize = "left";
				ico[0] = this.attachMovie("omu_btyes", "ico0", this.getNextHighestDepth(), {_xscale:50, _yscale:50})
				core.util.draw.circle(ico[0].createEmptyMovieClip("circ", ico[0].getNextHighestDepth()), 0, 0, 30, 2, "0xFFFFFF",undefined)	
				
			}
			
			function vanish(){
				this._visible = false
			}
			
			function reveal(){
				this._visible = true
			}

			
			
	


}