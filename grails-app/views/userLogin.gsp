<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>  
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
</head>
<body>
    
    <g:form controller="userComments" action="newUser" method="post">

        
        First Name:<g:textField name='firstName' id='firstName' value='${firstName}'/></br></br>
       	Last Name:<g:textField name='lastName' id='lastName' value='${lastName}'/></br></br>
        UserName:<g:textField name='userName' id='userName' value='${userName}'/></br></br>
      	Password:<input type='password' name='password' id='password' value='${password}'/></br></br>
  
   <g:submitButton name="submit" value="create"

            onclick="if(this.parentNode.parentNode.checkValidity()) {
                         ${remoteFunction(controller:'userComments',
                           action: 'newUser',
                           params:'\'firstName=\' + $(\'#firstName\').val()'+'\'lastName=\'+ $(\'#lastName\').val()'+'\'userName=\'+ $(\'#userName\').val()'+'\'password=\'+ $(\'#password\').val()'+'\'servername=\'+ $(\'#serverName\').val()',
                           onSuccess: '$("#response")',
                           onFailure: 'alert("hey did forget something!!!")')}
                           return false;
                           };"/>
    
</g:form>
</body>
</html>
