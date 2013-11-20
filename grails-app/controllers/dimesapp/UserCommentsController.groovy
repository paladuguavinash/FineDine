package dimesapp

import org.springframework.dao.DataIntegrityViolationException
import yelp.Yelp
import grails.converters.JSON
import dimesapp.Restaurant
import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured



class UserCommentsController {

    def springSecurityService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userCommentsInstanceList: UserComments.list(params), userCommentsInstanceTotal: UserComments.count()]
    }

    def create() {
        [userCommentsInstance: new UserComments(params)]
    }

    def save() {
        def userCommentsInstance = new UserComments(params)
        if (!userCommentsInstance.save(flush: true)) {
            render(view: "create", model: [userCommentsInstance: userCommentsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'userComments.label', default: 'UserComments'), userCommentsInstance.id])
        redirect(action: "show", id: userCommentsInstance.id)
    }

    def show(Long id) {
        def userCommentsInstance = UserComments.get(id)
        if (!userCommentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userComments.label', default: 'UserComments'), id])
            redirect(action: "list")
            return
        }

        [userCommentsInstance: userCommentsInstance]
    }

    def edit(Long id) {
        def userCommentsInstance = UserComments.get(id)
        if (!userCommentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userComments.label', default: 'UserComments'), id])
            redirect(action: "list")
            return
        }

        [userCommentsInstance: userCommentsInstance]
    }

    def update(Long id, Long version) {
        def userCommentsInstance = UserComments.get(id)
        if (!userCommentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userComments.label', default: 'UserComments'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userCommentsInstance.version > version) {
                userCommentsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'userComments.label', default: 'UserComments')] as Object[],
                          "Another user has updated this UserComments while you were editing")
                render(view: "edit", model: [userCommentsInstance: userCommentsInstance])
                return
            }
        }

        userCommentsInstance.properties = params

        if (!userCommentsInstance.save(flush: true)) {
            render(view: "edit", model: [userCommentsInstance: userCommentsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userComments.label', default: 'UserComments'), userCommentsInstance.id])
        redirect(action: "show", id: userCommentsInstance.id)
    }

    def delete(Long id) {
        def userCommentsInstance = UserComments.get(id)
        if (!userCommentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userComments.label', default: 'UserComments'), id])
            redirect(action: "list")
            return
        }

        try {
            userCommentsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userComments.label', default: 'UserComments'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userComments.label', default: 'UserComments'), id])
            redirect(action: "show", id: id)
        }
    }
    def search(){

        Yelp yelp = new Yelp('xwR1uqIewMijt9_2CjTr1A','lz-aMfK3QZKtR46t8_pPvMXhTh0','CW24XsRzJ-K-AwFtN-8Co1xw7gUfkJL9','eA6oE9USDqzTuUur9BuBK_Wdmmc')
        def response=yelp.search('yelp','3', 37.788022, -122.399797)
        render response
         
    }
    def searchBar(){

        Yelp yelp = new Yelp('xwR1uqIewMijt9_2CjTr1A','lz-aMfK3QZKtR46t8_pPvMXhTh0','CW24XsRzJ-K-AwFtN-8Co1xw7gUfkJL9', 'eA6oE9USDqzTuUur9BuBK_Wdmmc')
        def response=yelp.searchBar('yelp',0, 37.788022, -122.399797)
        render response        
    }
    def findTerm(){

        def response
            
        Yelp yelp=new Yelp('xwR1uqIewMijt9_2CjTr1A','lz-aMfK3QZKtR46t8_pPvMXhTh0','CW24XsRzJ-K-AwFtN-8Co1xw7gUfkJL9', 'eA6oE9USDqzTuUur9BuBK_Wdmmc')
        if(params.term && params.location)
        response=yelp.place(params.term,params.location,'20')
        if(params.term && !params.location)
        response=yelp.place(params.term,'20')
        if(!params.term && params.location)
        response=yelp.place(params.location,'20')

        response=JSON.parse(response)
        //print response.toString()
        response= response.businesses
        //print "@@@@@@@@@@@@@@@@@@@@@@@@@@" +response
        def result=[]
        response.each{obj->
               
            result.add([rating:obj.rating,id:obj.id,name:obj.name,address:obj.location.display_address,categories:obj.categories])
    
        }
  
        render(view: "/secondPage.gsp",model:[result:result])
                
    }

    def  location(){
        Yelp yelp=new Yelp('xwR1uqIewMijt9_2CjTr1A','lz-aMfK3QZKtR46t8_pPvMXhTh0','CW24XsRzJ-K-AwFtN-8Co1xw7gUfkJL9', 'eA6oE9USDqzTuUur9BuBK_Wdmmc')
        def response=yelp.location('calgary')
        response=JSON.parse(response)
        render response
    }

    def restaurant(){
        Yelp yelp=new Yelp('xwR1uqIewMijt9_2CjTr1A','lz-aMfK3QZKtR46t8_pPvMXhTh0','CW24XsRzJ-K-AwFtN-8Co1xw7gUfkJL9', 'eA6oE9USDqzTuUur9BuBK_Wdmmc')
        def response=yelp.loc(params.id)
            
        response=JSON.parse(response.toString())
        //print response
        def result=[]
        def restaurant=Restaurant.findByRestaurantId(params.id)
        if(!restaurant){
            restaurant=new Restaurant()
            restaurant.restaurantId=params.id
            restaurant.address=response.location.display_address
            restaurant.name=response.name
            
            restaurant.save(flush:true)
            print restaurant.errors
        }
               
            
        result.add([id:params.Id,address:response.location.display_address,categories:response.categories,rating:response.rating,totalReviews:response.review_count,ratingImage:response.rating_img_url, snippet_text:response.snippet_text,phone:response.phone,Image:response.image_url,name:response.name])
        render(view: "/thirdPage.gsp",model:[result:result,resId:params.id])
        //  return [result:result]
    }
    def nearMe(){
        Yelp yelp=new Yelp('xwR1uqIewMijt9_2CjTr1A','lz-aMfK3QZKtR46t8_pPvMXhTh0','CW24XsRzJ-K-AwFtN-8Co1xw7gUfkJL9', 'eA6oE9USDqzTuUur9BuBK_Wdmmc')
        def response=yelp.near("ll",",","distance","id")
        response=JSON.parse(response)
        return response
           
    }
    def rating(int count){
            
            
    }
    def reviews(String comment){
            
            
    }
    def reviewCount(int totReview){
            
    }
    def addReviews(){
            
        [restaurantId:params.id,userComments:new UserComments()]
            
            
    }
    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def submit(){
        print "*******************************"+ params
        UserComments userComments=new UserComments()
        userComments.restaurant=Restaurant.findByRestaurantId(params.restaurantId)
        userComments.comments=params.comments
        userComments.userRatings=params.ratings
        userComments.user=springSecurityService.getCurrentUser()
        userComments.gender=params.gender
        userComments.date=new Date()
        userComments.save(flush:true)
        print userComments.restaurant
        println "error"+userComments.errors
       // def response=userComments.save()
        
        render(view: "/fourthPage.gsp",model:[comments:params.comments,ratings:params.ratings,name:params.restaurantName,gender:params.gender])
    }
}

