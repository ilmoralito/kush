package ni.com.bar

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class ActivityController {

	static defaultAction = "show"
	static allowedMethods = [
		show:"GET",
		update:"POST",
		delete:"GET"
	]

	def show(Long id) {
		def activity = Activity.get(id)

        if (!activity) {
            response.sendError 404
        }

        [activity:activity]
	}

	def update(Long id, Integer number) {
		def activity = Activity.get(id)

        if (!activity) {
            response.sendError 404
        }

        activity.properties = params

        if (!activity.save()) {
        	render view:"show", model:[activity:activity, id:id, number:number]
        	return
        }

        flash.message = "Servicio actualizado"
        redirect action:"show", params:[id:id, number:number]
	}

    def delete(Long id, Integer number) {
        def activity = Activity.get(id)

        if (!activity) {
            response.sendError 404
        }

        activity.delete()

        flash.message = "Servicio eliminado!"
        redirect controller:"table", action:"create", params:[number:number]
    }
}
