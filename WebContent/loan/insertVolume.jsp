<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>inserisci i volumi</title>
</head>
<body>
	<f:view>
		<h1>${LoanController.currentLoan.id}</h1>
		<div>
			<h1>cosa c'è nello Zaino?</h1>
			<table>
				<tr>
					<td>serie</td>
					<td>n volume</td>
					<td></td>
				</tr>
				<c:forEach var="volume"
					items="#{loanController.currentLoan.volumes}">
					<tr>
						<td>${volume.serie.name}</td>
						<td>${volume.number}</td>
						<td><h:form>
								<h:commandButton value="rimuovi"
									action="#{loanController.removeVolume}">
									<f:param name="idVolume" value="#{loan.idVolume}" />
								</h:commandButton>
							</h:form></td>


					</tr>
				</c:forEach>
			</table>
			<a href='<c:url value="/faces/list.jsp" />'>completa il prestito</a>
		</div>
		<div>
			<h:form>

				<h:inputText value="#{LoanController.nameSerie}" />
				<h:commandButton value="cerca"
					action="#{LoanController.searchSeries}" />
			</h:form>
		</div>

		<div>
			<h:form>
				<c:forEach var="serie" items="#{loanController.series2Volumes}">
					<div>
						<h4>${serie.key}</h4>
						<h:selectManyCheckbox layout="pageDirection"
							value="#{loanController.checkBoxVolumes}">
							<c:forEach var="volume" items="${serie.value}">
								<f:selectItem itemLabel="Volume # #{volume.number}"
									itemValue="#{volume.id}" />
							</c:forEach>
						</h:selectManyCheckbox>
					</div>
				</c:forEach>
				<h:commandButton value="aggiungi a zaino"
					action="#{loanController.addVolume}" />
			</h:form>
		</div>

	</f:view>
</body>
</html>