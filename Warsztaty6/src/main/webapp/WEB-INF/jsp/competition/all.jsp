<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h5><a href="/">Powrot na strone glowna</a></h5>

<form action="add" method="get">
    <input type="submit" value="Dodaj konkurencję">
</form>

<table border="1">
    <tr>
        <th scope="col"><h1>Nazwa</h1></th>
        <th scope="col"><h1>Opis</h1></th>
        <th scope="col"><h1>Ilość osób</h1></th>
        <th scope="col"><h1>Czas trwania</h1></th>
        <th scope="col"><h1>Opcje</h1></th>
    </tr>

    <c:forEach items="${allCompetitions}" var="competition">

        <tr>
            <td><h3>${competition.name}</h3></td>
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

</table>