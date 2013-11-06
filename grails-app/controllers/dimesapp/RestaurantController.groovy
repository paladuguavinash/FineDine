package dimesapp

import org.springframework.dao.DataIntegrityViolationException

class RestaurantController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [restaurantInstanceList: Restaurant.list(params), restaurantInstanceTotal: Restaurant.count()]
    }

    def create() {
        [restaurantInstance: new Restaurant(params)]
    }

    def save() {
        def restaurantInstance = new Restaurant(params)
        if (!restaurantInstance.save(flush: true)) {
            render(view: "create", model: [restaurantInstance: restaurantInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'restaurant.label', default: 'Restaurant'), restaurantInstance.id])
        redirect(action: "show", id: restaurantInstance.id)
    }

    def show(Long id) {
        def restaurantInstance = Restaurant.get(id)
        if (!restaurantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'restaurant.label', default: 'Restaurant'), id])
            redirect(action: "list")
            return
        }

        [restaurantInstance: restaurantInstance]
    }

    def edit(Long id) {
        def restaurantInstance = Restaurant.get(id)
        if (!restaurantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'restaurant.label', default: 'Restaurant'), id])
            redirect(action: "list")
            return
        }

        [restaurantInstance: restaurantInstance]
    }

    def update(Long id, Long version) {
        def restaurantInstance = Restaurant.get(id)
        if (!restaurantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'restaurant.label', default: 'Restaurant'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (restaurantInstance.version > version) {
                restaurantInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'restaurant.label', default: 'Restaurant')] as Object[],
                          "Another user has updated this Restaurant while you were editing")
                render(view: "edit", model: [restaurantInstance: restaurantInstance])
                return
            }
        }

        restaurantInstance.properties = params

        if (!restaurantInstance.save(flush: true)) {
            render(view: "edit", model: [restaurantInstance: restaurantInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'restaurant.label', default: 'Restaurant'), restaurantInstance.id])
        redirect(action: "show", id: restaurantInstance.id)
    }

    def delete(Long id) {
        def restaurantInstance = Restaurant.get(id)
        if (!restaurantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'restaurant.label', default: 'Restaurant'), id])
            redirect(action: "list")
            return
        }

        try {
            restaurantInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'restaurant.label', default: 'Restaurant'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'restaurant.label', default: 'Restaurant'), id])
            redirect(action: "show", id: id)
        }
    }
}
