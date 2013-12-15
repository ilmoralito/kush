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

	def test = { attrs ->
		Integer number = attrs.number
		def result = tableService.tableActive(number)

		if (result) {
			out << "primary"
		} else {
			out << "default"
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

}
