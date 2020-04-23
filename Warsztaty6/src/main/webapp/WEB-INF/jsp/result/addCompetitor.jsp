<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h5><a href="/">Powrot na strone główna</a></h5>

<form method="post">

    <select name="competitorId">

    <c:forEach items="${allCompetitors}" var="competitor">

        <option value="${competitor.id}">${competitor.fullName}</option>

    </c:forEach>
    </select>

    <input type="submit" value="Wybierz!"/>
</form>
