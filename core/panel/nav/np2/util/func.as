

class core.panel.nav.np2.util.func {

	
			public static function navTabTitlePro(txt, o, dia, xml){
					if(txt.charAt(0) == "$"){return core.panel.nav.np2.util.func["navTextCmd"+txt](txt, o, dia, xml)}
					else if(txt.charAt(0) == "^"){
						if(txt.charAt(1) == "^"){ return o.cfg.lang[txt.substr(2)]}
						else{return core.panel.nav.np2.util.func.translateDesc(o, dia, txt.substr(1), xml)}
					}else{return txt}
			}
			
			public static function iconCmd(txt, o, m){
						if (txt.indexOf("$g") != -1) {
						for (var i=0; i < m.dia.actra.length; i++) {
							txt = txt.split("$g"+i).join(m.dia.actra[i].genderL);
						}
						}
						return txt
			}
			
			
			public static function navTextCmd$name(txt, o, dia, xml){
				return dia.actra[xml.actor].name
			}
			
			
			public static function hueFormCmd(hue, ico, o, m){
				if(hue.cmd){					
					return core.panel.nav.np2.util.func["hueFormCmd_"+(hue.cmd.toLowerCase())](hue, ico, o, m)
				}else{return "deny"}
			}
			
			public static function hueFormCmd_rg(hue, ico, o, m){
					if(ico){
					var toneTrans = new flash.geom.Transform(ico[hue.n]);
					toneTrans.colorTransform = m.dia.roleData[hue.a].hue.gfxHue
					}else{return m.dia.module.role[hue.a].gfx[0].gfxhue}
			}
			
			public static function hueFormCmd_rn(hue, ico, o, m){
					if(ico){
					var toneTrans = new flash.geom.Transform(ico[hue.n]);
					var thisColor = new flash.geom.ColorTransform
					thisColor.rgb = "0x"+m.dia.module.role[hue.a].gfx[0].namehue
					toneTrans.colorTransform = thisColor
					}else{return m.dia.module.role[hue.a].gfx[0].namehue}
			}
			
			public static function hueFormCmd_vg(hue, ico, o, m){
					if(ico){
					var toneTrans = new flash.geom.Transform(ico[hue.n]);
					var thisColor = new flash.geom.ColorTransform
					thisColor.rgb = "0x"+m.dia.module.visitor[hue.a].gfx[0].gfxhue
					toneTrans.colorTransform = thisColor					
					}else{
						//var thisColor = new flash.geom.ColorTransform
						//thisColor.rgb = "0x"+m.dia.module.visitor[hue.a].gfx[0].gfxHue
						//return thisColor
						return m.dia.module.visitor[hue.a].gfx[0].gfxhue
						}
			}
			
			public static function hueFormCmd_vn(hue, ico, o, m){
					if(ico){
					var toneTrans = new flash.geom.Transform(ico[hue.n]);
					var thisColor = new flash.geom.ColorTransform
					thisColor.rgb = "0x"+m.dia.module.visitor[hue.a].gfx[0].namehue
					toneTrans.colorTransform = thisColor
					}else{
						return m.dia.module.visitor[hue.a].gfx[0].namehue
						}
			}
			
			public static function hueFormCmd_rgb(hue, ico, o, m){
					if(ico){
					var toneTrans = new flash.geom.Transform(ico[hue.n]);
					var thisColor = new flash.geom.ColorTransform
					thisColor.rgb = "0x"+hue.v
					toneTrans.colorTransform = thisColor
					}else{
						return hue.v
						}
			}
			
			public static function hueFormCmd_body(hue, ico, o, m){		
				if(o.cfg.config.skinToneDisplay=="1"){
						if(ico){		
							if(ico.multibody){
								for (var i=0; i < hue.bo.length; i++) {
								core.panel.nav.np2.util.func.bodyHueMulti(hue.bo[i], ico, o, m, "sk", i)
								core.panel.nav.np2.util.func.bodyHueMulti(hue.bo[i], ico, o, m, "ni", i)
								core.panel.nav.np2.util.func.bodyHueMulti(hue.bo[i], ico, o, m, "li", i)
								core.panel.nav.np2.util.func.bodyHueMulti(hue.bo[i], ico, o, m, "ha", i)
								core.panel.nav.np2.util.func.bodyHueMulti(hue.bo[i], ico, o, m, "ey", i)						
								core.panel.nav.np2.util.func.bodyHueMulti(hue.bo[i], ico, o, m, "mg", i)
								core.panel.nav.np2.util.func.bodyHueMulti(hue.bo[i], ico, o, m, "fg", i)
								core.panel.nav.np2.util.func.bodyHueMulti(hue.bo[i], ico, o, m, "el", i)
								core.panel.nav.np2.util.func.bodyHueMulti(hue.bo[i], ico, o, m, "es", i)
								core.panel.nav.np2.util.func.bodyHueMulti(hue.bo[i], ico, o, m, "np", i)
								core.panel.nav.np2.util.func.bodyHueMulti(hue.bo[i], ico, o, m, "fr", i)
								core.panel.nav.np2.util.func.bodyHueMulti(hue.bo[i], ico, o, m, "bs", i)
								core.panel.nav.np2.util.func.bodyHueMulti(hue.bo[i], ico, o, m, "vn", i)
							}
							}else{
							core.panel.nav.np2.util.func.bodyHueSingle(hue, ico, o, m, "sk")
							core.panel.nav.np2.util.func.bodyHueSingle(hue, ico, o, m, "ni")
							core.panel.nav.np2.util.func.bodyHueSingle(hue, ico, o, m, "li")
							core.panel.nav.np2.util.func.bodyHueSingle(hue, ico, o, m, "ha")
							core.panel.nav.np2.util.func.bodyHueSingle(hue, ico, o, m, "ey")						
							core.panel.nav.np2.util.func.bodyHueSingle(hue, ico, o, m, "mg")
							core.panel.nav.np2.util.func.bodyHueSingle(hue, ico, o, m, "fg")
							core.panel.nav.np2.util.func.bodyHueSingle(hue, ico, o, m, "el")
							core.panel.nav.np2.util.func.bodyHueSingle(hue, ico, o, m, "es")
							core.panel.nav.np2.util.func.bodyHueSingle(hue, ico, o, m, "np")
							core.panel.nav.np2.util.func.bodyHueSingle(hue, ico, o, m, "fr")
							core.panel.nav.np2.util.func.bodyHueSingle(hue, ico, o, m, "bs")	
							core.panel.nav.np2.util.func.bodyHueSingle(hue, ico, o, m, "vn")	
							
							}
						}
				}
			}			
			
			public static function bodyHueSingle(hue, ico, o, m, bodypart){
				if(ico[bodypart]){
					var _alpSave = ico[bodypart]._alpha
					var toneTrans = new flash.geom.Transform(ico[bodypart]);
					toneTrans.colorTransform = m.dia.actra[hue.a].gfx[bodypart+"RGB"]
					ico[bodypart]._alpha = _alpSave
					
				}
			}
			
			public static function bodyHueMulti(hue, ico, o, m, bodypart, index){
				if(ico[bodypart+index]){
					var _alpSave = ico[bodypart+index]._alpha
					var toneTrans = new flash.geom.Transform(ico[bodypart+index]);
					toneTrans.colorTransform = m.dia.actra[hue.a].gfx[bodypart+"RGB"]
					ico[bodypart+index]._alpha = _alpSave
					
				}
			}
			
			public static function translateDesc(o, dia, val, xml){
			if(o.lib.lang[dia.module.id].user[val]){
			return core.util.syntax.syntaxDesc(o, o.lib.lang[dia.module.id].user[val], xml, o.lib.lang[dia.module.id], dia.actra)
			}else if(o.lib.lang[dia.module.id]["default"][val]){
			return core.util.syntax.syntaxDesc(o, o.lib.lang[dia.module.id]["default"][val], xml, o.lib.lang[dia.module.id], dia.actra)
			}else{return ""}
			}
			
			
		
				
}