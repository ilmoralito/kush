package ni.com.bar

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class TableController {

	static defaultAction = "index"
	static allowedMethods = [
		index:"GET",
        list:"GET",
		create:["GET", "POST"],
        charge:["GET", "POST"],
        activity:"GET"
	]

	def tableService

    def index() { }

    def list(Integer number) {
        def tables = Table.todayActivity.findAllByStatusAndNumber(true, number)

        [tables:tables]
    }

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

    	def table = (tableService.tableActive(params.int("number"))) ?: new Table(number:params.int("number")).save()
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

    def charge(Integer number) {
        if (request.method == "POST") {
            def table = tableService.tableActive(number)

            if (!table) {
                response.sendError 404
            }

            table.payment = params.double("payment")
            table.change = (params?.change) ? params.double("change") : 0
            table.status = true

            if (!table.save()) {
                return [table:table]
            }

            flash.message = "Confirmado"
            redirect action:"index"
        }

        def table = tableService.tableActive(number)

        [table:table]
    }

    def activity(Long id) {
        def table = Table.get(id)

        if (!id) {
            response.sendError 404
        }

        [table:table]
    }

    def handleNumberFormatException(NumberFormatException nfe) {
        render "Se espera un numero. Dato incorrecto"
    }

}
