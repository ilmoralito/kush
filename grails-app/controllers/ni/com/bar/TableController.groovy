package ni.com.bar

import grails.plugin.springsecurity.annotation.Secured
import org.hibernate.transform.AliasToEntityMapResultTransformer

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class TableController {

    def tableService
    def serviceService

	static defaultAction = "index"
	static allowedMethods = [
		index:"GET",
        moveToTable:"GET",
        moveActivities:"GET",
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
            def activities = currentTable?.activities

            if (activities) {
                for(activity in activities.findAll { it }) {
                    newTable.addToActivities(service:activity.service, amount:activity.amount, total:activity.service.price * activity.amount, flag:activity.flag)
                }
            }

            currentTable.delete()

            if (!newTable.save()) {
                flash.message = "Algo salio mal. Porfavor intenta otravez"
            }
        }

        redirect action:"index"
    }

    def moveActivities(Integer from, Integer flag, Integer to) {
        def fromTable = Table.get(from)
        def toTable = (Table.findByNumberAndStatus(to, false)) ?: new Table(number:to).save()

        if (!fromTable || !toTable) {
            response.sendError 404
        }

        def activities = fromTable.activities.findAll { it.flag == flag }

        for(activity in activities) {
            fromTable.removeFromActivities(activity)
            toTable.addToActivities(activity)
        }

        redirect action:"create", params:[number:fromTable.number]
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

            params.flag = (params?.flag) ?: table.number
            def activity = new Activity(params)

            table.addToActivities(activity)

            if (!activity.validate(["amount"])) {
                chain action:"create", model:[activity:activity], params:[number:params.number, type:params.type]
                return
            }

            flash.message = "Guardado!"
    	}

    	def table = (tableService.tableActive(params.int("number"))) ?: new Table(number:params.int("number")).save()
        def activities = table?.activities
        def services = serviceService.listActiveServicesByType(params?.type)
        def flags = activities?.flag?.unique()

    	[
            table:table,
            activities:activities.findAll { it },
            flags:(flags?.size() > 1) ? flags.sort() : null,
            services:services
        ]
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
        def activities = table?.activities
        def flags = activities?.flag?.unique()

        [table:table, activities:activities, fees:table?.fees, flags:(flags?.size() > 1) ? flags.sort() : null, total:total]
    }

    def fees(Long id) {
        def table = Table.get(id)

        if (!table) {
            response.sendError 404
        }

        [fees:table?.fees, id:id, number:table.number]
    }

    def activity(Long id) {
        def table = Table.get(id)

        if (!table) {
            response.sendError 404
        }

        def activities = table?.activities
        def flags = activities?.flag?.unique()

        [table:table, activities:activities, flags:flags]
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