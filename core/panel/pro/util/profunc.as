

class core.panel.pro.util.profunc
{


			public static function createStatPair(o, panel, stat){

						if(stat.cmd){
						   core.panel.pro.util.profunc["_statpair"+stat.cmd](o, panel, stat)
						}else{
						var Y = panel.getVPin()
						var X = panel.HPoint
						var v = panel.attachMovie("type2RListVal", "val", panel.getNextHighestDepth(), {_y:Y, _x:X})						
						var t = panel.attachMovie("type2RListName", "title", panel.getNextHighestDepth(), {_y:Y, _x:X-120})
						t.val.htmlText = stat.t
						t.val.setTextFormat(panel._fonts.t)
						
						v.val.htmlText = core.panel.pro.util.profunc.proscan(o, panel.actra, stat.v)
						v.val.setTextFormat(panel._fonts.v)	
						}
			}
			
			public static function globalref(prop, v){
				if(v){return v}
				else{return "$"+prop}
			}

			
			public static function proscan(o, actra, v){
				var ix
				var iix
	
				var st
				var en
				while (v.indexOf("{{") != -1) {						
						st = v.indexOf("{{")
						en = v.indexOf("}}")						
						ix = v.substr(st, en+2-st)
						v = v.split(ix).join(core.panel.pro.util.procmd.command(o, actra, ix.substr(2, ix.length-4)))
				}

				
				while (v.indexOf("{") != -1) {						
						st = v.indexOf("{")
						en = v.indexOf("}")						
						ix = v.substr(st, en+1-st)
						v = v.split(ix).join(actra.profile.profileData.properties[0][ix.substr(1, ix.length-2)][0].v)
				}
				
				return v
			}
			
			public static function protext(o, actra, v){
				if (v.indexOf("$NL$") != -1) {
							v = v.split("$NL$").join("\n")
				}				
				return v
			}

			public static function probrass(o, actra, brass, obj, Y){
				if(brass){					
					if(brass.ix){
						var brassPanel = obj.attachMovie("probrass"+actra.profile.profileData.brass[brass.ix].type, "brass", obj.getNextHighestDepth(), {o:o, actra:actra, _y:Y})
						brassPanel.fromBlock(actra.profile.profileData.brass[brass.ix])
						}
				}
			}
			
			
			
			public static function _statpairheader(o, panel, stat){
				if(panel.VPinMax-panel.VPinCount < 2){
				panel.HPoint-=panel.HPinPush
				panel.VPinCount = 0				
				}
				
				var header = panel.attachMovie("type2RListHead", "header", panel.getNextHighestDepth(), {_y:panel.getVPin(), _x:panel.HPoint-120});
				
				header.val.autoSize = "left";
				
				var liner = header.createEmptyMovieClip("line", panel.getNextHighestDepth()); 
				
				header.val.htmlText = stat.t 
				header.val.setTextFormat(panel._fonts.h);
				liner.lineStyle(1, 0xcccccc, 100, true, "none", "round", "miter", 0.25);
				liner.moveTo(0, 7);
				liner.lineTo(75, 7);
			}
			
			
			
			
			
}