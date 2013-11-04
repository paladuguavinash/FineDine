package dimesapp

import org.springframework.dao.DataIntegrityViolationException

class User_CommentsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [user_CommentsInstanceList: User_Comments.list(params), user_CommentsInstanceTotal: User_Comments.count()]
    }

    def create() {
        [user_CommentsInstance: new User_Comments(params)]
    }

    def save() {
        def user_CommentsInstance = new User_Comments(params)
        if (!user_CommentsInstance.save(flush: true)) {
            render(view: "create", model: [user_CommentsInstance: user_CommentsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user_Comments.label', default: 'User_Comments'), user_CommentsInstance.id])
        redirect(action: "show", id: user_CommentsInstance.id)
    }

    def show(Long id) {
        def user_CommentsInstance = User_Comments.get(id)
        if (!user_CommentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user_Comments.label', default: 'User_Comments'), id])
            redirect(action: "list")
            return
        }

        [user_CommentsInstance: user_CommentsInstance]
    }

    def edit(Long id) {
        def user_CommentsInstance = User_Comments.get(id)
        if (!user_CommentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user_Comments.label', default: 'User_Comments'), id])
            redirect(action: "list")
            return
        }

        [user_CommentsInstance: user_CommentsInstance]
    }

    def update(Long id, Long version) {
        def user_CommentsInstance = User_Comments.get(id)
        if (!user_CommentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user_Comments.label', default: 'User_Comments'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (user_CommentsInstance.version > version) {
                user_CommentsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user_Comments.label', default: 'User_Comments')] as Object[],
                          "Another user has updated this User_Comments while you were editing")
                render(view: "edit", model: [user_CommentsInstance: user_CommentsInstance])
                return
            }
        }

        user_CommentsInstance.properties = params

        if (!user_CommentsInstance.save(flush: true)) {
            render(view: "edit", model: [user_CommentsInstance: user_CommentsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user_Comments.label', default: 'User_Comments'), user_CommentsInstance.id])
        redirect(action: "show", id: user_CommentsInstance.id)
    }

    def delete(Long id) {
        def user_CommentsInstance = User_Comments.get(id)
        if (!user_CommentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user_Comments.label', default: 'User_Comments'), id])
            redirect(action: "list")
            return
        }

        try {
            user_CommentsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user_Comments.label', default: 'User_Comments'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user_Comments.label', default: 'User_Comments'), id])
            redirect(action: "show", id: id)
        }
    }
}
