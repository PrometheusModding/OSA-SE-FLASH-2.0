
class TwSlide_A extends MovieClip
{

public var dat
var o
var Speed = 0.3

var base
var icon
var border
var textBox

var typeText
var nameText

			public function TwSlide_A(){
				base = this.attachMovie(dat.base, base, this.getNextHighestDepth());
				icon = this.attachMovie(dat.icon, icon, this.getNextHighestDepth());
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
			
			public function dim(){
			this.textBox.removeMovieClip()
			}
			
			public function light(){
			textBox = this.attachMovie("TwSlide_A_Tx", textBox, this.getNextHighestDepth(),{_x:-35});
			textBox.text1.htmlText = dat.text1
			textBox.text1.setTextFormat(typeText);
			textBox.text2.htmlText = dat.text2
			textBox.text2.setTextFormat(nameText);
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