package dimesapp



import org.junit.*
import grails.test.mixin.*

@TestFor(User_CommentsController)
@Mock(User_Comments)
class User_CommentsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/user_Comments/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.user_CommentsInstanceList.size() == 0
        assert model.user_CommentsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.user_CommentsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.user_CommentsInstance != null
        assert view == '/user_Comments/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/user_Comments/show/1'
        assert controller.flash.message != null
        assert User_Comments.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/user_Comments/list'

        populateValidParams(params)
        def user_Comments = new User_Comments(params)

        assert user_Comments.save() != null

        params.id = user_Comments.id

        def model = controller.show()

        assert model.user_CommentsInstance == user_Comments
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/user_Comments/list'

        populateValidParams(params)
        def user_Comments = new User_Comments(params)

        assert user_Comments.save() != null

        params.id = user_Comments.id

        def model = controller.edit()

        assert model.user_CommentsInstance == user_Comments
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/user_Comments/list'

        response.reset()

        populateValidParams(params)
        def user_Comments = new User_Comments(params)

        assert user_Comments.save() != null

        // test invalid parameters in update
        params.id = user_Comments.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/user_Comments/edit"
        assert model.user_CommentsInstance != null

        user_Comments.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/user_Comments/show/$user_Comments.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        user_Comments.clearErrors()

        populateValidParams(params)
        params.id = user_Comments.id
        params.version = -1
        controller.update()

        assert view == "/user_Comments/edit"
        assert model.user_CommentsInstance != null
        assert model.user_CommentsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/user_Comments/list'

        response.reset()

        populateValidParams(params)
        def user_Comments = new User_Comments(params)

        assert user_Comments.save() != null
        assert User_Comments.count() == 1

        params.id = user_Comments.id

        controller.delete()

        assert User_Comments.count() == 0
        assert User_Comments.get(user_Comments.id) == null
        assert response.redirectedUrl == '/user_Comments/list'
    }
}
