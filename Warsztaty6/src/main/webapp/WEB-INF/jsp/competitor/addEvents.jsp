<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h5><a href="/">Powrot na strone glowna</a></h5>

<h3>Wybierz zawody:</h3>

<form method="post">

    <c:forEach items="${allEvents}" var="event">

        <input type="hidden" name="competitorId" value="${competitor.id}">
        <input type="radio" name="eventId" value=${event.id}>
        ${event.name} ${event.date}<br />

    </c:forEach>

    <input type="submit" value="Wybierz!"/>

</form>

${competitor.firstName} ${competitor.lastName}<br />
<c:forEach items="${startList}" var="start">
    <form method="get"
          action="reduce">

        <input type="hidden" name="toReduceStartId" value="${start.id}">
        <input type="hidden" name="competitorId" value="${competitor.id}">

        ${start.begin} ${start.event.name}  ${start.competition.name}  ${start.competitor.firstName}

        <input type="submit" value="Usun"></br>

    </form>

</c:forEach>