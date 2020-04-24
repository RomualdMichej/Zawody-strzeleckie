<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Wybierz Konkurencje</title>
</head>

<body>
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<c:choose>
    <c:when test="${not empty eventId}">
        <h2>Dla której konkurencji chcesz wprowadzić wyniki?</h2>


        <form method="post" action="setResult">

            <c:forEach items="${competitionList}" var="competition">

                <input type="hidden" name="competitorId" value="${competitorId}">
                <input type="hidden" name="eventId" value="${eventId}">
                <input type="radio" name="competitionId" value=${competition.id}>
                ${competition.name} <br />

            </c:forEach>

            <input type="submit" value="Zapisz!"/>

        </form>
    </c:when>
    <c:when test="${not empty event}">
        <h2>Wybierz konkurencję do rankingu.</h2>

        <form method="post" action="createRan2">

            <c:forEach items="${competitionList}" var="competition">

<%--                <input type="hidden" name="resultList" value="${resultList}">--%>
                <input type="hidden" name="eventId" value="${event.id}">
                <input type="radio" name="competitionId" value=${competition.id}>
                ${competition.name} <br />

            </c:forEach>

            <input type="submit" value="Zapisz!"/>

        </form>
    </c:when>
    <c:otherwise>
        <h2>Wybierz konkurencję do rankingu.</h2>

        <form method="post" action="createRan">

            <c:forEach items="${competitionList}" var="competition">

                <input type="hidden" name="competitorId" value="${competitorId}">
                <input type="radio" name="competitionId" value=${competition.id}>
                ${competition.name} <br />

            </c:forEach>

            <input type="submit" value="Zapisz!"/>

        </form>
    </c:otherwise>
</c:choose>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>
