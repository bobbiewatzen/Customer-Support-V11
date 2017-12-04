<%--@elvariable id="ticketId" type="java.lang.String"--%>
<%--@elvariable id="ticket" type="com.jsun.site.Ticket"--%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jsun" uri="http://www.jsun.com/jsp/tld/jsun" %>
<template:basic htmlTitle="${ticket.subject}"
                bodyTitle="Ticket #${ticketId}: ${ticket.subject}">
    <i>Customer Name - <c:out value="${ticket.customerName}" /><br />
    Created <jsun:formatDate value="${ticket.dateCreated}" type="both"
                             timeStyle="long" dateStyle="full" /></i><br /><br />
    <c:out value="${ticket.body}" /><br /><br />
    <c:if test="${ticket.numberOfAttachments > 0}">
        Attachments:
        <c:forEach items="${ticket.attachments}" var="attachment"
                   varStatus="status">
            <c:if test="${!status.first}">, </c:if>
            <a href="<c:url value="/ticket/${ticketId}/attachment/${attachment.name}" />"><c:out value="${attachment.name}" /></a>
        </c:forEach><br /><br />
    </c:if>
</template:basic>
