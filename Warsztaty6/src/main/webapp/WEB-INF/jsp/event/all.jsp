<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h5><a href="/">Powrot na strone glowna</a></h5>

<form action="add" method="get">
    <input type="submit" value="Dodaj zawody">
</form>

<table border="1">
<tr>
    <th scope="col"><h1>Nazwa</h1></th>
    <th scope="col"><h1>Data</h1></th>
    <th scope="col"><h1>Godzina rozpoczęcia</h1></th>
    <th scope="col"><h1>Godzina zakończenia</h1></th>
    <th scope="col"><h1>Konkurencje</h1></th>
    <th scope="col"><h1>Opcje</h1></th>
</tr>

<c:forEach items="${allEvents}" var="event">

    <tr>
        <td><h3>${event.name}</h3></td>
        <td><h5>${event.date}</h5></td>
        <td><h5>${event.startTime}</h5></td>
        <td><h5>${event.endTime}</h5></td>
        <td>
            <c:forEach items="${event.competitionList}" var="competition">
<%--                <h5>${competition.competitionName}</h5>--%>
                <a href="addStarts?competitionId=${competition.id}&eventId=${event.id}"><h5>${competition.competitionName}</h5></a>

            </c:forEach>
        </td>
         <td><form method="get"
             action="edit">
            <input type="hidden" name="toEditId" value="${event.id}">
            <input type="submit" value="Edytuj">
        </form>
        <form method="get"
            action="remove">
            <input type="hidden" name="toRemoveId" value="${event.id}">
            <input type="submit" value="Usun">
<%--            <a class="color-header" href="${pageContext.request.contextPath}/delExercise?id=${exercise.id}&title=${exercise.title}">Delete</a></td>--%>
<%--            <a class="color-header" href="remove?toRemoveId=${event.id}"><h5>${competition.competitionName}</h5></a>--%>

        </form></td>
    </tr>
</c:forEach>

</table>