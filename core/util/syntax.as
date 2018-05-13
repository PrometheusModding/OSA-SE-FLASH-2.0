class core.util.syntax
{

			//vestigeNP1
			static function SynDesc(o, tx, descBlock, mLang, actra){
				
				if (tx.indexOf("$") != -1) {
						for (var i=0; i < actra.length; i++) {
							tx = tx.split("$W"+i).join(core.util.syntax.SynDesc_Who(o, mLang, actra[i].gender));
							tx = tx.split("$P"+i).join(core.util.syntax.SynDesc_Possessive(o, mLang, actra[i].gender));
							tx = tx.split("$F"+i).join(core.util.syntax.SynDesc_ProNoun(o, mLang, actra[i].gender));
							tx = tx.split("$N"+i).join(actra[i].name);
						}
				}
				if (tx.indexOf("$$") != -1) {
						for (var i=0; i < actra.length; i++) {
							tx = tx.split("$$A"+i).join(core.util.syntax.SynDesc_Extra(o, mLang, actra[i].gender, "a"));
							tx = tx.split("$$B"+i).join(core.util.syntax.SynDesc_Extra(o, mLang, actra[i].gender, "b"));
							tx = tx.split("$$C"+i).join(core.util.syntax.SynDesc_Extra(o, mLang, actra[i].gender, "c"));
							tx = tx.split("$$D"+i).join(core.util.syntax.SynDesc_Extra(o, mLang, actra[i].gender, "d"));
						}
				}
				if (tx.indexOf("^") != -1) {
					for (var i=0; i < actra.length; i++) {
						tx = tx.split("^ESG"+i).join(core.util.syntax.SynDesc_ESG(o, descBlock["desg"+i], actra[descBlock["dtar"+i]].gender));
						tx = tx.split("^W"+i).join(core.util.syntax.SynDesc_Who(o, mLang, actra[descBlock["dtar"+i]].gender));
						tx = tx.split("^P"+i).join(core.util.syntax.SynDesc_Possessive(o, mLang, actra[descBlock["dtar"+i]].gender));
						tx = tx.split("^F"+i).join(core.util.syntax.SynDesc_ProNoun(o, mLang, actra[descBlock["dtar"+i]].gender));
						tx = tx.split("^N"+i).join(actra[descBlock["dtar"+i]].name);
					}
				}
				if (tx.indexOf("^^") != -1) {
					for (var i=0; i < actra.length; i++) {
						tx = tx.split("^^A"+i).join(core.util.syntax.SynDesc_Extra(o, mLang, actra[descBlock["dtar"+i]].gender, "a"));
						tx = tx.split("^^B"+i).join(core.util.syntax.SynDesc_Extra(o, mLang, actra[descBlock["dtar"+i]].gender, "b"));
						tx = tx.split("^^C"+i).join(core.util.syntax.SynDesc_Extra(o, mLang, actra[descBlock["dtar"+i]].gender, "c"));
						tx = tx.split("^^D"+i).join(core.util.syntax.SynDesc_Extra(o, mLang, actra[descBlock["dtar"+i]].gender, "d"));
					}
				}
				
				
				var ix
				while(tx.indexOf("@@")!=-1&&tx.indexOf("@@")!=undefined){
					//if(tx.indexOf("@@")!=-1&&tx.indexOf("@@")!=undefined){
					ix = tx.indexOf("@@")
							
							if(tx.substr(ix+2,4)=="CAPC"){
							//$CMDCAPC1
							var textLine = tx.substr(ix+7, Number(tx.substr(ix+6,1)))
							
						  
							var insert = textLine.toUpperCase()
							tx = tx.split(tx.substr(ix, 7+Number(tx.substr(ix+6,1)))).join(insert)
														
							
							}else if(tx.substr(ix+2,4)=="CAPT"){
							//$CMDCAPT
							//For Capping titles where a 's for possesive would be ignored by the capitalization
							var closeIndex = tx.indexOf("@@!CAPT", ix)
							var textLine = tx.substr(ix+6, closeIndex-(ix+6))
							
							var insert = textLine.toUpperCase()
							tx = tx.split(tx.substr(ix, (closeIndex+7)-ix)).join(insert)
							
							}else if(tx.substr(ix+2,3)=="RGB"){
							//CMD  @@RGB0444444
							//For Capping titles where a 's for possesive would be ignored by the capitalization
							var color = "#"+tx.substr(ix+5, 6)
							
							
							var insert = textLine.toUpperCase()
							var closeIndex = tx.indexOf("@@!RGB")
							
							tx = tx.split(tx.substr(ix, (closeIndex+6)-ix)).join("<font color='"+color+"'>"+tx.substr(ix+11,closeIndex-(ix+11))+"</font>") 							
							}
					
				}
				
			return tx;
			}
			
			
			static function syntaxDesc(o, tx, descBlock, mLang, actra){
				
				if (tx.indexOf("$") != -1) {
						for (var i=0; i < actra.length; i++) {
							tx = tx.split("$W"+i).join(core.util.syntax.SynDesc_Who(o, mLang, actra[i].gender));
							tx = tx.split("$P"+i).join(core.util.syntax.SynDesc_Possessive(o, mLang, actra[i].gender));
							tx = tx.split("$F"+i).join(core.util.syntax.SynDesc_ProNoun(o, mLang, actra[i].gender));
							tx = tx.split("$N"+i).join(actra[i].name);
						}
				}
				if (tx.indexOf("$$") != -1) {
						for (var i=0; i < actra.length; i++) {
							tx = tx.split("$$A"+i).join(core.util.syntax.SynDesc_Extra(o, mLang, actra[i].gender, "a"));
							tx = tx.split("$$B"+i).join(core.util.syntax.SynDesc_Extra(o, mLang, actra[i].gender, "b"));
							tx = tx.split("$$C"+i).join(core.util.syntax.SynDesc_Extra(o, mLang, actra[i].gender, "c"));
							tx = tx.split("$$D"+i).join(core.util.syntax.SynDesc_Extra(o, mLang, actra[i].gender, "d"));
						}
				}
				if (tx.indexOf("^") != -1) {
					for (var i=0; i < actra.length; i++) {
						tx = tx.split("^ESG"+i).join(core.util.syntax.SyntaxDesc_ESG(o, descBlock["tesg"+i], actra[descBlock["t"+i]].gender));
						tx = tx.split("^W"+i).join(core.util.syntax.SynDesc_Who(o, mLang, actra[descBlock["t"+i]].gender));
						tx = tx.split("^P"+i).join(core.util.syntax.SynDesc_Possessive(o, mLang, actra[descBlock["t"+i]].gender));
						tx = tx.split("^F"+i).join(core.util.syntax.SynDesc_ProNoun(o, mLang, actra[descBlock["t"+i]].gender));
						tx = tx.split("^N"+i).join(actra[descBlock["t"+i]].name);
					}
				}
				if (tx.indexOf("^^") != -1) {
					for (var i=0; i < actra.length; i++) {
						tx = tx.split("^^A"+i).join(core.util.syntax.SynDesc_Extra(o, mLang, actra[descBlock["t"+i]].gender, "a"));
						tx = tx.split("^^B"+i).join(core.util.syntax.SynDesc_Extra(o, mLang, actra[descBlock["t"+i]].gender, "b"));
						tx = tx.split("^^C"+i).join(core.util.syntax.SynDesc_Extra(o, mLang, actra[descBlock["t"+i]].gender, "c"));
						tx = tx.split("^^D"+i).join(core.util.syntax.SynDesc_Extra(o, mLang, actra[descBlock["t"+i]].gender, "d"));
					}
				}
			return tx;
			}
			
			
			static function synWho(tx, actra){
				
			if (tx.indexOf("$") != -1) {
				for (var i=0; i < actra.length; i++) {
					tx = tx.split("$W"+i).join(SynDesc_Who(actra[i].gender));
					tx = tx.split("$P"+i).join(SynDesc_Possessive(actra[i].gender));
					tx = tx.split("$F"+i).join(SynDesc_ProNoun(actra[i].gender));
					tx = tx.split("$N"+i).join(actra[i].name);
					}
				}
			return tx;
			}
			
			
			static function SynDesc_Who(o, mLang, gender):String{
				if (gender == "1") {
					if(mLang["user"].wFemale){return mLang["user"].wFemale}
					else{return mLang["default"].wFemale}
				} else if (gender == "0") {
					if(mLang["user"].wMale){return mLang["user"].wMale}
					else{return mLang["default"].wMale}
				} else {
					if(mLang["user"].wNone){return mLang["user"].wNone}
					else{return mLang["default"].wNone}
				}
			}
	
			static function SynDesc_Possessive(o, mLang, gender):String{
				if (gender == "1") {
					if(mLang["user"].pFemale){return mLang["user"].pFemale}
					else{return mLang["default"].pFemale}
				} else if (gender == "0") {
					if(mLang["user"].pMale){return mLang["user"].pMale}
					else{return mLang["default"].pMale}
				} else {
					if(mLang["user"].pNone){return mLang["user"].pNone}
					else{return mLang["default"].pNone}
				}
			}
			
			static function SynDesc_ProNoun(o, mLang, gender):String{
				if (gender == "1") {
					if(mLang["user"].fFemale){return mLang["user"].fFemale}
					else{return mLang["default"].fFemale}
				} else if (gender == "0") {
					if(mLang["user"].fMale){return mLang["user"].fMale}
					else{return mLang["default"].fMale}
				} else {
					if(mLang["user"].fNone){return mLang["user"].fNone}
					else{return mLang["default"].fNone}
				}
			}
			
			static function SynDesc_Extra(o, mLang, gender, extra):String{
				if (gender == "1") {
					if(mLang["user"][extra+"Female"]){return mLang["user"][extra+"Female"]}
					else{return mLang["default"][extra+"Female"]}
				} else if (gender == "0") {
					if(mLang["user"][extra+"Male"]){return mLang["user"][extra+"Male"]}
					else{return mLang["default"][extra+"Male"]}
				} else {
					if(mLang["user"][extra+"None"]){return mLang["user"][extra+"None"]}
					else{return mLang["default"][extra+"None"]}
				}
			}
			
			static function SynDesc_ESG(o, esgType, gender):String{
				if (gender == "1") {
					return o.cfg.langESG[esgType+"Female"]
				} else if (gender == "0") {
					return o.cfg.langESG[esgType+"Male"]
				}
			}
			
			static function SyntaxDesc_ESG(o, esgType, gender):String{
				if (gender == "1") {
					return o.cfg.langESG[esgType+"Female"]
				} else if (gender == "0") {
					return o.cfg.langESG[esgType+"Male"]
				}
			}
			


}