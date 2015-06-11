<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registro Loan dell'utente</title>
</head>
<body>
	<f:view>
		<h1>storico prestiti</h1>
		<table>
			<tr>
				<td>prestato a</td>
				<td>Data inizio prestito</td>
				<td>data fine prestito</td>
				<td></td>
			</tr>
			<c:forEach var="historyLoan"
				items="#{historyLoanController.listHistoryLoans}">
				<tr>
					<td>${historyLoan.user}</td>
					<td>${historyloan.dateStart}</td>
					<td>${historyloan.dateEnd}</td>
					<td><h:form>
							<h:commandLink action="#{historyLoanController.info}"
								value="informazioni">
								<f:param name="id" value="#{historyloan.id}" />
							</h:commandLink>
						</h:form></td>
				</tr>
			</c:forEach>
		</table>

	</f:view>


</body>
</html>