package ni.com.bar

class BarTagLib {

    static defaultEncodeAs = 'html'
    static namespace = "bar"

    def tableService

    def serviceStatus = { attrs ->
		if (attrs.status) {
			out << "Activo"
		} else {
			out << "Desactivado"
		}
	}

	def total = { attrs ->
		def id = attrs.table.id

		def criteria = Table.createCriteria()
		def total = criteria.get() {
			eq "id", id

			projections {
				activities {
					sum "total"
				}
			}
		}

		out << total
	}

	def check = { attrs ->
		Integer number = attrs.int("number")
		def result = tableService.tableActive(number)

		out << result
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
