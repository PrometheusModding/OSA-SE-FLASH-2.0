
class core.ui.help.togto extends MovieClip
{
	

public var o

var title
var desc

var fontTitle
var fontDesc

			public function togto(){
				o = _parent.o
				fontTitle = new TextFormat();
				fontTitle.letterSpacing = 1.2
				fontTitle.font = o.fonts.m
				fontTitle.size = 18
				
				fontDesc = new TextFormat();
				fontDesc.letterSpacing = 1.2
				fontDesc.font = o.fonts.m
				fontDesc.size = 8
			}
			
			function setDesc(newDesc){
				desc.htmlText = newDesc
				desc.setTextFormat(fontDesc);
			}
			
			function setTitle(newTitle){
				title.htmlText = newTitle
				title.setTextFormat(fontTitle);
			}
			
			
	


}