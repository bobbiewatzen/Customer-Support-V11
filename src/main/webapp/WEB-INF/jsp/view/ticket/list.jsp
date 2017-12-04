<%--@elvariable id="ticketDatabase" type="java.util.Map<Integer, com.jsun.site.Ticket>"--%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jsun" uri="http://www.jsun.com/jsp/tld/jsun" %>
<template:basic htmlTitle="Tickets" bodyTitle="Tickets">
    <c:choose>
        <c:when test="${fn:length(tickets) == 0}">
            <i>There are no tickets in the system.</i>
        </c:when>
        <c:otherwise>
            <c:forEach items="${tickets}" var="ticket">
                Ticket ${ticket.id}:
                <a href="<c:url value="/ticket/view/${ticket.id}" />">
                <c:out value="${jsun:abbreviateString(ticket.subject, 60)}"/>
                </a><br />
                <c:out value="${ticket.customerName}" /> created ticket
                <jsun:formatDate value="${ticket.dateCreated}" type="both"
                                 timeStyle="short" dateStyle="medium" /><br />
                <br />
            </c:forEach>
        </c:otherwise>
    </c:choose>
</template:basic>
