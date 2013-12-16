package ni.com.bar

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
    	todayActivity {
            def today = new Date()

            ge "dateCreated", today.clearTime()
            le "dateCreated", today.clearTime() + 1
        }
    }

    List activities
    static hasMany = [activities:Activity]

    String toString() { number }

}
