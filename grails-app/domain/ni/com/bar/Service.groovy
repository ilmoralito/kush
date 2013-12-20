package ni.com.bar

class Service {

	BigDecimal price
	Boolean status = true

	Date dateCreated
	Date lastUpdated

    static constraints = {
    	price blank:false, min:1.0
    }

    String toString() { price }

}
