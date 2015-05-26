<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:f="http://java.sun.com/jsf/core"
	xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>inserisci nuova serie</title>
</head>
<body>
	<f:view>
		<div>
			<h:form>
				<div>
					titolo serie:<h:inputText value="#{serieController.name}"/>
				</div>
				<div>
					descrizione:<h:inputText value="#{serieController.description}" />
				</div>
				<div>
					editore:<h:inputText value="#{serieController.editor}" />
				</div>
				<div>
					autore:<h:inputText value="#{serieController.author}" />
				</div>
				<div>
					<h:commandButton value="aggiungi" action="#{serieController.createSerie}" />
				</div>

			</h:form>

		</div>
	</f:view>

</body>
</html>