
<%@ page import="dimesapp.Restaurant" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'restaurant.label', default: 'Restaurant')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-restaurant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-restaurant" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="restaurantId" title="${message(code: 'restaurant.restaurantId.label', default: 'Restaurant Id')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'restaurant.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'restaurant.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="rating" title="${message(code: 'restaurant.rating.label', default: 'Rating')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${restaurantInstanceList}" status="i" var="restaurantInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${restaurantInstance.id}">${fieldValue(bean: restaurantInstance, field: "restaurantId")}</g:link></td>
					
						<td>${fieldValue(bean: restaurantInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: restaurantInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: restaurantInstance, field: "rating")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${restaurantInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
