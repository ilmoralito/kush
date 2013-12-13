package ni.com.bar

class BarTagLib {

    static defaultEncodeAs = 'html'
    static namespace = "bar"
    
    def serviceStatus = { attrs ->
		if (attrs.status) {
			out << "Activo"
		} else {
			out << "Desactivado"
		}
	}
}
