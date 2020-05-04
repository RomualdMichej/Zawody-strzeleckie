<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Zawody</title>
    <link rel="stylesheet" href="/css/style.css">
</head>

<body class="new">
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<form action="add" method="get">
    <input type="submit" value="Dodaj zawody">
</form>

<table class="blue">
    <thead>
        <tr>
            <p><th scope="col" class="blue"><h1>Nazwa</h1></th></p>
            <th scope="col"><h1>Data</h1></th>
            <th scope="col"><h1>Godzina rozpoczęcia</h1></th>
            <th scope="col"><h1>Godzina zakończenia</h1></th>
            <th scope="col"><h1>Konkurencje</h1></th>
            <th scope="col"><h1>Opcje</h1></th>
        </tr>
    <thead>
    <tbody>
        <c:forEach items="${allEvents}" var="event">

            <tr>
                <td><h3>${event.name}</h3></td>
                <td class="blue"><h5>${event.date}</h5></td>
                <td><h5>${event.startTime}</h5></td>
                <td><h5>${event.endTime}</h5></td>
                <td>
                    <c:forEach items="${event.competitionList}" var="competition">
                        <h5>${competition.competitionName}</h5>

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
                </form></td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>