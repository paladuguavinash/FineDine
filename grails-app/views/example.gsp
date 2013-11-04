<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Dimes Server Reviews</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width">
		<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
		<link rel="stylesheet" href="style.css">
		<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
		<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
		<script type="text/javascript" src="http://oauth.googlecode.com/svn/code/javascript/oauth.js"></script>
		<script type="text/javascript" src="http://oauth.googlecode.com/svn/code/javascript/sha1.js"></script>
		<script type="text/javascript" src="https://rawgithub.com/padolsey/prettyPrint.js/master/prettyprint.js"></script>

		<g:javascript src="js.js" />
		<link rel="text/css" href="${resource(dir:'css', file:'style.css')}">
	</head>
	<body>
		<!-- Example restaurant page -->
		<div data-role="page" id="browse" data-theme="c">
			<div data-role="header" data-id="main" data-position="fixed" data-theme="c">
				<a href="#home" data-role="button" data-icon="home" data-transition="slide" data-direction="reverse">Home</a>
				<h1>Dimes</h1>
				<a href="#settings" data-role="button" data-icon="gear" data-transition="slide">Settings</a>
			</div>
			<div data-role="content">
				<h2> CHOP Chinook </h2>
				<hr>
				<div class="ui-grid-a">
					<div class="ui-block-a">[Dimes Rating]</div>
					<div class="ui-block-b">[Yelp Rating]</div>
				</div>
				<p>Description</p>
				<p>Hours</p>
				<hr>
				<div data-role="controlgroup"  data-type="horizontal" style="margin: 0 auto !important;">
					<a href="#" data-role="button">Add review</a>
					<a href="#" data-role="button">Favorite</a>
				</div>
				<br>
				<ul data-role="listview">
					<li><a href="#">Address</a></li>
					<li><a href="#">How to get there</a></li>
					<li><a href="#">Call</a></li>
					<li><a href="#">More Info</a></li>
				</ul>
				<br>
				<h4>Reviews</h4>
				<hr>
				<p>Posted by Anonymous - [Date]</p>
				[Rating]
				<p>[Gender Icon] This waitress is smokin' hot! Half-Asians are the best after all.</p>

			</div>
			<div data-id="main" data-role="footer" data-position="fixed" data-theme="c">
				<h1>Advertisement</h1>
			</div>
		</div>
	</body>
</html>
