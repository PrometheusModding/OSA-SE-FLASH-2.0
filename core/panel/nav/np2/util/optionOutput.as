

class core.panel.nav.np2.util.optionOutput {

			

			public static function $invitescan(o, m, f, g, x){
				m.addReplacerMenu("addactorscan", f, g, x)
			}
			
			public static function $removeactor(o, m, f, g, x){
				m.dia.actraDismiss(x.actor, x.dest)
			}
			
			public static function $obsexit(o, m, f, g, x){
				m.dia.exitObserver()
			}
			
			public static function $endscene(o, m, f, g, x){
				m.dia.endCommand()
			}
				
}