export const store = {
  state: {
    finished: false,
    noTheme: false,
    apps: [],
    themes: [],
    plugins: []
  },
  setNoTheme() {
    this.state.noTheme = true
  },
  reset() {
    this.state.finished = false
    this.state.noTheme = false
    this.state.apps = []
    this.state.themes = []
    this.state.plugins = []
  },
  addTheme(themes) {
    if(!themes.length){
      this.setNoTheme()
    }
    this.state.themes = themes
  },
  addApps(apps) {
    this.state.apps = apps
  },
  finish(){
    this.state.finished = true
  }
};