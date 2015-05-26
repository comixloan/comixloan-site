<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Home</title>
</head>
<body>
<f:view>
	<h1>${comixloanController.currentUser.userName}</h1>
	<h:form>
		<div>
			<h:commandLink value="Login page" action="#{comixloanController.home}" />
		</div>
		<div>
			<h:commandLink value="Crea Communita" action="createCommunity.jsp" />
		</div>
		<div>
			<h:commandLink value="Visualizza Communita" action="#{communityController.listCommunity}" />
		</div>
	</h:form>
</f:view>
</body>
</html>