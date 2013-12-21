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

        //stats
        "/stats"(controller:"stats", action:"index")

        //table
        "/tables"(controller:"table")

        "/desactivetable/$number" {
            controller = "table"
            action = "delete"
            constraints {

            }
        }

        "/movetable/from/$currentTableId/to/$newTableNumber" {
            controller = "table"
            action = "moveToTable"
            constraints {

            }
        }

        "/tablelog/$number" {
            controller = "table"
            action = "list"
            constraints {

            }
        }
	}
}
