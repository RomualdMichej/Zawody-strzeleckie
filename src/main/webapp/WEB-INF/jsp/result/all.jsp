<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Zawody</title>
</head>

<body>
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<form action="addEvent" method="get">
    <input type="submit" value="Dodaj wynik">
</form>

<table border="1">
    <thead>
    <tr>
        <th><h1>Zawodni</h1></th>
        <th><h1>Komkurencja</h1></th>
        <th><h1>Wyniki</h1></th>
        <th><h1>Suma</h1></th>
        <th><h1>Opcje</h1></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${resultList}" var="result">

        <tr>
            <td><h3>${result.competitor.fullName}</h3></td>
            <td><h5>${result.competition.name}</h5></td>
            <td><h5>${result.resultList}</h5></td>
            <td><h5>${result.sum}</h5></td>

            <td><form method="get"
                      action="edit">
                <input type="hidden" name="toEditId" value="${result.id}">
                <input type="submit" value="Edytuj">
            </form>
                <form method="get"
                      action="remove">

                    <input type="hidden" name="toRemoveId" value="${result.id}">
                    <input type="submit" value="Usun">

                </form></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>