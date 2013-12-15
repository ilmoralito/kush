package ni.com.bar

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class TableController {

	static defaultAction = "index"
	static allowedMethods = [
		index:"GET",
		create:["GET", "POST"],
        delete:"GET"
	]

	def tableService

    def index() { }

    def create() {
    	if (request.method == "POST") {
            def table = tableService.tableActive(params.int("number"))

            if (!table) {
                response.sendError 404
            }

            def activity = new Activity(params)

            table.addToActivities(activity)

            if (!activity.validate(["amount"])) {
                chain action:"create", model:[activity:activity], params:[number:params.number, type:params.type]
                return
            }

            flash.message = "Guardado!"
    	}
        //print params

    	def table = tableService.tableActive(params.int("number"))
        def services

        if (params?.type == 'drink' || !params.type) {
            services = Drink.findAllByStatus(true)
        } else if (params?.type == 'food') {
            services = Food.findAllByStatus(true)
        } else {
            services = Cigar.findAllByStatus(true)
        }

    	[table:table, drinks:Drink.list(), services:services]
    }

}
