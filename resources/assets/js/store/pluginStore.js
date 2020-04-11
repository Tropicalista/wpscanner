export const plugin = {
    state : {
      finished: false,
      slugs: [],
      noPlugins: false,
      baseUrl: '',
      pluginList: [],
      plugins: []
    },
    getAllData(data){
      if(!data.plugins.length){
        this.state.noPlugins = true
        this.finish()
        return
      }
      this.state.slugs = data.plugins
      this.state.baseUrl = data.baseUrl
		  return Promise.all(this.state.slugs.map(this.fetchData))
        .then(resp => {
          this.state.plugins = resp
          this.askToDB()
          this.finish()
        })
    },
    fetchData(plugin) {
      return axios
        .get( 'https://api.wordpress.org/plugins/info/1.2/?action=plugin_information&request[slug]=' + plugin)
        .then(function(response) {
          // if not found add to array notFound
          if(response.data.error){
            response.data = {
              notFound: true,
              slug: plugin,
            }
          }
          return response.data
        })
        .catch(function(error) {
          return { success: false, error: error };
        });
    },
    askToDB(){
      axios.post('/api/plugins', this.state)
        .then( resp => {
          this.state.pluginList = resp.data
          if(!this.state.pluginList.length){
            this.state.noPlugins = false
          }
        })
    },
    reset(){
      this.state.pluginList = []
      this.state.noPlugins = false
      this.state.finished = false
    },
    finish(){
      this.state.finished = true
    }
}