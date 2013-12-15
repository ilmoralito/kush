package ni.com.bar

class Service {

	BigDecimal price
	Boolean status = true

	Date dateCreated
	Date lastUpdated

    static constraints = {
    	price min:1.0
    }

    String toString() { price }

}
