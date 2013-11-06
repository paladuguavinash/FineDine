
<%@ page import="dimesapp.UserComments" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userComments.label', default: 'UserComments')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userComments" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userComments" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userComments">
			
				<g:if test="${userCommentsInstance?.serverName}">
				<li class="fieldcontain">
					<span id="serverName-label" class="property-label"><g:message code="userComments.serverName.label" default="Server Name" /></span>
					
						<span class="property-value" aria-labelledby="serverName-label"><g:fieldValue bean="${userCommentsInstance}" field="serverName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userCommentsInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="userComments.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${userCommentsInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userCommentsInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="userComments.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${userCommentsInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userCommentsInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="userComments.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${userCommentsInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userCommentsInstance?.restaurant}">
				<li class="fieldcontain">
					<span id="restaurant-label" class="property-label"><g:message code="userComments.restaurant.label" default="Restaurant" /></span>
					
						<span class="property-value" aria-labelledby="restaurant-label"><g:link controller="restaurant" action="show" id="${userCommentsInstance?.restaurant?.id}">${userCommentsInstance?.restaurant?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userCommentsInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="userComments.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${userCommentsInstance?.user?.id}">${userCommentsInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userCommentsInstance?.userRatings}">
				<li class="fieldcontain">
					<span id="userRatings-label" class="property-label"><g:message code="userComments.userRatings.label" default="User Ratings" /></span>
					
						<span class="property-value" aria-labelledby="userRatings-label"><g:fieldValue bean="${userCommentsInstance}" field="userRatings"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userCommentsInstance?.id}" />
					<g:link class="edit" action="edit" id="${userCommentsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
