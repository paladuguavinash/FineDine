package dimesapp

import org.springframework.dao.DataIntegrityViolationException
import yelp.Yelp
import grails.converters.JSON

import org.springframework.dao.DataIntegrityViolationException

class UserCommentsController {

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

        //println params
//         def term=param.list("term")
//         def limit=param.list("limit")
//         def latitude=param.list("latitude")
//         def longitude=param.list("longitude")
            Yelp yelp = new Yelp('xwR1uqIewMijt9_2CjTr1A','lz-aMfK3QZKtR46t8_pPvMXhTh0','CW24XsRzJ-K-AwFtN-8Co1xw7gUfkJL9','eA6oE9USDqzTuUur9BuBK_Wdmmc')
            def response=yelp.search('yelp','3', 37.788022, -122.399797)
                render response
           // [data:response]

           // JASON.use(yelp)

        }
     def searchBar(){

      //   def term=param.list("term")
//         def sort=param.list("sort")
//         def latitude=param.list("latitude")
//         def lpongitude=param.list("longitude")
        Yelp yelp = new Yelp('xwR1uqIewMijt9_2CjTr1A','lz-aMfK3QZKtR46t8_pPvMXhTh0','CW24XsRzJ-K-AwFtN-8Co1xw7gUfkJL9', 'eA6oE9USDqzTuUur9BuBK_Wdmmc')
        def response=yelp.searchBar('yelp',0, 37.788022, -122.399797)
            render response
            //[find:response]
            }

	def findTerm(){
		print '*******************************************'
		println params
		def response
		// def term=params.list('term')
		// print term
		// def location=params.list('location')
		// print location
		Yelp yelp=new Yelp('xwR1uqIewMijt9_2CjTr1A','lz-aMfK3QZKtR46t8_pPvMXhTh0','CW24XsRzJ-K-AwFtN-8Co1xw7gUfkJL9', 'eA6oE9USDqzTuUur9BuBK_Wdmmc')
		if(params.term && params.location)
		response=yelp.place(params.term,params.location,'3')
		if(params.term && !params.location)
		response=yelp.place(params.term,'3')
		if(!params.term && params.location)
		response=yelp.place(params.location,'3')

		response=JSON.parse(response)
		print response
		print response

		print '****************address**********************************'

		print response.businesses.location.display_address

		print '****************id**********************************'
		print response.businesses.id


		print '****************rating**********************************'
		print response.businesses.rating_img_url_large
		// print '********************************** the adder
		// return response
		print response.businesses.categories
		print response.businesses.rating
		render(view: "index",model:[address:response.businesses.location.display_address,id:response.businesses.id,ratingImage:response.businesses.rating_img_url_large,count:response.businesses.review_count,categories:response.businesses.categories,rating:response.businesses.rating])

	}
}

//    def  location(){
//         Yelp yelp=new Yelp('xwR1uqIewMijt9_2CjTr1A','lz-aMfK3QZKtR46t8_pPvMXhTh0','CW24XsRzJ-K-AwFtN-8Co1xw7gUfkJL9', 'eA6oE9USDqzTuUur9BuBK_Wdmmc')
//          def response=yelp.place('calgary','3')
//          response=JSON.parse(response)
//          render response
//
//    }
//    def term(){
//        Yelp yelp=new Yelp('xwR1uqIewMijt9_2CjTr1A','lz-aMfK3QZKtR46t8_pPvMXhTh0','CW24XsRzJ-K-AwFtN-8Co1xw7gUfkJL9', 'eA6oE9USDqzTuUur9BuBK_Wdmmc')
//          def response=yelp.place('yelp','3')
//          response=JSON.parse(response)
//          render response
//
//    }
//    def response(){
//
//         // def term=param.list('find')
//          //def location=param.list('location')
//         if(param.term && param.location){
//             redirect(action:"findTerm")
//         }else if(param.term && !param.location){
//             redirect(action:"term")
//          }else{
//            redirect(action:"location")
//       }
   //render(view: "simpleSearchResults", model: [individuals: inds,groups: grps,firms: frms])