<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

    <head>
        <title>Wybierz zawody</title>
        <link rel="stylesheet" href="/css/style.css">

    <%--        <style>--%>
<%--            .new {--%>
<%--                background-color: #111111;--%>
<%--            }--%>

<%--            th, td {--%>
<%--                border: 1px solid black;--%>
<%--                padding: 10px 15px;--%>
<%--                border-collapse: separate;--%>
<%--                background-color: cornflowerblue;--%>
<%--            }--%>
<%--            .tur{--%>
<%--                color: white;--%>
<%--            }--%>
<%--        </style>--%>
    </head>

    <body class="new">
        <%@ include file="/WEB-INF/jsp/header.jsp" %>

        <c:choose>
            <c:when test="${not empty allEvents}">
        <h3 class="tur">Wybierz zawody dla zawodnika ${competitor.firstName} ${competitor.lastName}</h3>

        <form method="post">

            <c:forEach items="${allEvents}" var="event">

                <input type="hidden" name="competitorId" value="${competitor.id}">
                <input type="radio" name="eventId" value=${event.id}>
                <span class="tur">${event.name} ${event.date}</span><br>

            </c:forEach>

            <input type="submit" value="Wybierz!"/>

        </form>
                <table>
                    <thead>
                        <tr>
                            <th scope="col"><h1>Zawody</h1></th>
                            <th scope="col"><h1>Konkurencja</h1></th>
                            <th scope="col"><h1>Godzina startu</h1></th>
                            <th scope="col"><h1>Zrezygnuj</h1></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${startList}" var="start">
                            <tr>
                            <form method="get" action="reduce">
                            <input type="hidden" name="toReduceStartId" value="${start.id}">
                            <input type="hidden" name="competitorId" value="${competitor.id}">
                                <td>${start.event.name}</td>
                                <td>${start.competition.name}</td>
                                <td>${start.begin}</td>
                                <td><input type="submit" value="Zrezygnuj"></td>
                            </form>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p>Lista zawodów jest pusta.</p>
            </c:otherwise>
        </c:choose>

        <%@ include file="/WEB-INF/jsp/footer.jsp" %>
    </body>
</html>
