<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="${resource(dir:'css', file:'finedine.css')}" />
        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile.structure-1.3.2.min.css" />
        <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
        <script type="text/javascript" src="http://oauth.googlecode.com/svn/code/javascript/oauth.js"></script>
        <script type="text/javascript" src="http://oauth.googlecode.com/svn/code/javascript/sha1.js"></script>
        <script type="text/javascript" src="https://rawgithub.com/padolsey/prettyPrint.js/master/prettyprint.js"></script>

        <title>Sample title</title>
    </head>
    
    <body>
         <script src="${resource(dir:'js',file:'js.js')}"></script>         
            <form name="postForm" id="postForm" >
                <input type="button" name="postButton" id="postButton" value="GeoLocation" />
            </form>
<script>
$(document).ready(function() {
$('#postButton').click(function(){
$.ajax({
url : "/DimesApp/userComments/nearMe",
data : "ll=" + latLng,
cache : false,
success : function(data) {
$("#postLists").html(data);
}
});
});
});
      </script>
    </body>
</html>
