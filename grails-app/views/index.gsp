
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Dimes Server Reviews</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width">
		<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
		<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
		<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
		<script type="text/javascript" src="http://oauth.googlecode.com/svn/code/javascript/oauth.js"></script>
		<script type="text/javascript" src="http://oauth.googlecode.com/svn/code/javascript/sha1.js"></script>
		<script type="text/javascript" src="https://rawgithub.com/padolsey/prettyPrint.js/master/prettyprint.js"></script>
		<g:javascript src="js.js" />
		<!-- Custom overwrite spreadsheet-->
		<link rel="stylesheet" href="${resource(dir:'css', file:'style.css')}">
	</head>
	<body>
		<!-- Home Page-->
		<div data-role="page" id="home" data-theme="c">
			<div data-role="panel" id="searchPanel" data-theme="c" data-display="overlay" data-position="left">
			    <!--Search Panel-->
				<h2>Search</h2>
				<g:form controller="userComments" action="findTerm" >
					<label for="search-terms">Terms:</label>
					<input type="search" name="term" id="search-terms" placeholder="Examples: Earls, JOEY, CHOP">
					<label for="search-location">Near:</label>
					<input type="search" name="location" id="search-location" placeholder="Example: Calgary">
					<g:submitButton name="submit" value="Search" />
				</g:form>
			</div><!--/panel-->
		    <!-- Settings Panel-->
			<div data-role="panel" id="settings" data-theme="c" data-display="overlay" data-position="right">
				<h2>Settings</h2>
				<form method="post" action="">
					<fieldset data-role="fieldcontain">
						<br><label for="name">Name (optional)</label>
						<br><input type="text" name="name" id="name">
						<br><label for="name">Email Address (optional)</label>
						<br><input type="text" name="email" id="email">
					</fieldset>
					<fieldset data-role="controlgroup" data-type="horizontal">
						<legend>I want ratings for...</legend>
						<label for="male">Male</label>
						<input type="radio" name="gender" id="male" value="male">
						<label for="female">Female</label>
						<input type="radio" name="gender" id="female" value="female">
						<label for="both">Both</label>
						<input type="radio" name="gender" id="both" value="both">
					</fieldset>
					<input type="submit" value="Save Changes" data-inline="true" data-icon="check" style="margin: 0 auto;" onclick="alert('Changes saved.')">
				</form>
			</div>
			<div data-role="header" data-id="main" data-position="fixed" data-theme="c">
				<h1>Dimes</h1>
				<a href="#settings" data-role="button" data-icon="gear" data-transition="slide" class="ui-btn-right">Settings</a>
			</div>
			<div data-role="content" >
				<label for="search-basic" class="ui-hidden-accessible">Search Input:</label>
				<input type="search" name="search" id="search-basic" placeholder="Search">
				<div data-role="navbar" >
					<ul>
						<li><a href="#near" data-icon="dimes-google_maps" data-transition="slide">Near Me</a></li>
						<li><a href="#browse" data-icon="dimes-list" data-transition="slide">Browse</a></li>
						<li><a href="#" data-icon="dimes-fire">Hot Spots</a></li>
						<li><a href="#" data-icon="dimes-podium">Highest <br>Rated</a></li>
						<li><a href="#" data-icon="dimes-heart">Spot of <br>the Week</a></li>
						<li><a href="#" data-icon="dimes-star">Featured</a></li>
					</ul>
				</div>
			</div>
			<div data-id="main" data-role="footer" data-position="fixed" data-theme="c">
				<h1>Advertisement</h1>
			</div>
		</div>

		<!-- Near me page -->
		<div data-role="page" id="near" data-theme="c">
			<div data-role="header" data-id="main" data-position="fixed" data-theme="c">
				<a href="#home" data-role="button" data-icon="home" data-transition="slide" data-direction="reverse">Home</a>
				<h1>Dimes</h1>
				<a href="#settings" data-role="button" data-icon="gear" data-transition="slide">Settings</a>
			</div>
			<div data-role="content" id="near-results">
				<h2>Spots near me</h2>
				<!-- Near Output data from yelp -->
			</div>
			<div data-id="main" data-role="footer" data-position="fixed" data-theme="c">
				<h1>Advertisement</h1>
			</div>
		</div>

		<!-- Browse page -->
		<div data-role="page" id="browse" data-theme="c">
			<div data-role="header" data-id="main" data-position="fixed" data-theme="c">
				<a href="#home" data-role="button" data-icon="home" data-transition="slide" data-direction="reverse">Home</a>
				<h1>Dimes</h1>
				<a href="#settings" data-role="button" data-icon="gear" data-transition="slide">Settings</a>
			</div>
			<div data-role="content" data-theme="c">
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
			<div data-id="main" data-role="footer" data-position="fixed" data-theme="c">
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