<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>SingIn - comiXloan</title>
</head>
<body>
<f:view>
	<h:form>
    	<div>Email: <h:inputText value="#{comixloanController.email}"/></div>
    	<div>Password: <h:inputText value="#{comixloanController.passWord}"/></div>
    	<div>Username: <h:inputText value="#{comixloanController.userName}"/></div>
    	<div>Nome: <h:inputText value="#{comixloanController.name}"/></div>
    	<div>Cognome: <h:inputText value="#{comixloanController.surname}"/></div>
    	<div><h:commandButton value="Registra"  action="#{comixloanController.signIn}"/></div>
	</h:form>
</f:view>
</body>
</html>