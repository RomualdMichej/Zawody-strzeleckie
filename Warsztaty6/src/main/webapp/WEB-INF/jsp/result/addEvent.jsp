<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h5><a href="/">Powrot na strone glowna</a></h5>

<h2>Dla których zawodów chcesz wprowadzić wyniki?</h2>

<form method="post" action="addCompetition">

    <c:forEach items="${eventList}" var="event">

        <input type="hidden" name="competitorId" value="${competitorId}">
        <input type="radio" name="eventId" value=${event.id}>
        ${event.name} ${event.date}<br />

    </c:forEach>

    <input type="submit" value="Zapisz!"/>

</form>