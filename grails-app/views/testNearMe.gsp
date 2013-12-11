
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Near Me</title>
    </head>
    <body>

        <g:each var="res" in="${result}">
        <li> 
            <g:link  controller="userComments" action="restaurant" params="[id:res.id]"> 
                <p>id:${res.id}</p>
            </g:link>
            <p> Name: ${res. name}</p>
            <p>Address:${res.address}</p>
            Categories:${res.categories}

        </li>
    </g:each>
</body>
</html>
