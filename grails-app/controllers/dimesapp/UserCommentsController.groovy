package dimesapp

import org.springframework.dao.DataIntegrityViolationException
import yelp.Yelp
import grails.converters.JSON
import dimesapp.Restaurant
import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.apache.catalina.authenticator.SavedRequest
@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class UserCommentsController {

    def springSecurityService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        println params
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
    
    //Note:Search accordingly to the given place and location.
   
    def findTerm(){
        println params
        def response   
        Yelp yelp=new Yelp('xwR1uqIewMijt9_2CjTr1A','lz-aMfK3QZKtR46t8_pPvMXhTh0','CW24XsRzJ-K-AwFtN-8Co1xw7gUfkJL9', 'eA6oE9USDqzTuUur9BuBK_Wdmmc')
        if(params.term && params.location)
        response=yelp.place(params.term,params.location,'20')
        if(params.term && !params.location)
        response=yelp.place(params.term,'20')
        if(!params.term && params.location)
        response=yelp.place(params.location,'20')
        response=JSON.parse(response)
        response= response.businesses
        def result=[]
        response.each{obj-> 
            println obj.categories[3]
            result.add([rating:obj.rating,id:obj.id,name:obj.name,address:obj.location.display_address[0],categories:obj.categories[0][0]])
        }
        render(view: "/secondPage.gsp",model:[result:result])
                
    }
    
    def restaurant(){
        print "******************COMMENTS*****************************"
        print  params
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
            //  print restaurant.errors
        }
        
        //  print "******************COMMENTS*****************************"
        // print restaurant.restaurantId
        
        def showComments= UserComments.createCriteria().list{
            createAlias("restaurant","res")        
            projections{
                property("comments")
                property("gender")
                property("date")               
                property("res.restaurantId")
                user{  
                    property("username")
                }
                property("userRatings")
            }
            eq("res.restaurantId",params.id)                  
        }
        int rating=0   
        println '******************'+showComments
        int avgRating
          
        def commentList=[]
        if(showComments){
            showComments.each{obj->
                rating=rating+obj[5].toInteger()          
            }             
            avgRating=(rating/showComments.size())
 
            showComments.each{obj->
                commentList.add(comments:obj[0],gender:obj[1],date:obj[2],restaurantId:obj[3],username:obj[4])
            }                                
        }
       
        result.add([id:params.Id,address:response.location.display_address[0],categories:response.categories[0][0],rating:response.rating,totalReviews:response.review_count,ratingImage:response.rating_img_url, snippet_text:response.snippet_text,phone:response.phone,Image:response.image_url,name:response.name])
        render(view: "/thirdPage.gsp",model:[result:result,resId:params.id,commentList:commentList,avgRating:avgRating,commentsCount:showComments.size()])       
    }
    //"This method returns restaurants located close to the user "
    def nearMe(){
        
        print "******************PARAMS*****************************"
        //println params
        if(params.latLng){
            def latitude=params.latLng.toString().split(',')[0]
            def longitude=params.latLng.toString().split(',')[1]
            Yelp yelp=new Yelp('xwR1uqIewMijt9_2CjTr1A','lz-aMfK3QZKtR46t8_pPvMXhTh0','CW24XsRzJ-K-AwFtN-8Co1xw7gUfkJL9', 'eA6oE9USDqzTuUur9BuBK_Wdmmc')              
            def response=yelp.near(latitude.toDouble(),longitude.toDouble())
            response=JSON.parse(response)       
            response= response.businesses
           // print"response is"+response
            def result=[] 
            response.each{obj->              
                result.add([id:obj.id,name:obj.name,address:obj.location.display_address[0],categories:obj.categories])       
            }   
            render (view:"/testNearMe.gsp",model:[result:result])
        }
    }
  
    //NOTE:
    //This method gives the flexibility for the user to write a review for a restaurant!!.
    def addReviews(){
        print "******************COMMENTS*****************************"
        println "Get the review parameters."+ params
        //       SavedRequest savedRequest = (SavedRequest)session.getAttribute(AbstractProcessingFilter.SPRING_SECURITY_SAVED_REQUEST_KEY);
        //        String requestUrl = savedRequest.getFullRequestUrl();
        //        print requestUrl
        print "******************COMMENTS*****************************"
        print session.SPRING_SECURITY_SAVED_REQUEST_KEY
        
        session.restaurant=params.id
        if(params.id)
        [restaurantId:params.id,userComments:new UserComments()]  
        else
        [restaurantId:session.restaurant,userComments:new UserComments()]  
    }
   
    //NOTE:
    //When the user enter's the comments it gets saved in the database.
    
    @Secured(['ROLE_USER'])
    def submit(){
        
        print "******************COMMENTS*****************************"
        print  session.SPRING_SECURITY_SAVED_REQUEST_KEY
        print "Here are the params what you looking for:"+  params
        
        UserComments userComments=new UserComments()
        userComments.restaurant=Restaurant.findByRestaurantId(params.restaurantId)
        userComments.user=springSecurityService.getCurrentUser()
        userComments.comments=params.comments
        userComments.serverName=params.servername
        userComments.userRatings=params.ratings.toInteger()
        userComments.gender=params.gender
        userComments.date=new Date()
        userComments.save(flush:true)
        
        print "******************COMMENTS*****************************"
        println "Check these error's"+userComments.errors
        
        def result=UserComments.createCriteria().list{
            createAlias("restaurant","res")
            projections{
                property("userRatings")                
            }
            eq("res.restaurantId",params.restaurantId)
        }
        
        print "******************COMMENTS*****************************"
        print "**********RESULT*************" +result
        
        double avgRating=0        
        result.each{obj->
            avgRating=avgRating+obj.toInteger()
        }
        avgRating=(avgRating/result.size())
        
        print "******************COMMENTS*****************************"
        print "Here is the avgerage Rating"+avgRating
        
        def restaurant=Restaurant.findByRestaurantId(params.restaurantId)
        restaurant.dimesRating=avgRating
        restaurant.save(flush:true)
        
        render(view: "/fourthPage.gsp",model:[comments:params.comments,ratings:params.ratings,gender:params.gender])
    }
    //"Method returns restuarants with highest number of ratings"    
    def hotSpots(){
        def ratings=Restaurant.listOrderByDimesRating(max: 10,order: "desc")
   
        print ratings
        def result=[] 
        ratings.each{obj->
            result.add(obj.name)  
        }
        render(view:"/hotSpots.gsp",model:[result:result])
    }
    
    //"This method returns restaurants with highest number of reviews"
    def topSpots(){
       
        def restaurantList=Restaurant.list()    
        def commentsList=UserComments.withCriteria{
            createAlias('restaurant', 'res')   
            projections{             
                count "id","comments"
                groupProperty("res.id")
                //groupProperty("res.name")
            }                                            
            order ("comments","desc")  
                
        }   
        println "***************commentList*********"+ commentsList           
        def comments=[]
        commentsList.each{obj->
            def res=Restaurant.get(obj[1])
            println res
            comments.add([name:res.name,comments:obj[0]])
        }        
        render(view:"/topSpots.gsp",model:[commentList:comments])
    }
    
    //"Calling this method takes you to a login page."    
    def userCredentials(){
        println params       
        render (view:"/userLogin.gsp")
    }
    
    //"Method for creating a new user"
    def newUser(){
        println "***************The params for creatting the user************"+params
        
        def role=Role.findByAuthority('ROLE_USER')?:new Role(authority:'ROLE_USER').save(flush:true)
        def user=User.findByUsername(params.userName)
        if(!user){ 
            user=new User()     
            user.fname=params.firstName
            user.lname=params.lastName
            user.username=params.userName
            user.password=params.password
            user.enabled=true
            user.save(flush:true)
            def userRole=UserRole.get(user.id,role.id)
            if(!userRole){
                userRole=new UserRole()
                userRole.create(user,role)
                userRole.save(flush:true)
                flash.message="user saved successfuly!!"
                render(view:"/newUSer.gsp")
            }
        }
        else{
            flash.message="username alredy exists!!"
            render(view:"/final.gsp")
        }
           
    }
}

