package ni.com.bar

import grails.transaction.Transactional

@Transactional
class DrinkService {

    def checking(def brand) {
    	/*
    	def criteria = Drink.createCriteria()
    	def result = criteria.count() {
    		eq "brand", brand
    		eq "measure", measure
    	}

    	print result
    	*/

    	//print brand
    	//print measure

    	return true
    }
}
