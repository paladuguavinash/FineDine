package dimesapp


class UserComments {
   
    String gender
    String serverName
    String comments
    Integer userRatings
    Date date
    
   static belongsTo=[user:User,restaurant:Restaurant]

   static constraints = {
       
                serverName nullable: true, maxSize:30
                gender inList:["Male","Female"]
              	comments nullable:true,maxsize:900
            		
    }
}
