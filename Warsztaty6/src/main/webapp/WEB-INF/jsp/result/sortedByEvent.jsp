<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

    <head>
        <title>Według Zawodów</title>
        <style>
            .new {
                background-color: #111111;
            }

            th, td {
                border: 1px solid black;
                padding: 10px 15px;
                border-collapse: separate;
                background-color: cornflowerblue;
            }
            h3{
                color: white;
            }
        </style>
    </head>

    <body class="new">
    <%@ include file="/WEB-INF/jsp/header.jsp" %>

    <h3>Zawody ${event.name}</h3>
    <h3>Konkurencja ${competition.name}</h3>

    <table border="1">
        <thead>
            <tr>
                <th scope="col"><h1>Miejsce</h1></th>
                <th scope="col"><h1>Zawodnik</h1></th>
                <th scope="col"><h1>Wyniki</h1></th>
                <th scope="col"><h1>Suma</h1></th>
                <th scope="col"><h1>Opcje</h1></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${resultList}" var="result">

                <tr>
                    <td><h5>${result.place}</h5></td>
                    <td><h5>${result.competitor.fullName1} ${result.event.date}</h5></td>
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