<%@ page import="dimesapp.Restaurant" %>



<div class="fieldcontain ${hasErrors(bean: restaurantInstance, field: 'restaurantId', 'error')} required">
	<label for="restaurantId">
		<g:message code="restaurant.restaurantId.label" default="Restaurant Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="restaurantId" required="" value="${restaurantInstance?.restaurantId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: restaurantInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="restaurant.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${restaurantInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: restaurantInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="restaurant.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${restaurantInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: restaurantInstance, field: 'rating', 'error')} required">
	<label for="rating">
		<g:message code="restaurant.rating.label" default="Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rating" type="number" value="${restaurantInstance.rating}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: restaurantInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="restaurant.comments.label" default="Comments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${restaurantInstance?.comments?}" var="c">
    <li><g:link controller="userComments" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="userComments" action="create" params="['restaurant.id': restaurantInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userComments.label', default: 'UserComments')])}</g:link>
</li>
</ul>

</div>

