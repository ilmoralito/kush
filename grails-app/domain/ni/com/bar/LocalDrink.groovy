package ni.com.bar

import org.grails.databinding.BindUsing

class LocalDrink extends Service {

	@BindUsing({
		obj, source -> source["name"]?.capitalize()
	})
	String name

    static constraints = {
    	name blank:false, unique:true
    }

    String toString() { name }
}
