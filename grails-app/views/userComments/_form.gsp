<%@ page import="dimesapp.UserComments" %>



<div class="fieldcontain ${hasErrors(bean: userCommentsInstance, field: 'serverName', 'error')} ">
	<label for="serverName">
		<g:message code="userComments.serverName.label" default="Server Name" />
		
	</label>
	<g:textField name="serverName" maxlength="30" value="${userCommentsInstance?.serverName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userCommentsInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="userComments.gender.label" default="Gender" />
		
	</label>
	<g:select name="gender" from="${userCommentsInstance.constraints.gender.inList}" value="${userCommentsInstance?.gender}" valueMessagePrefix="userComments.gender" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userCommentsInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="userComments.comments.label" default="Comments" />
		
	</label>
	<g:textField name="comments" value="${userCommentsInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userCommentsInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="userComments.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${userCommentsInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: userCommentsInstance, field: 'restaurant', 'error')} required">
	<label for="restaurant">
		<g:message code="userComments.restaurant.label" default="Restaurant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="restaurant" name="restaurant.id" from="${dimesapp.Restaurant.list()}" optionKey="id" required="" value="${userCommentsInstance?.restaurant?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userCommentsInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="userComments.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${dimesapp.User.list()}" optionKey="id" required="" value="${userCommentsInstance?.user?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userCommentsInstance, field: 'userRatings', 'error')} required">
	<label for="userRatings">
		<g:message code="userComments.userRatings.label" default="User Ratings" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="userRatings" type="number" value="${userCommentsInstance.userRatings}" required=""/>
</div>

