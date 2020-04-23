<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form:form method="post"
           modelAttribute="startList">


    <c:forEach items="${startList}" var="start">

        <h1>${start.begin}</h1>

    </c:forEach>


</form:form>