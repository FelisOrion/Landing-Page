exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: {
        "js/app.js": /^(js)/,
				"js/jquery.min.js": ["assets/js/jquery.min.js"],
        "js/bootstrap.min.js": ["assets/js/bootstrap.min.js"],
        "js/wow.js": ["assets/js/wow.js"],
      }
    },
    stylesheets: {
      joinTo: {
        "css/app.css": /^(css)/,
 			  "css/animate.css": ["assets/css/animate.css"],
        "css/bootstrap.min.css": ["assets/css/bootstrap.min.css"],
        "css/style.css": ["assets/css/style.css"],
        "css/font-awesome.min.css": ["assets/css/font-awesome.min.css"],
      },
      order: {
        after: ["assets/css/app.css"] // concat app.css last
      }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },
  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/assets/static". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(static)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: ["static", "css", "js", "vendor"],
    // Where to compile files to
    public: "../priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/vendor/]
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["js/app"]
    // whitelist: ["phoenix", "phoenix_html", "jquery", "underscore"]
    }
  },

  npm: {
    enabled: true
  }
};
