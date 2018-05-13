

class core.util.specialPanel {

	
	public static function keybinder(o) {
		o.hud.specialPanel = o.hud.attachMovie("keybindNotice", "KeyBindSplash", 500001, {_x:Stage.width/2, _y:Stage.height/2})
		var keybindType = o.hud.specialPanel.attachMovie("fontboxCentra", "KeyBindType", o.hud.specialPanel.getNextHighestDepth())
		var _font = new TextFormat();
		_font.letterSpacing = 1.2
		_font.font = o.fonts.m
		_font.size = 18	
		
		keybindType.val.htmlText = o.cfg.lang.pressAKeyToBind.toUpperCase()
		keybindType.val.setTextFormat(_font);
		keybindType.val.autoSize = "center";
	}
	
	public static function textInput(o) {
		o.hud.specialPanel = o.hud.attachMovie("textInput", "KeyBindSplash", 500010, {_x:Stage.width/2, _y:Stage.height/2})
		var _font = new TextFormat();
		_font.letterSpacing = 1.2
		_font.font = o.fonts.m
		_font.size = 18	
		
		o.hud.specialPanel.val.htmlText = "FUCK YOU"
		o.hud.specialPanel.val.setTextFormat(_font);
		o.hud.specialPanel.val.autoSize = "center";
		Selection.setFocus(o.hud.specialPanel.val)
	
		o.hud.specialPanel.onKeyDown = function() {
    		trace("Pressed Enter");
   			 if (Key.isDown(Key.ENTER)) {
            trace("You Pressed Enter");
    		 }
		}

	}
	
	
		public static function saveChanges(o) {
		o.hud.specialPanel = o.hud.attachMovie("gfxOSA", "osagraphic", 500020, {_x:Stage.width/2, _y:(Stage.height/2)-100})
		var warning = o.hud.specialPanel.attachMovie("fontboxCentra", "KeyBindType", o.hud.specialPanel.getNextHighestDepth(), {_y:55})
		var _font = new TextFormat();
		_font.letterSpacing = 1.2
		_font.font = o.fonts.m
		_font.size = 16	
		
		warning.val.htmlText = o.cfg.lang.unsavedChanges.toUpperCase()
		warning.val.setTextFormat(_font);
		warning.val.autoSize = "center";
		
		var exp = o.hud.specialPanel.attachMovie("fontboxCentra", "KeyBindType", o.hud.specialPanel.getNextHighestDepth(), {_y:80})
		_font = new TextFormat();
		_font.letterSpacing = 1.1
		_font.font = o.fonts.l
		_font.size = 10
		
		exp.val.htmlText = o.cfg.lang.unsavedChangesEx
		exp.val.setTextFormat(_font);
		exp.val.autoSize = "center";
		
		
		_font = new TextFormat();
		_font.letterSpacing = 1.0
		_font.font = o.fonts.m
		_font.size = 12
		
		var ybt = o.hud.specialPanel.attachMovie("obt_y", "KeyBindType", o.hud.specialPanel.getNextHighestDepth(), {_y:115, _x:-100, _xscale:50, _yscale:50})
			var ytxt = o.hud.specialPanel.attachMovie("fontbox", "ytxt", o.hud.specialPanel.getNextHighestDepth(), {_y:115, _x:330})
			ytxt.val.htmlText = o.cfg.lang.unsavedChangesY
			ytxt.val.setTextFormat(_font);
			ytxt.val.autoSize = "left";
		var tbt = o.hud.specialPanel.attachMovie("obt_t", "KeyBindType", o.hud.specialPanel.getNextHighestDepth(), {_y:149, _x:-100, _xscale:50, _yscale:50})
			var ttxt = o.hud.specialPanel.attachMovie("fontbox", "ttxt", o.hud.specialPanel.getNextHighestDepth(), {_y:149, _x:330})
			ttxt.val.htmlText = o.cfg.lang.unsavedChangesT
			ttxt.val.setTextFormat(_font);
			ttxt.val.autoSize = "left";
		var nbt = o.hud.specialPanel.attachMovie("obt_n", "KeyBindType", o.hud.specialPanel.getNextHighestDepth(), {_y:183, _x:-100, _xscale:50, _yscale:50})
			var ntxt = o.hud.specialPanel.attachMovie("fontbox", "ntxt", o.hud.specialPanel.getNextHighestDepth(), {_y:183, _x:330})
			ntxt.val.htmlText = o.cfg.lang.unsavedChangesN
			ntxt.val.setTextFormat(_font);
			ntxt.val.autoSize = "left";
	}
	
	public static function onotice(o, txt, fromIni, cap, delay) {
		if(o.hud.onotice){
			o.hud.onotice.removeMovieClip()
		}
		
		var textOutput
		if(fromIni){
			txt = o.cfg.lang[txt]
		}
		
		if(cap){
			txt = txt.toUpperCase()
		}
		
		o.hud.onotice = o.hud.attachMovie("gfxOSA", "osagraphic", 589900, {_x:100, _y:100, _xscale:30, _yscale:30})
		var warning = o.hud.onotice.attachMovie("fontbox", "KeyBindType", o.hud.onotice.getNextHighestDepth(), {_x:710, _y:60, _xscale:200, _yscale:200})
		
		var _font = new TextFormat();
		_font.letterSpacing = 1.2
		_font.font = o.fonts.m
		_font.size = 16
		
		warning.val.htmlText = txt
		warning.val.setTextFormat(_font);
		warning.val.autoSize = "left";
		
		o.hud.onoticeIx = o.hud.onoticeIx+1
		var timeStorage = []
		timeStorage[0] = o.hud.onoticeIx
		
		var timer = 6000
		if(delay){
			timer = delay*1000
		}
		var time = new OTime({fn:o.hud.clearONotice, scope:o.hud}, timer, timeStorage)
	}
		
		
}