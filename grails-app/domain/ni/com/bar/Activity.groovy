package ni.com.bar

class Activity {

    Service service
    Integer amount
    BigDecimal total

    Integer flag

    Date dateCreated
    Date lastUpdated

    static constraints = {
    	service blank:false
    	amount min:1, blank:false
    	total min:1.0, blank:false

        flag min:1, nullable:true
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
