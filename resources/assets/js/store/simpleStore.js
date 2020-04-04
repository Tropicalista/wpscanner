export const store = {
  state: {
    apps: [],
    themes: [],
    plugins: []
  },
  reset(newNumber) {
    this.state.apps = []
    this.state.themes = []
    this.state.plugins = []
  },
  addTheme(themes) {
    this.state.themes = themes
  },
  addApps(apps) {
    this.state.apps = apps
  },
  addPlugins(plugins) {
  	var arr = []
	plugins.forEach( p => {
  		if(!('error' in p.data)){
		    this.state.plugins.push(p.data)
  		}	    
	});
  }
};