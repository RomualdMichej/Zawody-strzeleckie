<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Wybierz Zawody</title>
    <link rel="stylesheet" href="/css/style.css">

</head>

<body class="new">
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<form method="post">

    <c:choose>
        <c:when test="${not empty eventList}">
            <h3 class="biel">Wybierz zawody</h3>


            <p><c:forEach items="${eventList}" var="event">

                <input type="radio" name="eventId" value=${event.id}>
                ${event.name} ${event.date}<br />

            </c:forEach></p>
            <input type="submit" value="Wybierz!"/>

        </c:when>
        <c:otherwise>
            <p>Lista zawdów jest pusta.</p>
        </c:otherwise>
    </c:choose>
</form>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>