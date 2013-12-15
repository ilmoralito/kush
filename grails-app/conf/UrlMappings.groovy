class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.${format})?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:"login")
        "500"(view:'/error')

        //service
        "/services"(controller:"service", action:"list")
        "/tables"(controller:"table")
	}
}
