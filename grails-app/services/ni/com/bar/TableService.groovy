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

    def totalActivities(Table table) {
        def activitiesCriteria = Table.createCriteria()
        def totalActivities = activitiesCriteria.get() {
            eq "id", table.id

            projections {
                activities {
                    sum "total"
                }
            }
        }

        return totalActivities
    }

    def totalFees(Table table) {
        def feesCriteria = Fee.createCriteria()
        def totalFees = feesCriteria.get() {
            eq "table", table

            projections {
                sum "fee"
            }
        }

        return totalFees
    }

    def calcTotalPayment(Table table) {
        def total = totalActivities(table) - (totalFees(table) ?: 0)

        return total
    }
}
