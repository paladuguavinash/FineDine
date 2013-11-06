package dimesapp

class Restaurant {
    
    String restaurantId
    String name
    String address
    Integer rating

    static hasMany=[comments:UserComments]
    
    static constraints = {
        
        restaurantId nullable:false,blank:false
        name nullable:false,blank:false
        address nullable:false,blank:false
        rating  nullable:false,blank:false
        
        
    }
}
