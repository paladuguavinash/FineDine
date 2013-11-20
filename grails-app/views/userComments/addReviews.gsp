<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
    <rateable:resources/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
</head>
<body>
    <g:form controller="userComments" action="submit" method="post">

                 <g:hiddenField name="restaurantId" id="restaurantId" value="${restaurantId}"/>
                 
        Gender:<g:select name='gender' from='${['Male','Female']}'  id='gender' value='${gender}' noSelection="['':'Gender']"/>
        Comments:<g:textField name='comments' value='${comment}' id='comments' /></br></br>
        Ratings:<g:select name='ratings' from='${1..5}'  id='rating' value='${rating}' noSelection="['':'Give you Rating']"/>
        <sec:ifNotLoggedIn>
        <g:link controller='login' action='auth'>Login</g:link>
        </sec:ifNotLoggedIn>
        
        <sec:ifLoggedIn><g:submitButton name="submit" value="submit"

                         onclick="if(this.parentNode.parentNode.checkValidity()) {
                                    ${remoteFunction(controller:'userComments',
                                        action: 'submit',
                                        params:'\'comments=\' + $(\'#comments\').val()'+'\'restaurantId=\'+ $(\'#restaurantId\').val()'+'\'rating=\'+ $(\'#rating\').val()'+'\'gender=\'+ $(\'#gender\').val()',
                                        onSuccess: '$("#response")',
                                        onFailure: 'alert("hey did forget something!!!")')}
                                        return false;
                                            };"/>
                                    </sec:ifLoggedIn>
                    </g:form>
            </body>
    </html>
