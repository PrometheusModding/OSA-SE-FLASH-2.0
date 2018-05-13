

class core.panel.nav.np2.rep._textlist extends MovieClip {

public var o
public var m
public var f
public var x
var u

var outV
var empty

var bullet
var bulletStyle
var descBox
var selectLine
var dest
var desc
var dat

	function _textlist(){
			
			
	}
	
	function build(){
		
			
			_x += 10
			
				var _fontDesc
				_fontDesc = new TextFormat();
				_fontDesc.letterSpacing = .8
				_fontDesc.font = o.fonts.m
				_fontDesc.color = "0x"+"FFFFFF"
				_fontDesc.size = 12		
				
			bulletStyle="star"

			
				if(bulletStyle=="star"){
				bullet = core.util.draw.star(this, "0xFFFFFF", 7)
				bullet._y += 4 
				
				descTw = {moveX:undefined, moveY:undefined, scalerX:undefined, scalerY:undefined}
					bulletTw = {rot:undefined, moveY:undefined}
					
					
				}else if(bulletStyle=="bar"){
				bullet = core.util.draw.bar(this, "0x19c4bd", 10)
				bullet._y -=5
				
				descTw = {moveX:undefined, moveY:undefined, scalerX:undefined, scalerY:undefined}
				bulletTw = {rot:undefined, moveY:undefined}
				
				}
			
			
			
			var descBoxParent = this.attachMovie("textboxl", "optDesc", this.getNextHighestDepth())
			descBox = descBoxParent.val
				descBox.htmlText = desc
				descBox.setTextFormat(_fontDesc);
				descBox.autoSize = "left";
				
				
				
			bullet._visible = false
			
	}		
	
	
			function light(moveDirection){
				this["fxLight_"+bulletStyle](moveDirection)
				f.updateDesc(desc)
			}
	
	
var descTw
var bulletTw
			function fxLight_star(moveDirection){
				bullet._visible = true
				
				
				
				bulletTw.rot.stop()
				bulletTw.moveY.stop()
				
				if(moveDirection=="U"){
				bulletTw.rot = new mx.transitions.Tween(bullet, "_rotation", mx.transitions.easing.None.easeNone, 0, 145, .25, true);
				bulletTw.moveY = new mx.transitions.Tween(bullet, "_y", mx.transitions.easing.Strong.easeOut, bullet._y+30, bullet._y, .25, true);				
				}
				else if(moveDirection=="D"){
				bulletTw.rot = new mx.transitions.Tween(bullet, "_rotation", mx.transitions.easing.None.easeNone, 0, -145, .25, true);
				bulletTw.moveY = new mx.transitions.Tween(bullet, "_y", mx.transitions.easing.Strong.easeOut, bullet._y-30, bullet._y, .25, true);		
				}
				
				descTw.moveX.stop()
				descTw.moveY.stop()
				//descTw.scalerX.stop()
				//descTw.scalerY.stop()
				
				descTw.moveX = new mx.transitions.Tween(descBox, "_x", mx.transitions.easing.Strong.easeOut, 0, 15, .45, true);
				//descTw.moveY = new mx.transitions.Tween(descBox, "_y", mx.transitions.easing.Strong.easeOut, 0, -3.5, .45, true);
				//descTw.scalerX  = new mx.transitions.Tween(descBox, "_xscale", mx.transitions.easing.Strong.easeOut, 100, 135, .45, true);
				//descTw.scalerY = new mx.transitions.Tween(descBox, "_yscale", mx.transitions.easing.Strong.easeOut, 100, 135, .45, true);
			}
			
			function fxLight_bar(moveDirection){
				bullet._visible = true
				
				
				bulletTw.rot.stop()
				bulletTw.moveY.stop()
				
				if(moveDirection=="U"){
				bulletTw.moveY = new mx.transitions.Tween(bullet, "_y", mx.transitions.easing.Strong.easeOut, bullet._y+30, bullet._y, .25, true);				
				}
				else if(moveDirection=="D"){
				bulletTw.moveY = new mx.transitions.Tween(bullet, "_y", mx.transitions.easing.Strong.easeOut, bullet._y-30, bullet._y, .25, true);		
				}

			}
			
			function dim(){
				this["fxDim_"+bulletStyle]()			
			}
			
			function fxDim_star(){
				bullet._visible = false
				descTw.moveX.stop()
				//descTw.moveY.stop()
				//descTw.scalerX.stop()
				//descTw.scalerY.stop()
				descTw.moveX = new mx.transitions.Tween(descBox, "_x", mx.transitions.easing.Strong.easeOut, 15, 0, .25, true);
				//descTw.moveY = new mx.transitions.Tween(descBox, "_y", mx.transitions.easing.Strong.easeOut, -3.5, 0, .25, true);
				//descTw.scalerX = new mx.transitions.Tween(descBox, "_xscale", mx.transitions.easing.Strong.easeOut, 135, 100, .25, true);
				//descTw.scalerY = new mx.transitions.Tween(descBox, "_yscale", mx.transitions.easing.Strong.easeOut, 100, 100, .25, true);
			}
			
			function fxDim_bar(){
				bullet._visible = false
				
			}
			
			
			


}