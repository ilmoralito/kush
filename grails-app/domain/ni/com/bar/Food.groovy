package ni.com.bar

class Food extends Service{

	String name

	static hasMany = [items:String]

	SortedSet items

    static constraints = {
    	name blank:false, unique:true
    }

    String toString() { name }
}
