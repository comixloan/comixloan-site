<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Loan</title>
</head>
<body>
<f:view>
	<h1>Loan</h1>
	
	<table>
		<tr>
			<td>Utente</td>
			<td>Data Prestito</td>
			<td></td>
		</tr>
		<c:forEach var = "loan" items = "#{loanController.userLoans}">
			<tr>
				<td>${loan.user.userName}</td>
				<td>${loan.startDate}</td>
				<td>
					<h:form>
						<h:commandLink action="#{loanController.giveBack}" value="Segna come restituito">
							<f:param name = "id" value = "#{loan.id}"/>
						</h:commandLink>
					</h:form>
					
					<h:form>
						<h:commandLink action="#{loanController.getLoanInformation}" value="Informazioni">
							<f:param name = "id" value = "#{loan.id}"/>
						</h:commandLink>
					</h:form>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<div>
		<a href = "<c:url value="/faces/loan/add.jsp"/>">Crea nuovo prestito</a>
	</div>
</f:view>
</body>
</html>