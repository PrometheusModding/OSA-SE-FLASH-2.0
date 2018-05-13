

class core.dias.moduleModify{

var o
var dia

		public function moduleModify(core, diasa){
		o = core
		dia = diasa
		
			for (var i=0; i < dia.module.modify.length; i++){
				this[dia.module.modify[i].cmd](dia.module.modify[i])
			}
			

			if(dia.scene.visitor){
				for (var i=0; i < dia.scene.visitor.length; i++){
					for (var j=0; j < dia.module.visitor[dia.scene.visitor[i].ix].modify.length; j++){
						this[dia.module.visitor[dia.scene.visitor[i].ix].modify[j].cmd+"Visitor"](dia.module.visitor[dia.scene.visitor[i].ix].modify[j], dia.scene.visitor[i])
					}
				}
			}
			
		}
	
	
		
		public function bodyScale(modifyUnit){
			dia.actra[modifyUnit.actor].body.setBodyScale(modifyUnit["bodyscale"+dia.actra[modifyUnit.actor].gender])			
		}
		
		public function bodyScaleVisitor(modifyUnit, visitor){
			dia.actra[visitor.a].body.setBodyScale(modifyUnit["bodyscale"+dia.actra[visitor.a].gender])			
		}

		public function ogentleman(modifyUnit){
			dia.actra[modifyUnit.actor].body.scale.snapOCock(modifyUnit["shaft"+dia.actra[modifyUnit.actor].gender], modifyUnit["scrotum"+dia.actra[modifyUnit.actor].gender])			
		}
		
		public function ogentlemanVisitor(modifyUnit, visitor){
			dia.actra[visitor.a].body.scale.snapOCock(modifyUnit["shaft"+dia.actra[visitor.a].gender], modifyUnit["scrotum"+dia.actra[visitor.a].gender])			
		}

		
		
		

		

		
		
		
		
}