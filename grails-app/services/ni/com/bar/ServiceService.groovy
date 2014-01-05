package ni.com.bar

import grails.transaction.Transactional

@Transactional
class ServiceService {

    def list(String service) {
    	switch(service) {
    		case "drink":
    			return Drink.list(sort:"brand")
    		break
    		case "food":
    			return Food.list()
    		break
    		case "cigar":
    			return Cigar.list()
    		break
            case "localDrink":
                return LocalDrink.list()
            break
    		default:
    			return Service.list()
    	}
    }

    def listActiveServicesByType(String type) {
        def services

         switch(type) {
            case "drink":
                services = Drink.findAllByStatus(true, [sort:"brand"])
            break
            case "food":
                services = Food.findAllByStatus(true, [sort:"name"])
            break
            case "cigar":
                services = Cigar.findAllByStatus(true, [sort:"brand"])
            break
            case "localDrink":
                services = LocalDrink.findAllByStatus(true, [sort:"name"])
            break
            default:
                services = Drink.findAllByStatus(true)
        }

        services
    }

}
