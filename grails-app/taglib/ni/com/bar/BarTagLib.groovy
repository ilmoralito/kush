package ni.com.bar

class BarTagLib {

    static defaultEncodeAs = "html"
    static encodeAsForTags = [check: "raw", showDisabledTableLink:"raw"]
    static namespace = "bar"

    def tableService

    def serviceStatus = { attrs ->
		if (attrs.status) {
			out << "Activo"
		} else {
			out << "Desactivado"
		}
	}

	def totalActivities = { attrs ->
		def table = attrs.table

		out << tableService.totalActivities(table)
	}

	def totalActivitiesByFlag = { attrs ->
		def flag = attrs.int("flag")
		def number = attrs.int("number")

		def criteria = Table.createCriteria()
		def result = criteria.get() {
			eq "status", false
			eq "number", number

			activities {
				eq "flag", flag
			}

			projections {
				activities {
					sum "total"
				}
			}
		}

		out << result
	}

	def totalFees = { attrs ->
		def table = attrs.table

		out << tableService.totalFees(table)
	}

	def totalPayment = { attrs ->
		def table = attrs.table

		out << tableService.calcTotalPayment(table)
	}

	def check = { attrs, body ->
		Integer number = attrs.int("number")
		def result = Table.todayActivities.findAllByStatusAndNumber(true, number)

		if (result) {
			out << body()
		}
	}

	def showDisabledTableLink = { attrs, body ->
		Integer number = attrs.int("number")
		def result = Table.activeByTableNumber(number).get()

		if (!result?.activities?.size()) {
			out << body()
		}
	}

	def totalByTable = { attrs ->
		Integer number = attrs.int("number")
		def from = (attrs.from) ? new Date().parse("yyyy-MM-dd", attrs.from) : new Date()
		def to = (attrs.to) ? new Date().parse("yyyy-MM-dd", attrs.to) : new Date()

		def criteria = Table.createCriteria()
		def result = criteria.get() {
            ge "dateCreated", from.clearTime()
            le "dateCreated", to.clearTime() + 1
            eq "number", number
            eq "status", true

            projections {
            	sum "payment"
            }
		}

		out << result
	}

}
