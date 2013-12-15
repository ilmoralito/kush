package ni.com.bar

class Drink extends Service {

	String brand
	String measure

    static constraints = {
    	brand blank:false, maxSize:255, inList:["Tona", "Victoria", "Corona", "Heineken"], validator:{ val, obj ->
    		def criteria = Drink.createCriteria()
	    	def result = criteria.count() {
	    		eq "brand", val
	    		eq "measure", obj.measure
	    	}

	    	if (result) {
	    		return false
	    	} else {
	    		return true
	    	}
    	}
    	measure blank:false, maxSize:255, inList:["12 Onz", "1/2 Litro", "1 Litro"]
    }

    String toString() { "$brand $measure" }
}
