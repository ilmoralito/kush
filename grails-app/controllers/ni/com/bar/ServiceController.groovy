package ni.com.bar

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class ServiceController {

    def serviceService

	static defaultAction = "list"
	static allowedMethods = [
		list:"GET",
		create:["GET", "POST"],
		show:"GET",
		update:["POST", "PUT"],
        changeStatus:"GET"
	]

    def list(String service) {
    	def services = serviceService.list(service)

    	[services:services]
    }

    def create(String type) {
    	if (request.method == "POST") {
    		if (type == "drink") {
    			def drink = new Drink(params)

    			if (!drink.save()) {
    				return [service:drink, type:type]
    			}
    		} else if (type == "food") {
    			def food = new Food(params)

    			if (!food.save()) {
    				return [service:food, type:type]
    			}
    		} else if (type == "cigar") {
    			def cigar = new Cigar(params)

    			if (!cigar.save()) {
    				return [service:cigar, type:type]
    			}
    		} else {
                def localDrink = new LocalDrink(params)

                if (!localDrink.save()) {
                    return [service:localDrink, type:type]
                }
            }

    		flash.message = "Guardado"
    	}

        if (type == "drink") {
    		return [service:new Drink()]
    	} else if (type == "food") {
    		return [service:new Food()]
    	} else if (type == "cigar") {
    		return [service:new Cigar()]
    	} else {
            return [service:new LocalDrink()]
        }
    }

    def show(Long id, String type) {
		def service = Service.get(id)

		if (!service) {
			response.sendError 404
		}

		[service:service]
    }

    def update(Long id, String type) {
		def service = Service.get(id)

		if (!service) {
			response.sendError 404
		}

		if (type == "drink") {
			service.properties["price", "brand", "measure"] = params
		} else if (type == "food") {
			service.properties["name", "price", "items"] = params
		} else if (type == "cigar") {
			service.properties["price", "brand", "size"] = params
		} else {
            service.properties["name", "price"] = params
        }

		if (!service.save()) {
			chain action:"show", model:[service:service], params: [id:id, type:type]
			return false
		}

		redirect action:"show", params:[id:id, type:type]
    }

    def changeStatus(Long id, String type) {
		def service = Service.get(id)

		if (!service) {
			response.sendError 404
		}

        service.properties["status"] = !service.status

        if (!service.save()) {
            service.errors.allErrors.each {
                print it
            }
        }

		flash.message = "Estado cambiado"

		redirect action:"list", params:[service:(type) ?: '']
    }

}
