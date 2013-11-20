<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

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
           Name: <p>${res. name}</p></br>
           Address:<p>${res.address}</p></br>
           Categories:<p>${res.categories}</p></br>
            Yelp's Rating:<p>${res.rating}</p></br>
            User's Review<p>${res.totalReviews}</p></br>
           Comments:<p>${res. snippet_text}</p></br>
            Phone:<p>${res.phone}</p></br>
           Image: <p>${res. image_url}</p>
            
           
            
        </li>
    </g:each>
</body>
</html>
