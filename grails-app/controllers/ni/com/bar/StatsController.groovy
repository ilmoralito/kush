package ni.com.bar

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class StatsController {

	static defaultAction = "index"
	static allowedMethods = [
		index:["GET", "POST"]
	]

    def index(String from, String to) {
    	def fromDate = (from) ? new Date().parse("yyyy-MM-dd", from) : new Date()
    	def toDate = (to) ? new Date().parse("yyyy-MM-dd", to) : new Date() + 1
    	def results = Table.groupedByService(fromDate, toDate).list()

    	List drinks = []
    	List foods = []
    	List cigars = []

    	results.each { result ->
    		def service = Service.get(result.id)

    		if (service instanceof ni.com.bar.Drink) {
    			drinks << result
    		}

    		if (service instanceof ni.com.bar.Food) {
    			foods << result
    		}

    		if (service instanceof ni.com.bar.Cigar) {
    			cigars << result
    		}
    	}

    	//drinks total
    	def drinksTotal = 0
    	drinks.each { drink ->
    		drinksTotal = drinksTotal + (drink.service.price * drink.count)
    	}

    	//food total
    	def foodsTotal = 0
    	foods.each { food ->
    		foodsTotal = foodsTotal + (food.service.price * food.count)
    	}

    	//cigar
    	def cigarsTotal = 0
    	cigars.each { cigar ->
    		cigarsTotal = cigarsTotal + (cigar.service.price * cigar.count)
    	}

    	//total
    	def total = 0
    	results.each { result ->
    		total = total + result.service.price * result.count
    	}

    	[
    		drinks:drinks,
    		drinksTotal:drinksTotal,
    		foods:foods,
    		foodsTotal:foodsTotal,
    		cigars:cigars,
    		cigarsTotal:cigarsTotal,
    		total:total
    	]
    }

}
