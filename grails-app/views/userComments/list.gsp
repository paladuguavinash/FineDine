
<%@ page import="dimesapp.UserComments" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userComments.label', default: 'UserComments')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userComments" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userComments" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="serverName" title="${message(code: 'userComments.serverName.label', default: 'Server Name')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'userComments.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="comments" title="${message(code: 'userComments.comments.label', default: 'Comments')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'userComments.date.label', default: 'Date')}" />
					
						<th><g:message code="userComments.restaurant.label" default="Restaurant" /></th>
					
						<th><g:message code="userComments.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userCommentsInstanceList}" status="i" var="userCommentsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userCommentsInstance.id}">${fieldValue(bean: userCommentsInstance, field: "serverName")}</g:link></td>
					
						<td>${fieldValue(bean: userCommentsInstance, field: "gender")}</td>
					
						<td>${fieldValue(bean: userCommentsInstance, field: "comments")}</td>
					
						<td><g:formatDate date="${userCommentsInstance.date}" /></td>
					
						<td>${fieldValue(bean: userCommentsInstance, field: "restaurant")}</td>
					
						<td>${fieldValue(bean: userCommentsInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userCommentsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
