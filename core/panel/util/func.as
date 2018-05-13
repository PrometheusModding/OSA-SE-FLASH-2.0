

class core.panel.util.func {

			
			public static function reparse(obj, cur, menu){
			var newPoint = menu[cur].buildO.point
			menu[cur].removeMovieClip()
			menu[cur] = obj.createEmptyMovieClip("am", obj.getNextHighestDepth(), {posO:undefined, buildO:undefined, brass:undefined, dataO:undefined}); 
			obj.buildMenu(cur, menu[cur])
			menu[cur].buildO.jumpPoint(newPoint)
			obj.processShift()
			}
			
			public static function newActra(obj){
				obj.actraMenu[obj.cur]._visible = false			
				var point = obj.actraMenu[obj.cur].buildO.point
				obj.cur = obj.m.tabActra
				obj.actraMenu[obj.cur].buildO.jumpPoint(point)
				obj.actraMenu[obj.cur]._visible = true			
				obj.helpText.setTitle((obj.m.actra.name).toUpperCase())
				obj.processShift()
			}
			
			public static function brass(o, actra, obj, Y){
				if(actra.profile.has){
					if(actra.profile.profileData.brass[0]){
					obj.attachMovie("probrass"+actra.profile.profileData.brass[0], "brass", obj.getNextHighestDepth(), {o:o, actra:actra, _y:Y}).fromBlock(actra.profile.profileData.brass[0])
					}else{
					obj.attachMovie("probrass"+o.cfg.xconfig.template[0].profile[0].brass[0].type, "brass", obj.getNextHighestDepth(), {o:o, actra:actra, _y:Y}).fromBlock(o.cfg.xconfig.template[0].profile[0].brass[0])
					}
				}else{
				obj.attachMovie("probrassbasic", "brass", obj.getNextHighestDepth(), {o:o, actra:actra, _y:Y}).fromPanel(actra.name)
				}
			}

		
}