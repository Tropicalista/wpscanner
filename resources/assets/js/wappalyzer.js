const Wappalyzer = require('wappalyzer');
 
const url = process.argv[2];
//const url = "https://www.valerio.it";
const wp  = require('./detect-wp.js');

var body, theme, plugins
 
const options = {
  browser: 'puppeteer',
  debug: false,
  delay: 500,
  maxDepth: 1,
  maxUrls: 1,
  maxWait: 5000,
  recursive: true,
  userAgent: 'Wappalyzer',
  htmlMaxCols: 2000,
  htmlMaxRows: 2000,
};
 
const wappalyzer = new Wappalyzer(url, options);

// Optional: capture log output
// wappalyzer.on('log', params => {
//   const { message, source, type } = params;
// });
 
//Optional: do something on page visit
wappalyzer.on('visit', params => {
  const { browser, pageUrl } = params;
  theme = wp.getTheme(browser.html);
  plugins = wp.getPlugins(browser.html);
  body = browser.html

});
 
wappalyzer.analyze()
  .then((json) => {
    //json.body = body
    json.theme = theme
    json.plugins = plugins
    process.stdout.write(`${JSON.stringify(json, null, 2)}\n`);
 
    process.exit(0);
  })
  .catch((error) => {
    process.stderr.write(`${error}\n`);
 
    process.exit(1);
  });