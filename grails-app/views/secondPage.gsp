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
        
         <ul>
            <g:each var="res" in="${result}">
                
                ${res.rating}
                 ${res.id}
                ${res.name}
                ${res.categories}
                ${res.address}
                
                    </g:each>
                </ul>

               
                                    </body>
                                </html>
