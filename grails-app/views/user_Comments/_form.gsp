<%@ page import="dimesapp.User_Comments" %>



<div class="fieldcontain ${hasErrors(bean: user_CommentsInstance, field: 'restaurantId', 'error')} ">
	<label for="restaurantId">
		<g:message code="user_Comments.restaurantId.label" default="Restaurant Id" />
		
	</label>
	<g:textField name="restaurantId" maxlength="65" value="${user_CommentsInstance?.restaurantId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: user_CommentsInstance, field: 'serverName', 'error')} ">
	<label for="serverName">
		<g:message code="user_Comments.serverName.label" default="Server Name" />
		
	</label>
	<g:textField name="serverName" maxlength="30" value="${user_CommentsInstance?.serverName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: user_CommentsInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="user_Comments.gender.label" default="Gender" />
		
	</label>
	<g:select name="gender" from="${user_CommentsInstance.constraints.gender.inList}" value="${user_CommentsInstance?.gender}" valueMessagePrefix="user_Comments.gender" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: user_CommentsInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="user_Comments.comments.label" default="Comments" />
		
	</label>
	<g:textField name="comments" value="${user_CommentsInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: user_CommentsInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="user_Comments.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${user_CommentsInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: user_CommentsInstance, field: 'ratings', 'error')} required">
	<label for="ratings">
		<g:message code="user_Comments.ratings.label" default="Ratings" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ratings" type="number" value="${user_CommentsInstance.ratings}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: user_CommentsInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="user_Comments.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${dimesapp.User.list()}" optionKey="id" required="" value="${user_CommentsInstance?.user?.id}" class="many-to-one"/>
</div>

