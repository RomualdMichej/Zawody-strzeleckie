<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h5><a href="/">Powrot na strone glowna</a></h5>

<form action="add" method="get">
    <input type="submit" value="Dodaj zawodnika">
</form>

<table border="1">
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

<c:forEach items="${allCompetitors}" var="competitor">

    <tr>
        <td><h3>${competitor.firstName}</h3></td>
        <td><h3>${competitor.lastName}</h3></td>
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
</c:forEach>

</table>