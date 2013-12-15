package ni.com.bar

import grails.transaction.Transactional

@Transactional
class TableService {

    def tableActive(Integer number) {
    	def criteria = Table.createCriteria()
		def table = criteria.get() {
			eq "number", number
			eq "status", false
		}

		return table
    }
}
