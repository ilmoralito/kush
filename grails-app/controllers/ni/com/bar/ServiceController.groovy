package ni.com.bar

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class ServiceController {

	static defaultAction = "list"
	static allowedMethods = [
		list:"GET",
		create:["GET", "POST"],
		show:"GET",
		update:["POST", "PUT"]
	]

    def list() {
    	def services = Service.list(params)

    	[services:services]
    }

    def create(String type) {
    	if (request.method == "POST") {
    		if (type == "drink") {
    			def drink = new Drink(params)

    			if (!drink.save()) {
    				return [drink:drink, type:type]
    			}

    			flash.message = "Nueva bebida guardada"
    		} else {
    			def food = new Food(params)

    			if (!food.save()) {
    				return [food:food, type:type]
    			}

    			flash.message = "Nueva comida guardad"
    		}
    	} else {
    		if (type == "drink") {
    			return [food:new Drink(params)]
    		} else {
    			return [drink:new Food(params)]
    		}
    	}
    }

    def show(Long id, String type) {

    }

}
