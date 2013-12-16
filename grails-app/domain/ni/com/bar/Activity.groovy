package ni.com.bar

class Activity {

	Service service
	Integer amount
	BigDecimal total

    static constraints = {
    	service blank:false
    	amount min:1, blank:false
    	total min:1.0, blank:false
    }

    static belongsTo = [table:Table]

    static namedQueries = {

    }

    def beforeInsert() {
    	total = service.price * amount
    }

    def beforeUpdate() {
        total = service.price * amount
    }

    String toString() { service }

}
