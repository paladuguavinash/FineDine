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
    
    <g:form controller="userComments" action="submit" method="post">

        <g:hiddenField name="restaurantId" id="restaurantId" value="${restaurantId}"/>

        Gender:<g:select name='gender' from='${['Male','Female']}'  id='gender' value='${gender}' noSelection="['':'Gender']"/></br></br>
        Comments:<g:textArea name='comments' value='${comment}' id='comments' /></br></br>
        Ratings:<g:select name='ratings' from='${1..5}'  id='rating' value='${rating}' noSelection="['':'Give you Rating']"/></br></br>
        Server Name(Optional):<g:textField name='servername' value='${serverName}' id='serverName' /></br></br>
        
    <sec:ifNotLoggedIn>
        <g:link controller='login' action='index'>Login</g:link>
        <g:link controller='userComments' action='userCredentials'>NewUser</g:link>
    </sec:ifNotLoggedIn>

    <sec:ifLoggedIn><g:submitButton name="submit" value="submit"

            onclick="if(this.parentNode.parentNode.checkValidity()) {
                         ${remoteFunction(controller:'userComments',
                           action: 'submit',
                           params:'\'comments=\' + $(\'#comments\').val()'+'\'restaurantId=\'+ $(\'#restaurantId\').val()'+'\'rating=\'+ $(\'#rating\').val()'+'\'gender=\'+ $(\'#gender\').val()'+'\'servername=\'+ $(\'#serverName\').val()',
                           onSuccess: '$("#response")',
                           onFailure: 'alert("hey did forget something!!!")')}
                           return false;
                           };"/>
    </sec:ifLoggedIn>
</g:form>
</body>
</html>
