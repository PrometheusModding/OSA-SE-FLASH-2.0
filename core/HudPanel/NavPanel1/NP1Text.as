class NP1Text extends MovieClip
{
public var o
public var m
public var dia
public var position

var DescText
var ActraText

var fontDesc
var fontActra

			public function NP1Text(){
				var pos = {H:position.H-4, V:position.V-40}
				
				fontDesc = new TextFormat();
				fontDesc.letterSpacing = .8
				fontDesc.font = o.fonts.m
				fontDesc.size = 15
				
				fontActra = new TextFormat();
				fontActra.letterSpacing = .8
				fontActra.font = o.fonts.m
				fontActra.size = 25
				
				ActraText = this.attachMovie("NP1Text_Actra", "ActraTx", this.getNextHighestDepth(), {_x:pos.H, _y:pos.V}).NP1TextBox_Actra;
				pos.V -= 20
				DescText = this.attachMovie("NP1Text_Desc", "DescTx", this.getNextHighestDepth(), {_x:pos.H, _y:pos.V}).NP1TextBox_Desc;;
				m.ctr.updateActraText()
			}
			
			
			
			public function updateDescTx(NewText){				
				DescText.htmlText = NewText
				DescText.setTextFormat(fontDesc);
				DescText.autoSize = "left";
				
				
			}
			
			public function updateActraTx(NewText){				
				ActraText.htmlText = NewText
				ActraText.setTextFormat(fontActra);
				ActraText.autoSize = "left";
			}

}