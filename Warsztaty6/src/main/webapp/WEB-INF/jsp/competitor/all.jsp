<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Zawodnicy</title>
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
<form action="add" method="get">
    <input type="submit" value="Dodaj zawodnika">
</form>

<table border="1">
    <thead>
        <tr>
            <th scope="col"><h1>Imię</h1></th>
            <th scope="col"><h1>Nazwisko</h1></th>
            <th scope="col"><h1>Numer Legitymacji</h1></th>
            <th scope="col"><h1>Numer Patentu</h1></th>
            <th scope="col"><h1>Nazwa Klubu</h1></th>
            <th scope="col"><h1>Email</h1></th>
            <th scope="col"><h1>Hasło</h1></th>
            <th scope="col"><h1>Opcje</h1></th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${allCompetitors}" var="competitor">

    <tr>
        <td><h5>${competitor.firstName}</h5></td>
        <td><h5>${competitor.lastName}</h5></td>
        <td><h5>${competitor.cardNumber}</h5></td>
        <td><h5>${competitor.patentNumber}</h5></td>
        <td><h5>${competitor.clubName}</h5></td>
        <td><h5>${competitor.email}</h5></td>
        <td><h5>${competitor.password}</h5></td>
         <td><form method="get"
             action="edit">
            <input type="hidden" name="toEditId" value="${competitor.id}">
            <input type="submit" value="Edytuj">
        </form>
        <form method="get"
            action="remove">
            <input type="hidden" name="toRemoveId" value="${competitor.id}">
            <input type="submit" value="Usun">
        </form>
        <form method="get"
              action="addStarts">
            <input type="hidden" name="toAddStarCompetitortId" value="${competitor.id}">
            <input type="submit" value="Wystartuj">
        </form></td>
    </tr>
    </tbody>
</c:forEach>

</table>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>