export default {
    getAllData(URLs){
    	console.log(URLs)
		return Promise.all(URLs.map(this.fetchData));
    },
    fetchData(URL) {
      return axios
        .get(URL)
        .then(function(response) {
          return {
            success: true,
            data: response.data
          };
        })
        .catch(function(error) {
          return { success: false, error: error };
        });
    }
}