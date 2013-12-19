import ni.com.bar.*
import grails.util.GrailsUtil

class BootStrap {

    def init = { servletContext ->
    	def adminRole = (Role.findByAuthority("ROLE_ADMIN")) ?: new Role(authority:"ROLE_ADMIN").save()
    	def userRole = (Role.findByAuthority("ROLE_USER")) ?: new Role(authority:"ROLE_USER").save()

    	def admin = User.findByUsername("admin") ?: new User(username:"admin", password:"admin", fullName:"John Doe",email:"johndoe@gmail.com").save()
    	def user = User.findByUsername("user") ?: new User(username:"user", password:"user", fullName:"John Lee", email:"johnlee@gmail.com").save()

        if (!admin.authorities.contains(adminRole)) {
            UserRole.create admin, adminRole, true
        }

        if (!user.authorities.contains(userRole)) {
        	UserRole.create user, userRole, true
        }

        switch(GrailsUtil.environment) {
            case "development":
                //Drinks
                def heineken = new Drink(price:120, brand:"Heineken", measure:"1/2 Litro")
                if (!heineken.save()) {
                    heineken.errors.allErrors.each {
                        print it
                    }
                }

                def victoria = new Drink(price:100, brand:"Victoria", measure:"1 Litro")
                if (!victoria.save()) {
                    victoria.errors.allErrors.each {
                        print it
                    }
                }

                //foods
                def bFoodItems = ["Papas", "Bolitas de carne", "Frijoles licuados"]
                def bFood = new Food(name:"Variado grande", price:200, items:bFoodItems)

                if (!bFood.save()) {
                    bFood.errors.allErrors.each {
                        print it
                    }
                }

                def sFoodItems = ["Papas", "Bolitas de carne", "Frijoles licuados", "Queso frito", "Aguacate"]
                def sFood = new Food(name:"Variado stril", price:100, items:sFoodItems)

                if (!sFood.save()) {
                    sFood.errors.allErrors.each {
                        print it
                    }
                }

                def vigoronItems = ["Papa", "Arroz", "Frijoles licuados", "Queso", "Pan"]
                def vigoron = new Food(name:"Vigoron", price:80, items:vigoronItems)

                if (!vigoron.save()) {
                    vigoron.errors.allErrors.each {
                        print it
                    }
                }

                def tostones = new Food(name:"Tostones con quezo", price:80)

                if (!tostones.save()) {
                    tostones.errors.allErrors.each {
                        print it
                    }
                }

                //cigar
                def cigar = new Cigar(brand:"Malvoro", price:25, size:"10").save()

                //tables

                //#1
                def tableOne1 = new Table(number:1).save()
                def activity1 = new Activity(service:vigoron, amount:2)
                def activity2 = new Activity(service:heineken, amount:3)
                def activity3 = new Activity(service:heineken, amount:6)

                tableOne1.addToActivities(activity1)
                tableOne1.addToActivities(activity2)
                tableOne1.addToActivities(activity3)

                //#1
                def tableOne2 = new Table(number:1, status:true, payment:700, change:20).save()
                def activity4 = new Activity(service:tostones, amount:1)
                def activity5 = new Activity(service:heineken, amount:5)

                tableOne2.addToActivities(activity4)
                tableOne2.addToActivities(activity5)


                //#1
                def tableOne3 = new Table(number:1, status:true, payment:150, change:30).save()
                def activity6 = new Activity(service:heineken, amount:1)

                tableOne3.addToActivities(activity6)

                //#4
                def tableFour = new Table(number:4).save()
                def activity7 = new Activity(service:tostones, amount:1)
                def activity8 = new Activity(service:heineken, amount:10)

                tableFour.addToActivities(activity7)
                tableFour.addToActivities(activity8)
            break
            case "production":
                TimeZone.setDefault(TimeZone.getTimeZone("UTC"))
            break
        }
    }
    def destroy = {
    }
}
