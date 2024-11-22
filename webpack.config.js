const Encore = require('@symfony/webpack-encore');
const glob = require('glob');
const path = require('path');

// Manually configure the runtime environment if not already configured yet by the "encore" command.
// It's useful when you use tools that rely on webpack.config.js file.
if (!Encore.isRuntimeEnvironmentConfigured()) {
    Encore.configureRuntimeEnvironment(process.env.NODE_ENV || 'dev');
}

Encore
    // directory where compiled assets will be stored
    .setOutputPath('public/build/')
    // public path used by the web server to access the output path
    .setPublicPath('/build')
    // only needed for CDN's or subdirectory deploy
    //.setManifestKeyPrefix('build/')

    /*
     * ENTRY CONFIG
     *
     * Each entry will result in one JavaScript file (e.g. app.js)
     * and one CSS file (e.g. app.css) if your JavaScript imports CSS.
     */
    // .addEntry('app', './assets/app.js')
    .addEntry('app', './assets/index.js')
    .enableReactPreset() 
    .autoProvidejQuery() // Ajout de cette ligne .enableSingleRuntimeChunk();

    // When enabled, Webpack "splits" your files into smaller pieces for greater optimization.
    .splitEntryChunks()

    // will require an extra script tag for runtime.js
    // but, you probably want this, unless you're building a single-page app
    .enableSingleRuntimeChunk()

    /*
     * FEATURE CONFIG
     *
     * Enable & configure other features below. For a full
     * list of features, see:
     * https://symfony.com/doc/current/frontend.html#adding-more-features
     */
    .cleanupOutputBeforeBuild()
    .enableBuildNotifications()
    .enableSourceMaps(!Encore.isProduction())
    // enables hashed filenames (e.g. app.abc123.css)
    .enableVersioning(Encore.isProduction())

    // configure Babel
    // .configureBabel((config) => {
    //     config.plugins.push('@babel/a-babel-plugin');
    // })

    // enables and configure @babel/preset-env polyfills
    .configureBabelPresetEnv((config) => {
        config.useBuiltIns = 'usage';
        config.corejs = '3.38';
    })

    // Ajouter tous les fichiers CSS du dossier 'assets/css' 
    .addStyleEntry('styles', glob.sync('./assets/styles/**/*.css').map(file => path.resolve(__dirname, file)))
    //.addStyleEntry('styles', glob.sync('./assets/styles/**/*.css'))
    // enables Sass/SCSS support
    .enableSassLoader()

    // uncomment if you use TypeScript
    //.enableTypeScriptLoader()

    // uncomment if you use React
    .enableReactPreset()
    .configureDevServerOptions(options => {
         options.hot = true; 
    })
    // Copier les fichiers d'images 
    .copyFiles({ 
        from: './assets/img', 
        to: 'img/[path][name].[ext]', // Destination dans le dossier public/build 
        pattern: /\.(png|jpg|jpeg|gif|ico|svg)$/
    })

    // uncomment to get integrity="..." attributes on your script & link tags
    // requires WebpackEncoreBundle 1.4 or higher
    //.enableIntegrityHashes(Encore.isProduction())

    // uncomment if you're having problems with a jQuery plugin
    .autoProvidejQuery()
;

/*
Encore 
    .setOutputPath('public/build/')
    .setPublicPath('/build')
    .addEntry('app', './assets/js/app.js')
    .enableReactPreset()
    .enableSassLoader() // Ajoutez cette ligne si vous utilisez Sass
    .autoProvidejQuery()
    .enableSingleRuntimeChunk();
*/

// Add jquery to all react page
/*
Encore 
    .setOutputPath('public/build/') 
    .setPublicPath('/build') 
    .addEntry('app', './assets/js/app.js') 
    .enableReactPreset() 
    .autoProvidejQuery() // Ajout de cette ligne .enableSingleRuntimeChunk();
    */
    

module.exports = Encore.getWebpackConfig();
