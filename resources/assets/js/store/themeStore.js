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
  addThemes(themes) {
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
  },
  getTheme(theme) {
    axios
        .post('/api/wordpress/theme', {
            theme: theme
        })
        .then(response => {
            this.addThemes(response.data.data)
            // get or insert from database so we can have referral links
            this.getThemeFromDB(response.data.data)
            //this.getThemeScreenshot(theme)
        } )
        .catch(error => console.log( error.response ) )              
  },
  getThemeFromDB(theme) {
      axios
          .post('/api/themeFromDb', {
              theme: theme
          })
          .then(response => {
              this.addThemes(response.data)
              console.log(response.data)
              this.finish()
          } )
          .catch(error => console.log( error.response ) )              
  },

};