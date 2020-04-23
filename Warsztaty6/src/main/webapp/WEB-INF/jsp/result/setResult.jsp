<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<h2>DODAWANIE WYNIKÓW</h2>


<form:form method="post"
           modelAttribute="result" action="zupa">

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