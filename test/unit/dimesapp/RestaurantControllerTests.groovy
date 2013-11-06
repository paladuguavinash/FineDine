package dimesapp



import org.junit.*
import grails.test.mixin.*

@TestFor(RestaurantController)
@Mock(Restaurant)
class RestaurantControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/restaurant/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.restaurantInstanceList.size() == 0
        assert model.restaurantInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.restaurantInstance != null
    }

    void testSave() {
        controller.save()

        assert model.restaurantInstance != null
        assert view == '/restaurant/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/restaurant/show/1'
        assert controller.flash.message != null
        assert Restaurant.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/restaurant/list'

        populateValidParams(params)
        def restaurant = new Restaurant(params)

        assert restaurant.save() != null

        params.id = restaurant.id

        def model = controller.show()

        assert model.restaurantInstance == restaurant
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/restaurant/list'

        populateValidParams(params)
        def restaurant = new Restaurant(params)

        assert restaurant.save() != null

        params.id = restaurant.id

        def model = controller.edit()

        assert model.restaurantInstance == restaurant
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/restaurant/list'

        response.reset()

        populateValidParams(params)
        def restaurant = new Restaurant(params)

        assert restaurant.save() != null

        // test invalid parameters in update
        params.id = restaurant.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/restaurant/edit"
        assert model.restaurantInstance != null

        restaurant.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/restaurant/show/$restaurant.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        restaurant.clearErrors()

        populateValidParams(params)
        params.id = restaurant.id
        params.version = -1
        controller.update()

        assert view == "/restaurant/edit"
        assert model.restaurantInstance != null
        assert model.restaurantInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/restaurant/list'

        response.reset()

        populateValidParams(params)
        def restaurant = new Restaurant(params)

        assert restaurant.save() != null
        assert Restaurant.count() == 1

        params.id = restaurant.id

        controller.delete()

        assert Restaurant.count() == 0
        assert Restaurant.get(restaurant.id) == null
        assert response.redirectedUrl == '/restaurant/list'
    }
}
