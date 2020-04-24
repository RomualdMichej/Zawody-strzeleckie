<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Wybierz Konkurencje</title>
</head>

<body>
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<form method="post">

<c:choose>
    <c:when test="${not empty competitionList}">
        <h3>Wybierz konkurencje</h3>


            <p><c:forEach items="${competitionList}" var="competition">

                <input type="radio" name="competitionId" value=${competition.id}>
                ${competition.name}<br />

            </c:forEach></p>
            <input type="submit" value="Wybierz!"/>

    </c:when>
    <c:otherwise>
        <p>Lista konkurencji jest pusta.</p>
    </c:otherwise>
</c:choose>
</form>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>
