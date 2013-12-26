package ni.com.bar

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class StatsController {

	static defaultAction = "index"
	static allowedMethods = [
		index:["GET", "POST"],
        byTables:["GET", "POST"]
	]

    def index(String from, String to) {
    	def dates = validateDates(from, to)
    	def results = Table.dateCreatedFromTo(dates.fromDate, dates.toDate).groupedByService.list()

    	List drinks = []
        List cigars = []
    	List foods = []
        List localDrinks = []

    	results.each { result ->
    		def service = Service.get(result.id)

    		if (service instanceof ni.com.bar.Drink) {
    			drinks << result
    		}

            if (service instanceof ni.com.bar.Cigar) {
                cigars << result
            }

    		if (service instanceof ni.com.bar.Food) {
    			foods << result
    		}

            if (service instanceof ni.com.bar.LocalDrink) {
                localDrinks << result
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

        //localDrinks total
        def localDrinksTotal = 0
        localDrinks.each { localDrink ->
            localDrinksTotal = localDrinksTotal + (localDrink.service.price * localDrink.count)
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
            localDrinks:localDrinks,
            localDrinksTotal:localDrinksTotal,
    		total:total
    	]
    }

    def byTables(String from, String to) {
        def dates = validateDates(from, to)
        def results = Table.dateCreatedFromTo(dates.fromDate, dates.toDate).groupedByTable().list()

        [results:results]
    }

    private validateDates(String from, String to) {
        def fromDate = (from) ? new Date().parse("yyyy-MM-dd", from) : new Date()
        def toDate = (to) ? new Date().parse("yyyy-MM-dd", to) : new Date() + 1

        [fromDate:fromDate, toDate:toDate]
    }

}
