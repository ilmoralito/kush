package ni.com.bar

class Drink extends Service {

	String brand
	String measure

    static constraints = {
    	brand blank:false, maxSize:255, unique:"measure", inList:["Tona", "Victoria", "Corona", "Heineken", "Jager Maister", "Coca cola", "Ensa"]
    	measure blank:false, maxSize:255, inList:["12 Onz", "1/2 Litro", "1 Litro", "2 Litros", "Lata"]
    }

    String toString() { "$brand de $measure" }
}
