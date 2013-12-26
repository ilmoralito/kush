package ni.com.bar

import org.hibernate.transform.AliasToEntityMapResultTransformer

class Table {

	Integer number
	BigDecimal payment
	BigDecimal change
	Boolean status = false

	Date dateCreated
	Date lastUpdated

    static constraints = {
    	number min:1, blank:false
    	payment min:1.0, nullable:true
    	change min:0.0, nullable:true
    }

    static mapping = {
    	version false
    }

    static namedQueries = {
    	todayActivities {
            def today = new Date()

            ge "dateCreated", today.clearTime()
            le "dateCreated", today.clearTime() + 1
        }

        active {
            todayActivities()

            eq "status", false
        }

        activeByTableNumber { number ->
            active()

            eq "number", number
        }

        dateCreatedFromTo { from, to ->
            ge "dateCreated", from.clearTime()
            le "dateCreated", to.clearTime()
        }

        groupedByService {
            eq "status", true

            activities {
                projections {
                    property "service.id", "id"
                    groupProperty "service", "service"
                    sum "amount", "count"
                }
            }

            resultTransformer(AliasToEntityMapResultTransformer.INSTANCE)
        }

        groupedByTable {
            eq "status", true

            projections {
                groupProperty "number", "number"
                count "number", "count"
                sum "payment", "payment"
            }

            order "count", "desc"

            resultTransformer(AliasToEntityMapResultTransformer.INSTANCE)
        }

    }

    List activities
    List fees
    static hasMany = [activities:Activity, fees:Fee]

    String toString() { number }

}
