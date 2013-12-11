class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
                //"/"(view:"userComments/index3")
		"/"(view:"userComments/index")
		"/index2" (view:"/index2")
		"/secondPage" (view:"/secondPage")
                "/nearBy"(view:"/nearBy")
		"500"(view:'/error')
		"/example" (view:"example")
                "/login/$action?"(controller: "login")
                "/logout/$action?"(controller: "logout")
    
//            "/user/$action?" (controller:"userComments")
//            "/admin/$action?" (controller:"userComments")
//
//            "500"(controller:"error", action:"show1")
//            "404"(controller:"error", action:"show1")
	}
}
