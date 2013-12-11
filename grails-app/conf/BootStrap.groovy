import dimesapp.Role
import dimesapp.User
import dimesapp.UserRole

class BootStrap {
    def springSecurityService
    def init = { servletContext ->
    
//		def role1=new Role(authority:'ROLE_USER').save(flush:true)
//                def userRole=role.findByAuthority('ROLE_USER')?:new Role(authority:'ROLE_USER').save(flush:true)
//                def adminRole=role.findByAuthority('ROLE_USER')?:new Role(authority:'ROLE_USER').save(flush:true)
//		println " errors "+role1.errors
//		def user=new User(username:username,
//                    password:springSecurityService('password'),
//                    enabled:true).save(flush:true)
//                println  " "
//		if (!user.authorities.contains(userRole || adminRole)) {
//				UserRole.create user, role1
//		}                                                                                                                                                       

		
		}
		
    def destroy = {
    }
}


