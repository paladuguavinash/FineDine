
<%@ page import="dimesapp.User_Comments" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user_Comments.label', default: 'User_Comments')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-user_Comments" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-user_Comments" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user_Comments">
			
				<g:if test="${user_CommentsInstance?.restaurantId}">
				<li class="fieldcontain">
					<span id="restaurantId-label" class="property-label"><g:message code="user_Comments.restaurantId.label" default="Restaurant Id" /></span>
					
						<span class="property-value" aria-labelledby="restaurantId-label"><g:fieldValue bean="${user_CommentsInstance}" field="restaurantId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${user_CommentsInstance?.serverName}">
				<li class="fieldcontain">
					<span id="serverName-label" class="property-label"><g:message code="user_Comments.serverName.label" default="Server Name" /></span>
					
						<span class="property-value" aria-labelledby="serverName-label"><g:fieldValue bean="${user_CommentsInstance}" field="serverName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${user_CommentsInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="user_Comments.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${user_CommentsInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${user_CommentsInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="user_Comments.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${user_CommentsInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${user_CommentsInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="user_Comments.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${user_CommentsInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${user_CommentsInstance?.ratings}">
				<li class="fieldcontain">
					<span id="ratings-label" class="property-label"><g:message code="user_Comments.ratings.label" default="Ratings" /></span>
					
						<span class="property-value" aria-labelledby="ratings-label"><g:fieldValue bean="${user_CommentsInstance}" field="ratings"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${user_CommentsInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user_Comments.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${user_CommentsInstance?.user?.id}">${user_CommentsInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${user_CommentsInstance?.id}" />
					<g:link class="edit" action="edit" id="${user_CommentsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
