package ni.com.bar

class Food extends Service{

	static hasMany = [items:String]

	SortedSet items

    static constraints = {
    	
    }
}
