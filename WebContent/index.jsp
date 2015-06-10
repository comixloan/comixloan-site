<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<title>ComiXLoan</title>
</head>
<body>
<f:view>
	<h:panelGroup rendered="#{comixloanController.isLogged()}">
		<h:form>
			<div>
				<h:commandLink action = "./home.jsp" value = "Vai alla home"/>
			</div>
		</h:form>
	</h:panelGroup>
	<h:panelGroup rendered="#{comixloanController.canLogin()}">
		<h:form>
			<div>
				<h:commandLink action = "./signin.jsp" value = "Registrati"/>
			</div>
			<div>
				<h:commandLink action = "./login.jsp" value = "Accedi"/>
			</div>
		</h:form>
	</h:panelGroup>
</f:view>
</body>
</html>