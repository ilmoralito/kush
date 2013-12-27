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
        [activeTables:Table.active().list(params)]
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

            def newTable = (Table.activeByTableNumber(newTableNumber).get()) ?: new Table(number:newTableNumber)

            if (currentTable?.activities) {
                for(activity in currentTable.activities) {
                    newTable.addToActivities(service:activity.service, amount:activity.amount, total:activity.service.price * activity.amount, flag:currentTable.number)
                }
            }

            currentTable.delete()

            if (!newTable.save()) {
                flash.message = "Algo salio mal. Porfavor intenta otravez"
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
        } else if (params?.type == "cigar") {
            services = Cigar.findAllByStatus(true)
        } else {
            services = LocalDrink.findAllByStatus(true)
        }

    	[table:table, drinks:Drink.list(), services:services]
    }

    def charge(ChargeCommand cmd, Integer number) {
        def table = tableService.tableActive(number)

        if (!table) {
            response.sendError 404
        }

        if (request.method == "POST") {
            if (!cmd.validate()) {
                chain action:"charge", model:[table:table, cmd:cmd], params:[number:number]
                return
            }

            if (cmd.money < cmd.payment) {
                table.addToFees(new Fee(fee:cmd.money))
            } else {
                table.payment = tableService.totalActivities(table)
                table.change = cmd.change
                table.status = true
            }

            table.save()

            flash.message = "Confirmado"
            redirect action:"index"
        }

        def total = tableService.calcTotalPayment(table)

        [table:table, total:total]
    }

    def fees(Long id) {
        def table = Table.get(id)

        if (!table) {
            response.sendError 404
        }

        [fees:table?.fees]
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

        money blank:false, min:1.0
    }
}