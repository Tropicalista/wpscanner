module.exports = class detectWP {
      
    
    static getTheme(body) {

        return body.match(/\/themes\/[a-z-0-9]+\/\S+.css/ig);

        //if ( theme !== null && theme[0] )  return  theme[0].replace('/themes/','').replace('/','');

        return null; 

    }


    static getThemeInfo(body,param){

        let regex = new RegExp(param+ ":(.*?)+", "g");

        let themeName = regex.exec(body);

        if ( themeName !== null && themeName[0] ){

            // If the declaration is misformed e.g : everything on one line
            if ( themeName[0].length > 800 ) return false; 

            return  _.trim( themeName[0].replace(`${param}:`,'') );
            
        } 

        return null;

    }


    
    static getPlugins(body){

        let plugins = body.match(/\/plugins\/[a-z-0-9]+\//g);

        if ( plugins !== null && plugins[0] ){

            // If the declaration is misformed 
            if ( plugins[0].length > 800 ) return false; 

            plugins = plugins.map( p => p.replace('/plugins/','').replace('/','') );

            return [...new Set(plugins)];
            
        } 

        return null;

    }

}