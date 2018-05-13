
class core.dias.util.choreCMD
{


		
		public static function commandType(o, d, command){

					core.dias.util.choreCMD.processSplit(o, d, command)
		}
		
		public static function process(o, d, command){
			core.dias.util.choreCMD[command](o, d, command)			
		}
		
		public static function processSplit(o, d, command){
			var cmdArr:Array = command.split(",")
			core.dias.util.choreCMD[cmdArr[0].toLowerCase()](o, d, cmdArr)			
		}

				
		//$speed, RoleNumber, Amount, 			
		public static function $speed(o, d, cmdArr){
			d.scena.speedAdjust(cmdArr[2], cmdArr[1])
			d.chore.commandComplete()
		}
		
		public static function $wait(o, d, cmdArr){
			if(!d.waiting){
			d.waiting = true
			d.waitTime = Number(cmdArr[1])
			if(d.scena.scenePause){d.scena.unpause()}
			}
		}
		
		public static function $go(o, d, cmdArr){
			var arr = []
			arr[0] = o
			arr[1] = d
			arr[2] = cmdArr
			var _time = new OTime({fn:core.dias.util.choreCMD.$goBreak, scope:d}, 10, arr)			
		}
		
		public static function $goBreak(o, d, cmdArr){
			d.chore.autoNav.newAgenda(cmdArr[1], true)
		}
		
		public static function $warp(o, d, cmdArr){			
		
			var arr = []
			arr[0] = o
			arr[1] = d
			arr[2] = cmdArr
			var _time = new OTime({fn:core.dias.util.choreCMD.$warpBreak, scope:d}, 10, arr)
		}
		//$endscene, AllowAutoPostScene, CustomPostScene)
		
		public static function $warpBreak(o, d, cmdArr){
			
			d.chore.autoNav.newAgenda(cmdArr[1], true, true)
			
		}
		
		public static function $endscene(o, d, cmdArr){
			d.chore.commandComplete()
			d.endCommand()
		}
		
		public static function $modevent(o, d, cmdArr){
			o.sky(cmdArr[1])
			d.chore.commandComplete()
		}
		
		
		public static function $equndressall(o, d, cmdArr){
			d.actra[cmdArr[1]].equip.attire.undress()
			d.chore.commandComplete()			
		}
		
		public static function $eqredressall(o, d, cmdArr){
			d.actra[cmdArr[1]].equip.attire.redress()
			d.chore.commandComplete()			
		}
		

}	


