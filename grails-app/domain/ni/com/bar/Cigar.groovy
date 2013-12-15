package ni.com.bar

class Cigar extends Service {

	String brand
	String size

    static constraints = {
    	brand blank:false, maxSize:255, inList:["Malvoro", "MacGregor"]
    	size blank:false, maxSize:255, inList:["10", "20"]
    }

    String toString() { "$brand $size" }
}
