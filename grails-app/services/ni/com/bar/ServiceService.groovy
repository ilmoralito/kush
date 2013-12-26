package ni.com.bar

import grails.transaction.Transactional

@Transactional
class ServiceService {

    def list(String service) {
    	switch(service) {
    		case "drink":
    			return Drink.list()
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
}
