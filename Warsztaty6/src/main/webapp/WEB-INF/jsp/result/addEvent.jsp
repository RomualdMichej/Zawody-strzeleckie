<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Wybiezr zawody</title>
</head>

<body>
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<c:choose>
    <c:when test="${not empty eventList}">
        <h2>Dla których zawodów chcesz wprowadzić wyniki?</h2>

        <form method="post" action="addCompetition">

            <c:forEach items="${eventList}" var="event">

                <input type="hidden" name="competitorId" value="${competitorId}">
                <p><input type="radio" name="eventId" value=${event.id}>
                        ${event.name} ${event.date}</p>

            </c:forEach>

            <input type="submit" value="Zapisz!"/>

        </form>

    </c:when>
    <c:otherwise>
        <p>Ten zawodnik nie startuje w żadnej konkurencji.</p>
    </c:otherwise>
</c:choose>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>
