<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Info Loan</title>
</head>
<body>
<f:view>
	<h1>Informazioni</h1>
	
	<div>
		<b>Username: </b> ${loanController.currentLoan.user.userName}
	</div>
	
	<div>
		<table>
			<tr>
				<td>Serie</td>
				<td>Volume</td>
			</tr>
			<c:forEach var = "v" items = "#{loanController.currentLoan.volumes}">
				<tr>
					<td>${v.serie.name}</td>
					<td>${v.number}</td>
				</tr>
			</c:forEach>
		</table>
		
		<h:form>
			<h:commandLink action="#{loanController.giveBack}" value="Segna come restituito">
				<f:param name = "id" value = "#{loanController.currentLoan.id}"/>
			</h:commandLink>
		</h:form>
	</div>
</f:view>
</body>
</html>