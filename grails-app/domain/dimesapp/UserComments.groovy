package dimesapp
import org.grails.rateable.*
class UserComments implements Rateable{

    String gender
    String serverName
    String comments
    Integer userRatings
    Date date
    //ToDo
    //String restaurentId
   static belongsTo=[user:User,restaurant:Restaurant]

   static constraints = {
       
                serverName nullable: true, maxSize:30
                gender inList:["Male","Female"]
              	comments nullable:true,maxsize:900
                 // <rateable:resources/>  
                 //<rateable:ratings bean='${restaurant}'/
                
    }
}
