<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:f="http://java.sun.com/jsf/core"
	xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Serie trovate</title>
</head>
<body>
	<f:view>
		<h3>Cerca la serie</h3>
		<h:form>
			<div>
				<h:inputText value="#{serieController.querySerie}" />
				<h:commandButton action="#{serieController.searchSerie}"
					value="cerca" />
			</div>
		</h:form>
		<div>
			<table>
				<tr>
					<td>nome</td>
					<td>autore</td>
					<td>cliccherai qui</td>
				</tr>
				<c:forEach var="serie" items="#{serieController.listSeries}">
					<tr>
						<td>${serie.name}</td>
						<td>${serie.author}</td>
						<td><h:form>
								<h:commandButton action="#{serieController.selectSerie}"
									value="Selezione">
									<f:param name="id" value="#{serie.id}" />
								</h:commandButton>
							</h:form></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div>
			<h3>non hai trovato la serie?</h3>
			<h:form>
				<h:commandButton action="./insertSerie.jsp" value="crea nuova serie" />
			</h:form>
		</div>
	</f:view>
</body>
</html>