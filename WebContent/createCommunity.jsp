<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CreazioneCommunity</title>
</head>
<body>
<f:view>
	<h:form>
		<div>Nome: <h:inputText value="#{communityController.name}"/></div>
		<div>Descrizione: <h:inputText value="#{communityController.description}"/></div>
    	<div><h:commandButton value="Crea"  action="#{communityController.createCommunity}"/></div>
	</h:form>
</f:view>
</body>
</html>