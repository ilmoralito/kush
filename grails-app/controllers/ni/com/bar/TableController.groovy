package ni.com.bar

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class TableController {

    def tableService

	static defaultAction = "index"
	static allowedMethods = [
		index:"GET",
        moveToTable:"GET",
        list:"GET",
		create:["GET", "POST"],
        charge:["GET", "POST"],
        activity:"GET",
        delete:"GET"
	]

    def index() {
        [activeTables:Table.active().list()]
    }

    def delete(Integer number) {
        def table = Table.activeByTableNumber(number).get()

        if (!table) {
            response.sendError 404
        }

        if (table.activities) {
            flash.message = "Accion no permitida. Meza con servcios"
        } else {
            table.delete()
        }

        redirect action:"index"
    }

    def moveToTable(Long currentTableId, Integer newTableNumber) {
        if (currentTableId && newTableNumber) {
            def currentTable = Table.get(currentTableId)

            if (!currentTable) {
                response.sendError 404
            }

            def newTable = Table.activeByTableNumber(newTableNumber).get()

            //check if new tables has activities if this condition is true then avoid operation
            if (newTable?.activities?.size()) {
                flash.message = "Operacion no permitida. Cancela primero meza $currentTable.number"
                return [activeTables:Table.active().list()]
            }

            //check if new tables is allready created if this condition is true then remove new table
            //and then update current table number
            if (newTable?.status == false) {
                newTable.delete()
            }

            currentTable.properties["number"] = newTableNumber

            if (!currentTable.save()) {
                currentTable.errors.allErrors.each {
                    print it
                }
            }
        }

        redirect action:"index"
    }

    def list(Integer number) {
        def tables = Table.todayActivities.findAllByStatusAndNumber(true, number)

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

    def charge(ChargeCommand cmd, Integer number) {
        if (request.method == "POST") {
            def table = tableService.tableActive(number)

            if (!table) {
                response.sendError 404
            }

            if (!cmd.validate()) {
                return [cmd:cmd, table:table]
            }

            table.payment = cmd.payment
            table.change = cmd.change
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

}

class ChargeCommand {
    BigDecimal payment
    BigDecimal money
    BigDecimal change

    static constraints = {
        importFrom Table

        money blank:false, validator:{ val, obj ->
            return val >= obj.payment
        }
    }
}