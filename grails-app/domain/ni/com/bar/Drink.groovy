package ni.com.bar

class Drink extends Service {

	String brand
	String measure

    static constraints = {
    	brand blank:false, maxSize:255, inList:["Tona", "Victoria", "Corona", "Coca cola", "Heineken"]
    	measure blank:false, maxSize:255, inList:["12 Onz", "1/2 Litro", "1 Litro"]
    }
}
