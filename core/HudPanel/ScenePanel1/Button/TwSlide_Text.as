
class TwSlide_Text extends MovieClip
{

public var dat
public var o

var Speed = 0.3

var txt

var traceBox
 
			public function TwSlide_Text(){
				trace(dat.out)
			
			
			trace("THIS IS O ------------------------------------- "+o.cfg.lang.warp)
			var menuFont = new TextFormat();
			menuFont.letterSpacing = 1.2
			menuFont.font = o.fonts.m
			menuFont.size = 9
			txt.autoSize = "center";
			txt.htmlText = dat.txt
			txt.setTextFormat(menuFont);
			
			Rect(txt._height, txt._width)
			traceBox._alpha = 0
			
			}
		
			public function Rect(T, W){
			traceBox = this.createEmptyMovieClip("Sele", 10);		
			with (traceBox) {
			var P = 5
			T += P
			W += P
			var W2 = (W/2)
			var T2 = (T/2)
			//beginFill(0x99FF00, 100);
			lineStyle(1, 0xffffff, 100, true, "none", "round", "miter", .5);  
			moveTo(W2, T2);
			lineTo(-W2, T2);
			lineTo(-W2, -T+T2);
			lineTo(W2, -T+T2);
			lineTo(W2, T2);
			endFill();
			}
		
		
			}
			
			public function End(){
				this.removeMovieClip()
			}
			
			public function dim(){
			traceBox._alpha = 0
			}
			
			public function light(){
			traceBox._alpha = 100
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