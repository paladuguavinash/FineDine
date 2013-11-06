package dimesapp



import org.junit.*
import grails.test.mixin.*

@TestFor(UserCommentsController)
@Mock(UserComments)
class UserCommentsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/userComments/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userCommentsInstanceList.size() == 0
        assert model.userCommentsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.userCommentsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.userCommentsInstance != null
        assert view == '/userComments/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/userComments/show/1'
        assert controller.flash.message != null
        assert UserComments.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/userComments/list'

        populateValidParams(params)
        def userComments = new UserComments(params)

        assert userComments.save() != null

        params.id = userComments.id

        def model = controller.show()

        assert model.userCommentsInstance == userComments
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/userComments/list'

        populateValidParams(params)
        def userComments = new UserComments(params)

        assert userComments.save() != null

        params.id = userComments.id

        def model = controller.edit()

        assert model.userCommentsInstance == userComments
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/userComments/list'

        response.reset()

        populateValidParams(params)
        def userComments = new UserComments(params)

        assert userComments.save() != null

        // test invalid parameters in update
        params.id = userComments.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/userComments/edit"
        assert model.userCommentsInstance != null

        userComments.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/userComments/show/$userComments.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        userComments.clearErrors()

        populateValidParams(params)
        params.id = userComments.id
        params.version = -1
        controller.update()

        assert view == "/userComments/edit"
        assert model.userCommentsInstance != null
        assert model.userCommentsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/userComments/list'

        response.reset()

        populateValidParams(params)
        def userComments = new UserComments(params)

        assert userComments.save() != null
        assert UserComments.count() == 1

        params.id = userComments.id

        controller.delete()

        assert UserComments.count() == 0
        assert UserComments.get(userComments.id) == null
        assert response.redirectedUrl == '/userComments/list'
    }
}
