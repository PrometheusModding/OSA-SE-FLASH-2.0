import skse;

class core.actor.temp
{
	
var o
var actra
var stat


		function temp(ocore, act){
		o = ocore
		actra = act
		
		stat = new Object
		stat.clothing = new Object
		}
		
		function sourceOFX(fxu){
		stat[fxu.block][fxu.vari] = new Object
		stat[fxu.block][fxu.vari] = fxu.valu
		}
		

}


