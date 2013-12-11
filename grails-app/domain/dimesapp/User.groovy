package dimesapp

class User {

	transient springSecurityService

	String username
	String password
        String fname
        String lname
       // String email
        //String gender
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password blank: false
                fname blank:false, unique:false
                lname blank:false,unique:false
               // email blank:false,unique:true
               // gender inList:["Male","FEMALE","BOTH"]
	}       

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
