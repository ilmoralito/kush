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

}
