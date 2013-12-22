modules = {
    application {
        resource url:'js/application.js'
    }

    app {
    	resource url:"css/app.css"
    }

    service {
    	dependsOn "app, jquery"
    	resource url:"js/app.js"
    }

    charge {
        dependsOn "app, jquery"
        resource url:"js/charge.js"
    }

    stats {
        dependsOn "app, jquery"
        resource url:"js/stats.js"
    }

    offline {
        dependsOn "app"
        resource url:"js/offline.js"
    }

    overrides {
        'jquery-theme' {
            resource id:'theme', url:'css/custom-theme/jquery-ui-1.10.3.custom.min.css'
        }
    }

}
