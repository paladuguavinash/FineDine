<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sample title</title>
    </head>
    <body>
        <g:link controller="userComments" action="addReviews" params="[id:resId]">Add Review</g:link>
        <g:each var="res" in="${result}">
        <li> 
            Name: ${res. name}</br>
            Address:${res.address}</br>
            Categories:${res.categories}</br>
            Yelp's Rating:${res.rating}</br>
            User's Review:${res.totalReviews}</br>
            Comments:${res. snippet_text}</br>
            Phone:${res.phone}</br>
            Image:${res. image_url}
        </li>
        
    </g:each>
         Average Rating:${avgRating}</br> </br>
         Total Reviews:${commentsCount}
       
        <div>User Reviews
         <g:each var="comment" in="${commentList}">
    <li> 
           
            Comments:${comment.comments}</br>
            gender:${comment.gender}</br>
            date:${comment.date}</br>
            Restaurant Id:${comment.restaurantId}</br>
            username:${comment.username}
            
    </g:each>
    
    
    </div>
</body>
</html>
