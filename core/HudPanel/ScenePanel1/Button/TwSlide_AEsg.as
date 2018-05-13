
class TwSlide_AEsg extends MovieClip
{

public var dat

var o
var dia
var inject

var Speed = 0.3

var base
var icon
var border
var textBox
var item

var worn

var esgType
var typeText
var nameText
			public function TwSlide_AEsg(){
				item = []
				if(dat.esgList != "weapon"){
				esgType = dat.actra.equip.attire.esg.list[dat.esgList]
				}else{
				esgType = "weapon"	
				}
				base = this.attachMovie("aesg_classic_b", base, this.getNextHighestDepth());
				icon = this.attachMovie("aesg_classic_"+esgType, icon, this.getNextHighestDepth());
				worn = this.attachMovie(dat.icon, worn, this.getNextHighestDepth());
				if(dat.border){border = this.attachMovie(dat.border, border, this.getNextHighestDepth())}
				
				typeText = new TextFormat();
				typeText.letterSpacing = .7
				typeText.font = o.fonts.m
				typeText.size = 7
				
				nameText = new TextFormat();
				nameText.letterSpacing = .7
				nameText.font = o.fonts.l
				nameText.size = 5
			}
			
			public function End(){
				this.removeMovieClip()
			}
			
			function decideEsg(){
				var isWorn = false
				for (var i=0; i < dat.actra.equip.attire.esg.item[dat.esgList].length; i++){
					
					if(dat.actra.equip.attire.esg.item[dat.esgList][i].worn){isWorn = true}
				}
				
					if(isWorn == true){
					worn._alpha = 0
					return "undressEsg"}
					else{
					worn._alpha = 100
					return "dressEsg"
					}
				
			}
			
			function decideWep(){
				var isWorn = false
				for (var i=0; i < dat.actra.equip.armament.hand.length; i++){
					
					if(dat.actra.equip.armament.hand[i].worn){isWorn = true}
				}
					if(isWorn == true){
					worn._alpha = 0
					return "undressEsg"}
					else{
					worn._alpha = 100
					return "dressEsg"
					
					}
				}
			
			
			public function dim(){
			this.textBox.removeMovieClip()
			}
			
			public function light(){
			textBox = this.attachMovie("TwSlide_A_Tx", textBox, this.getNextHighestDepth(),{_x:-35});
			textBox.text1.htmlText = dat.actra.equip.getEsgName(esgType)
			textBox.text1.setTextFormat(typeText);
				if(esgType !="weapon"){
					for (var i=0; i < dat.actra.equip.attire.esg.item[dat.esgList].length; i++){
					item[i] = textBox.attachMovie("TwSlide_AEsg_Tx", item[i], textBox.getNextHighestDepth(),{_y:6+(i*10)});
					item[i].txt.htmlText = dat.actra.equip.attire.esg.item[dat.esgList][i].name+" | "+(dat.actra.equip.attire.esg.item[dat.esgList][i].slot+30)
					item[i].txt.setTextFormat(nameText);
					}
				}else{
					for (var i=0; i < dat.actra.equip.armament.hand.length; i++){
					item[i] = textBox.attachMovie("TwSlide_AEsg_Tx", item[i], textBox.getNextHighestDepth(),{_y:6+(i*10)});
					
					if(i==0){item[i].txt.htmlText = dat.actra.equip.armament.hand[i].name+" | RH"}
					else if(i==1){item[i].txt.htmlText = dat.actra.equip.armament.hand[i].name+" | LH"}
					item[i].txt.setTextFormat(nameText);
					}
				}
				

			}
			
			public function TwMoV(St, En){
			var ballTween = new mx.transitions.Tween(this, "_y", mx.transitions.easing.Strong.easeOut, St, En, Speed, true);
			}
			
			public function TwScl(St, En){
			var ballTween = new mx.transitions.Tween(this, "_xscale", mx.transitions.easing.Strong.easeOut, St, En, Speed, true);
			var ballTween = new mx.transitions.Tween(this, "_yscale", mx.transitions.easing.Strong.easeOut, St, En, Speed, true);
			}
			
			public function TwOut(St, En){
			var ballTween = new mx.transitions.Tween(this, "_alpha", mx.transitions.easing.Strong.easeOut, 100, 0, Speed, true);
			}
			
			
			public function TwAlpha(St, En){
			var ballTween = new mx.transitions.Tween(this, "_alpha", mx.transitions.easing.Strong.easeOut, St, En, Speed, true);
			}
			
			public function TwTar(Tar, Prop, St, En){
			var ballTween = new mx.transitions.Tween(Tar, Prop, mx.transitions.easing.Strong.easeOut, St, En, Speed, true);
			}
				
			public function TwIn(St, En){
			var ballTween = new mx.transitions.Tween(this, "_alpha", mx.transitions.easing.Strong.easeOut, 0, 100, Speed, true);
			}
	
	


}