
<%@ page import="dimesapp.Restaurant" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'restaurant.label', default: 'Restaurant')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-restaurant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-restaurant" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list restaurant">
			
				<g:if test="${restaurantInstance?.restaurantId}">
				<li class="fieldcontain">
					<span id="restaurantId-label" class="property-label"><g:message code="restaurant.restaurantId.label" default="Restaurant Id" /></span>
					
						<span class="property-value" aria-labelledby="restaurantId-label"><g:fieldValue bean="${restaurantInstance}" field="restaurantId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${restaurantInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="restaurant.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${restaurantInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${restaurantInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="restaurant.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${restaurantInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${restaurantInstance?.rating}">
				<li class="fieldcontain">
					<span id="rating-label" class="property-label"><g:message code="restaurant.rating.label" default="Rating" /></span>
					
						<span class="property-value" aria-labelledby="rating-label"><g:fieldValue bean="${restaurantInstance}" field="rating"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${restaurantInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="restaurant.comments.label" default="Comments" /></span>
					
						<g:each in="${restaurantInstance.comments}" var="c">
						<span class="property-value" aria-labelledby="comments-label"><g:link controller="userComments" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${restaurantInstance?.id}" />
					<g:link class="edit" action="edit" id="${restaurantInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
