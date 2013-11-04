
<%@ page import="dimesapp.User_Comments" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user_Comments.label', default: 'User_Comments')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-user_Comments" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-user_Comments" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="restaurantId" title="${message(code: 'user_Comments.restaurantId.label', default: 'Restaurant Id')}" />
					
						<g:sortableColumn property="serverName" title="${message(code: 'user_Comments.serverName.label', default: 'Server Name')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'user_Comments.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="comments" title="${message(code: 'user_Comments.comments.label', default: 'Comments')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'user_Comments.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="ratings" title="${message(code: 'user_Comments.ratings.label', default: 'Ratings')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${user_CommentsInstanceList}" status="i" var="user_CommentsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${user_CommentsInstance.id}">${fieldValue(bean: user_CommentsInstance, field: "restaurantId")}</g:link></td>
					
						<td>${fieldValue(bean: user_CommentsInstance, field: "serverName")}</td>
					
						<td>${fieldValue(bean: user_CommentsInstance, field: "gender")}</td>
					
						<td>${fieldValue(bean: user_CommentsInstance, field: "comments")}</td>
					
						<td><g:formatDate date="${user_CommentsInstance.date}" /></td>
					
						<td>${fieldValue(bean: user_CommentsInstance, field: "ratings")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${user_CommentsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
