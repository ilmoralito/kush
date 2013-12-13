package ni.com.bar

class Service {

	String name
	BigDecimal price
	Boolean status = true

	Date dateCreated
	Date lastUpdated

    static constraints = {
    	name blank:false
    	price min:1.0
    }

    String toString() { name }

}
