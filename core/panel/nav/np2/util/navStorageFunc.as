

class core.panel.nav.np2.util.navStorageFunc {

			

			public static function pro(o, m, f, x){
				if(x.has==true){
					core.panel.nav.np2.util.navStorageFunc[x.cmd[0]](o,m,f,x)
				}
				
				m.dia.navStorage = undefined
			}
			
			public static function $saveactor(o, m, f, x){
			
				for (var i=0; i < f.tab.length; i++){
					if(f.tab[i].x.actor == x.actor){
					 m.ctr.tab = i	
					}
				}
			}
			
			
			public static function $actionsave(o, m, f, x){
				if(f.tab[x.tab].arr[x.page].arr[x.option]){
				m.ctr.tab = x.tab
				f.tab[m.ctr.tab].selectPage(x.page)
				f.tab[m.ctr.tab].arr[x.page].ctr.jumpPoint(x.option)
				
				}
			}
			
			

				
}