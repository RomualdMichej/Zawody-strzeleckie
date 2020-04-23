<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h5><a href="/">Powrot na strone glowna</a></h5>

<form action="addEvent" method="get">
    <input type="submit" value="Dodaj zawody">
</form>

<table border="1">
    <tr>
        <th scope="col"><h1>Zawodni</h1></th>
        <th scope="col"><h1>Komkurencja</h1></th>
        <th scope="col"><h1>Wyniki</h1></th>
        <th scope="col"><h1>Suma</h1></th>
        <th scope="col"><h1>Dziesiątki wewnętrzne</h1></th>
        <th scope="col"><h1>Opcje</h1></th>
    </tr>

    <c:forEach items="${resultList}" var="result">

        <tr>
            <td><h3>${result.competitor.fullName}</h3></td>
            <td><h5>${result.competition.name}</h5></td>
            <td><h5>${result.resultList}</h5></td>
            <td><h5>${result.sum}</h5></td>
            <td><h5>${result.w10}</h5></td>

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