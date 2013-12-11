
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Dimes Server Reviews</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="${resource(dir:'css', file:'finedine.css')}" />
        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile.structure-1.3.2.min.css" />
        <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
        <script type="text/javascript" src="http://oauth.googlecode.com/svn/code/javascript/oauth.js"></script>
        <script type="text/javascript" src="http://oauth.googlecode.com/svn/code/javascript/sha1.js"></script>
        <script type="text/javascript" src="https://rawgithub.com/padolsey/prettyPrint.js/master/prettyprint.js"></script>
        <script src="${resource(dir:'js',file:'js.js')}"></script>   
        <script type="text/javascript">
            $(document).ready(function() { 
            $('#buttonid').click(function(){ 
            document.getElementById('geo').value=latLng;

            });});

        </script>


  <!-- Custom overwrite spreadsheet-->
        <link rel="stylesheet" href="${resource(dir:'css', file:'style.css')}" />
    </head>
    <body>
        <div data-role="page" id="home" data-theme="a">
            <div data-role="panel" id="searchPanel" data-theme="a" data-display="overlay" data-position="left" >
                    <!--Search Panel-->
                <div data-role="header" data-position="fixed" data-theme="a">
                    <a href="#main" data-rel="close" data-role="button" data-icon="back" data-iconpos="notext">Close Panel</a>
                    <h1>Search</h1>
                </div>
                <br><br>
                <g:form controller="userComments" action="findTerm" name="userResponse" >
                    <label for="search-terms" >Search For:</label>
                    <input data-theme="b" type="search" name="term" id="search-terms" placeholder="Examples: Earls, JOEY, CHOP" data-theme="c">
                    <label for="search-location">Near:</label>
                    <input data-theme="b" type="search" name="location" id="search-location" placeholder="Example: Calgary" data-theme="c">
                    <g:submitButton name="submit" value="Search"
                        onclick="if(this.parentNode.parentNode.checkValidity()) {
                    ${remoteFunction(controller:'userComments',
action: 'findTerm',
params:'\'location=\' + $(\'#search-location\').val()'+'\'term=\' + $(\'#search-terms\').val()'
                               
)}

                        };"/>
                </g:form> 

            </div><!--/panel-->
        <!-- Settings Panel-->

            <div>

                <g:link controller='logout' action='logout'><font face="verdana">Logout!</font></g:link>

            </div>

            <div data-role="panel" id="settings" data-theme="a" data-display="overlay" data-position="right">
                <div data-role="header" data-theme="a" data-position="fixed" >
                    <a href="#main" data-rel="close" data-role="button" data-icon="back" data-iconpos="notext" >Close Panel</a>
                    <h1>Settings</h1>
                </div>

            </div>
            <div data-role="header" data-id="main" data-position="fixed" data-theme="a">
                <img src="${resource(dir:'images',file:'FineDine.png')}" alt="topSpots">
                <a href="#settings" data-role="button" data-icon="gear" data-transition="slide" class="ui-btn-right" data-iconpos="notext">Settings</a>
            </div>
            <div data-role="content" >
                <label for="search-basic" class="ui-hidden-accessible">Search Input:</label>
                <input type="search" name="search" id="search-basic" placeholder="Search" data-theme="b">
                <!--
                <div data-role="navbar" >
                        <ul>
                                <li><a href="#near" data-icon="dimes-google_maps" data-transition="slide">Near Me</a></li>
                                <li><a href="#browse" data-icon="dimes-list" data-transition="slide">Browse</a></li>
                                <li><a href="#" data-icon="dimes-fire" data-theme="a">Hot Spots</a></li>
                                <li><a href="#" data-icon="dimes-podium">Highest <br>Rated</a></li>
                                <li><a href="#" data-icon="dimes-heart">Spot of <br>the Week</a></li>
                                <li><a href="#" data-icon="dimes-star">Featured</a></li>
                        </ul>
                </div>
                -->

                <g:form id="nearMe" controller="userComments" action="nearMe"  method="post">
                    <g:hiddenField name="latLng" id="geo" value="${latLng}"/>
                    <g:submitButton name="button" value="NearMe" id="buttonid" />
                </g:form>

                <g:form id="geoLocation" controller="userComments" action="hotSpots"  method="get">
                    <g:submitButton name="button" value="HotSpots" id="hotSpots" />
                </g:form>

                <g:form id="geoLocation" controller="userComments" action="topSpots"  method="get">
                    <g:submitButton name="button" value="TopSpots" id="topSpots" />
                </g:form>

                <div style="margin:0;">
                    <a href="#browse" data-transition="slide">
                        <div class="homeButton">
                            <img src="${resource(dir:'images',file:'browse.png')}" alt="Browse" style="position:relative;">
                        </div>
                    </a>
                    <a href="#" data-transition="slide">
                        <div class="homeButton">
                            <img src="${resource(dir:'images',file:'hotSpots.png')}" alt="Hot Spots" style="position:relative;">
                        </div>
                    </a>
                    <a href="#" data-transition="slide">
                        <div class="homeButton">
                            <img src="${resource(dir:'images',file:'topSpots.png')}" alt="topSpots" style="position:relative;">
                        </div>
                    </a>
                    <a href="#" data-transition="slide">
                        <div class="homeButton">
                            <img src="${resource(dir:'images',file:'weeklySpot.png')}" alt="weeklySpot.png" style="position:relative;">
                        </div>
                    </a>
                    <a href="#" data-transition="slide">
                        <div class="homeButton">
                            <img src="${resource(dir:'images',file:'featured.png')}" alt="Featured" style="position:relative;">
                        </div>
                    </a>

                </div>
            </div>
            <div data-id="main" data-role="footer" data-position="fixed" data-theme="a">
                <h1>Advertisement</h1>
            </div>
        </div>

                <!-- Near me page -->
        <div data-role="page" id="near" data-theme="a">
            <div data-role="header" data-id="main" data-position="fixed" data-theme="a">
                <a href="#home" data-role="button" data-icon="home" data-transition="slide" data-direction="reverse" data-iconpos="notext">Home</a>
                <img src="${resource(dir:'images',file:'FineDine.png')}" alt="topSpots">
                <a href="#settings" data-role="button" data-icon="gear" data-transition="slide" data-iconpos="notext">Settings</a>
            </div>
            <div data-role="content" id="near-results">
                <h2>Spots near me</h2>
                <!-- Near Output data from yelp -->
            </div>
            <div data-id="main" data-role="footer" data-position="fixed" data-theme="a">
                <h1>Advertisement</h1>
            </div>
        </div>

                <!-- Browse page -->
        <div data-role="page" id="browse" data-theme="a">
            <div data-role="header" data-id="main" data-position="fixed" data-theme="a">
                <a href="#home" data-role="button" data-icon="home" data-transition="slide" data-direction="reverse" data-iconpos="notext">Home</a>
                <h1>FineDine</h1>
                <a href="#settings" data-role="button" data-icon="gear" data-transition="slide" data-iconpos="notext">Settings</a>
            </div>
            <div data-role="content" data-theme="a">
                <ul data-role="listview" data-filter="true" data-filter-placeholder="Search for Spots">
                    <li>
                        <a href="${resource(file:'example')}" data-transition="slide">
                            <h2>CHOP Chinook</h2>
                            <p>Rating - Number of Reviews</p>
                            <p>Address</p>
                            <p>Category?</p>
                        </a>
                    </li>
                    <li><a href="#">Earls Calgary 16th Avenue</a></li>
                    <li><a href="#">Earls Calgary Dalhousie</a></li>
                    <li><a href="#">JOEY Barlow</a></li>
                    <li><a href="#">JOEY Barlow</a></li>
                    <li><a href="#">JOEY Barlow</a></li>
                    <li><a href="#">JOEY Chinook</a></li>
                    <li><a href="#">JOEY Crowfoot</a></li>
                    <li><a href="#">JOEY Eau Claire</a></li>
                    <li><a href="#">MacDonald's</a></li>
                    <li><a href="#">Tony Roma's</a></li>
                </ul>
            </div>
            <div data-id="main" data-role="footer" data-position="fixed" data-theme="a">
                <h1>Advertisement</h1>
            </div>
        </div>
        <script>
            $(document).ready(function() {
            $("#search-basic").on("click", function() {
            $( "#searchPanel" ).panel( "open");
            });
            });
        </script>
    </body>
</html>
<!--
TODO:
Check-ins (Yelp)
Friends (where they've been, ratings)
recently reviewed
website for sneakpeak subscribe stuff
aws - 
-->
