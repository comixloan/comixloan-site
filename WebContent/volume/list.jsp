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
<title>comixloan volumi</title>
</head>
<body>
	<f:view>
		<table>
			<tr>
				<td>serie</td>
				<td>n°volume</td>
			</tr>
			<c:forEach var="volume" items="#{volumeController.listVolume}">
				<tr>
					<td>${volume.serie.name}</td>
					<td>${volume.number}</td>

				</tr>
			</c:forEach>
		</table>

		<div>
			<a href="./searchedSeries">Aggiungi volume</a>
		</div>

	</f:view>

</body>
</html>