<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Wyedług Konkurencji</title>
</head>

<body>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<c:choose>
<c:when test="${not empty resultList}">
<h3>Konkurencja ${competition.name}</h3>

<table border="1">
    <tr>
        <th><h1>Miejsce</h1></th>
        <th><h1>Uczestnik</h1></th>
        <th><h1>Zawody</h1></th>
        <th><h1>Wyniki</h1></th>
        <th><h1>Suma</h1></th>
        <th ><h1>Opcje</h1></th>
    </tr>

    <c:forEach items="${resultList}" var="result">

        <tr>
            <td><h5>${result.place}</h5></td>
            <td><h3>${result.competitor.fullName1}</h3></td>
            <td><h5>${result.event.name} ${result.event.date}</h5></td>
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

</table>

</c:when>
    <c:otherwise>
        Lista wyników dla tej konkurencji jest pusta.
    </c:otherwise>
</c:choose>
<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>