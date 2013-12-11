import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class LogoutController {

    /**
     * Index action. Redirects to the Spring security logout uri.
     */
//        def index = {
////        // TODO put any pre-logout code here
//        session.invalidate()
//        //redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl // '/j_spring_security_logout'
        
                 
        
        def logout() {
            println "****************Logout*************"
            session.invalidate()
            render(view:"/logout.gsp")
        
	}
        def log() {
                println "****************Logout*************"
            render(view:"userComments/index")
        }
    }
