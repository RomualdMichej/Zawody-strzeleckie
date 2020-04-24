<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h5><a href="/">Powrot na strone glowna</a></h5>

<c:choose>
    <c:when test="${not empty eventId}">
        <h2>Dla której konkurencji chcesz wprowadzić wynikiyyyyyyyyyyyyyyyyy?</h2>


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

<%--<h2>Dla której konkurencji chcesz wprowadzić wyniki?</h2>--%>

<%--<form method="post" action="setResult">--%>

<%--    <c:forEach items="${competitionList}" var="competition">--%>

<%--        <input type="hidden" name="competitorId" value="${competitorId}">--%>
<%--        <input type="hidden" name="eventId" value="${eventId}">--%>
<%--        <input type="radio" name="competitionId" value=${competition.id}>--%>
<%--        ${competition.name} <br />--%>

<%--    </c:forEach>--%>

<%--    <input type="submit" value="Zapisz!"/>--%>

<%--</form>--%>