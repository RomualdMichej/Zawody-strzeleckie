<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form:form method="post"
           modelAttribute="result">

    <form:hidden path="id"/> <br />
    <form:hidden path="competition"/> <br />
    <form:hidden path="competitor"/> <br />
    <form:hidden path="event"/> <br />
    W10: <form:select path="w10" items="${list}"/><br />

    Wyniki:<br />
    <c:forEach items="${superList}" var="s">

        <form:select path="resultList" items="${s}"/><br />

    </c:forEach>

    <input type="submit" value="Zapisz!"/>

</form:form>