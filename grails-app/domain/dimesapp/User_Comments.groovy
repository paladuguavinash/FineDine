package dimesapp


class User_Comments {
    
    String restaurantId
    String gender
    String serverName
    String comments
    Integer ratings
    Date date
    
   static belongsTo=[user:User]

   static constraints = {
		restaurantId nullable: false, maxSize: 65
                serverName nullable: true, maxSize:30
                gender inList:["Male","Female"]
              	comments nullable:true,maxsize:900
            		
    }
}
