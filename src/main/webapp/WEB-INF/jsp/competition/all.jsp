<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

    <head>
        <title>Konkurencje</title>
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
<%--            h3{--%>
<%--                color: white;--%>
<%--            }--%>
<%--        </style>--%>
    </head>

    <body class="new">

    <%@ include file="/WEB-INF/jsp/header.jsp" %>

    <form action="add" method="get">
        <input type="submit" value="Dodaj konkurencję">
    </form>

    <table border="1">
        <thead>
            <tr>
                <th scope="col"><h1>Nazwa</h1></th>
                <th scope="col"><h1>Opis</h1></th>
                <th scope="col"><h1>Ilość osób</h1></th>
                <th scope="col"><h1>Czas trwania</h1></th>
                <th scope="col"><h1>Opcje</h1></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${allCompetitions}" var="competition">

                <tr>
                    <td><h5>${competition.name}</h5></td>
                    <td><h5>${competition.description}</h5></td>
                    <td><h5>${competition.personQuantity}</h5></td>
                    <td><h5>${competition.period}</h5></td>
                    <td><form method="get"
                              action="edit">
                        <input type="hidden" name="toEditId" value="${competition.id}">
                        <input type="submit" value="Edytuj">
                    </form>
                        <form method="get"
                              action="remove">
                            <input type="hidden" name="toRemoveId" value="${competition.id}">
                            <input type="submit" value="Usun">
                        </form></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <%@ include file="/WEB-INF/jsp/footer.jsp" %>
    </body>
</html>