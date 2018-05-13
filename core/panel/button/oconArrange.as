

class core.panel.button.oconArrange extends MovieClip {

public var o
public var dia

public var dataO
public var posO
public var btGlobal

var actra
var ix
var base
var filled
var icon
var sele
var entryName

var shell

	function oconArrange(){
		buildButton()		
	}	
	
	
	function buildButton(){
		ix = dataO.ix
		actra = dia.actra[ix]
		
		shell.removeMovieClip() 
		shell = this.createEmptyMovieClip("buttonShell", this.getNextHighestDepth()) 
		var _font = new TextFormat();
		_font.letterSpacing = 1.0
		_font.font = o.fonts.l
		_font.size = 14	
		
		
		if(ix < dia.module.role.length){
			icon = shell.attachMovie(dia.module.role[ix].gfx[0].itarg, "icon", shell.getNextHighestDepth(), {_xscale:btGlobal.xs, _yscale:btGlobal.xs})
			dataO.tx.desc = o.lib.translate(dia.module.role[ix].name, dia.module.id, "")			
			
			base = core.util.draw.circle(shell.createEmptyMovieClip("baseDraw", shell.getNextHighestDepth()), 0, 0, posO.btWidth, btGlobal.lineThickness, "0x"+dia.module.role[ix].gfx[0].color, btGlobal.fillColor)
			filled = core.util.draw.circle(shell.createEmptyMovieClip("fillDraw", shell.getNextHighestDepth()), 0, 0, posO.btWidth, btGlobal.lineThickness*2.5, "0x"+dia.module.role[ix].gfx[0].color, btGlobal.fillColor)
		
		}else{
			var visitor 
			for (var i=0; i < dia.scene.visitor.length; i++){				
				if(dia.scene.visitor[i].a==ix){
					visitor = dia.module.visitor[dia.scene.visitor[i].ix]
				}
			}
			
			
			
			icon = shell.attachMovie(visitor.gfx[0].itarg, "icon", shell.getNextHighestDepth(), {_xscale:btGlobal.xs, _yscale:btGlobal.xs})
			dataO.tx.desc = o.lib.translate(visitor.name, dia.module.id, "")	
			
			
			base = core.util.draw.circle(shell.createEmptyMovieClip("baseDraw", shell.getNextHighestDepth()), 0, 0, posO.btWidth, btGlobal.lineThickness, "0x"+visitor.gfx[0].color, btGlobal.fillColor)
			filled = core.util.draw.circle(shell.createEmptyMovieClip("fillDraw", shell.getNextHighestDepth()), 0, 0, posO.btWidth, btGlobal.lineThickness*2.5, "0x"+visitor.gfx[0].color, btGlobal.fillColor)
		
		}
		
			filled._visible = false
			entryName = shell.attachMovie("fontbox", "option", shell.getNextHighestDepth(), {_x:btGlobal.toff})	
		
			entryName.val.htmlText = actra.name
			entryName.val.setTextFormat(_font);
			entryName.val.autoSize = "right";			
	}
	
	
	function update(){
		buildButton()
	}
	function select(){
		filled._visible=!filled._visible
	}
	
	function light(){
		sele = shell.attachMovie("mh_bigdot", "option", shell.getNextHighestDepth(), {_xscale:btGlobal.hxs, _yscale:btGlobal.hxs})
		core.panel.util.fx.ilight(this)
		
		
		var haloTrans = new flash.geom.Transform(sele.gx);
		var haloHue = new flash.geom.ColorTransform
		haloHue.rgb = o.cfg.config.themeColorHex
		haloTrans.colorTransform = haloHue
	}
	
	function dim(){
		core.panel.util.fx.idim(this)
		sele.removeMovieClip()
	}

}