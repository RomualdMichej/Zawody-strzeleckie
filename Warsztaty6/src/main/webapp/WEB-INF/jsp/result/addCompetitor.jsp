<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>

<h5><a href="/">Powrot na strone glowna</a></h5>

<form method="post">

    <select name="competitorId">

    <c:forEach items="${allCompetitors}" var="competitor">

        <option value="${competitor.id}">${competitor.fullName}</option>

    </c:forEach>
    </select>

    <input type="submit" value="Wybierz!"/>
</form>
