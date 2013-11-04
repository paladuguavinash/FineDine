import dimesapp.Role
import dimesapp.User
import dimesapp.UserRole

class BootStrap {

    def init = { servletContext ->
    
		def role1=new Role(authority:'ROLE_USER').save(flush:true)
		println " errors "+role1.errors
		def user=new User(username:'db2',password:'db2',enabled:true).save(flush:true)
                println  " "
		if (!user.authorities.contains(role1)) {
				UserRole.create user, role1
		}

		
		}
		
    def destroy = {
    }
}


