package ni.com.bar

class Fee {

	BigDecimal fee

	Date dateCreated
	Date lastUpdated

    static constraints = {
    	fee blank:false, min:1.0
    }

    static belongsTo = [table:Table]

    String toString() { fee }
}
